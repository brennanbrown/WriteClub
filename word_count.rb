# This Ruby script is part of the Write Club's GitHub repository.
# It recursively counts the words in each .md file within a specified directory and its subdirectories,
# then outputs the total word count.
#
# The script is designed to be run from the command line by providing the directory path as an argument.
# For example:
#   ruby word_count.rb path/to/your/directory

require 'find'

def word_count(file_path)
  text = File.read(file_path)
  words = text.split(/\s+/).reject(&:empty?)
  words.size
end

def count_words_in_directory(directory)
  total_words = 0
  Find.find(directory) do |path|
    if FileTest.directory?(path)
      if File.basename(path)[0] == '.'
        Find.prune
      else
        next
      end
    else
      if File.extname(path) == ".md"
        puts "Counting words in: #{path}"
        total_words += word_count(path)
      end
    end
  end
  total_words
end

directory = ARGV[0]

if directory.nil?
  puts "Please provide the directory path as an argument."
  exit
end

unless File.directory?(directory)
  puts "Invalid directory path."
  exit
end

total_words = count_words_in_directory(directory)
puts "Total word count in .md files: #{total_words}"
