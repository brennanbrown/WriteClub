---
title: Our Writers
permalink: /contributors/
sidebar: none
---

{% for author in site.authors %}
  <img src="{{author.image}}"
     width="200"
     height="auto"
     alt="Photo of {{author.title}}" />
  <h2>
    <a href="{{ author.url }}">
      {{ author.title }}
    </a>
  </h2>
  <p>{{ author.content | markdownify }}</p>
  <hr/>
{% endfor %}
