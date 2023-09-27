---
title: The Authors of MRU's Write Club
permalink: /contributors/
sidebar: none
---

{% for author in site.authors %}
  <img src="{{author.image}}"
       width="200"
       height="auto"
       alt="Photo of {{author.title}}"
       style="display: block; margin-left: auto; margin-right: auto;" />
  <h2 style="text-align: center;">
    <a href="{{ author.url }}" style="text-align: center;">
      {{ author.title }}
    </a>
  </h2>
  <p>{{ author.content | markdownify }}</p>
  <hr style="text-align: center;"/>
{% endfor %}
