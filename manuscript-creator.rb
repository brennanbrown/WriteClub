# Purpose: This script is designed for Jekyll blog sites to compile all blog posts into a single Markdown file. 
# It's particularly useful for creating a manuscript or a collective document of all blog entries.
# The script reads posts from the '_posts' directory, which are organized by year, extracts the title and author,
# and then sorts them alphabetically by the author's name. The YAML frontmatter is removed from each post, 
# and the title and author are appended at the beginning of each post's content in the final manuscript.

# to run: ruby manuscript-creator.rb

require 'yaml'

# Set to the current directory (indicated by "."), assuming the script is placed in the root directory of the Jekyll site.
jekyll_root = "."

# Path to the _posts directory
posts_directory = File.join(jekyll_root, "_posts")

# The output file for the compiled manuscript
output_file = File.join(jekyll_root, "manuscript.md")

# Function to extract title, author, and content from a post
# It removes the YAML frontmatter and prepares the content for the manuscript.
def extract_post_info(post_path)
  content = File.read(post_path)
  frontmatter_end = content.index("---", 3) + 3
  frontmatter = YAML.load(content[0..frontmatter_end])
  author = frontmatter["author"] || "unknown"
  title = frontmatter["title"] || "Untitled"
  [author, title, content[frontmatter_end + 1..-1]]
end

# Read all posts and sort them by author
posts = Dir.glob(File.join(posts_directory, "**", "*.md")).map do |post|
  extract_post_info(post)
end.sort_by { |author, _, _| author.downcase }

# Write the sorted posts to the output file
File.open(output_file, "w") do |file|
  posts.each do |author, title, content|
    file.puts "## #{title}\n### #{author}\n\n"
    file.puts content
    file.puts "\n\n---\n\n" # Optionally add some space between posts
  end
end

puts "Manuscript has been created at #{output_file}"
