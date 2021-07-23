---
title: "Getting started with the Unidata Documentation Theme for Jekyll"
layout: page
toc: false
sidebar: unidata_sidebar
permalink: index.html
---

{% capture rmd %}{% includefile README.md %}{% endcapture %}
{{ rmd | liquify | markdownify }}
