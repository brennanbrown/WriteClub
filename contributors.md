---
title: Our Writers
permalink: /contributors/
sidebar: none
---

<style>
    .centered {
        text-align: center;
    }

    img.centered-img {
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
</style>

{% for author in site.authors %}
<div class="centered">
    <img src="{{author.image}}"
         width="200"
         height="auto"
         alt="Photo of {{author.title}}"
         class="centered-img" />
    <h2>
        <a href="{{ author.url }}">
            {{ author.title }}
        </a>
    </h2>
</div>
<p>{{ author.content | markdownify }}</p>
<hr/>
{% endfor %}
