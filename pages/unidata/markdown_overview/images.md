---
title: Images
last_updated: 2021-04-01
sidebar: unidata_sidebar
toc: false
permalink: images.html
---

To include an image, use the following:

~~~md
{%raw%}{% include image.html file="<location of image relative to images/>" alt="alt text" caption="caption" %}{%endraw%}
~~~

Note that you must always include a caption, even if it is empty.
For example, to link to the image `$PATH_TO_GIT_REPO/images/sl_website-under-construction.jpeg`:

{% include image.html file="sl_website-under-construction.jpeg" alt="alt text" caption="" %}

~~~md
{%raw%}{% include image.html file="sl_website-under-construction.jpeg" alt="alt text" caption="" %}{%endraw%}
~~~

To add an image in-line, like this &rarr; {% include inline_image.html file="subfolder/Save.jpg" alt="Save button" %}, use:

~~~md
{%raw%}{% include inline_image.html file="subfolder/Save.jpg" alt="Save button" %}{%endraw%}
~~~
