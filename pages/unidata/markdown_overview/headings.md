---
title: Headings
last_updated: 2021-04-01
sidebar: unidata_sidebar
toc: false
permalink: headings.html
---

{% capture rmd %}{% includefile pages/unidata/shared_content/headings.inc %}{% endcapture %}
{{ rmd | liquify | markdownify }}

Headings, and their level number, are denoted by the number of hashtags on a line:

# level 1
## level 2
### level 3

~~~md
# level 1
## level 2
### level 3
~~~

Even though you can add level 1 headings, you should resist and start with level 2 headings in your documentation.