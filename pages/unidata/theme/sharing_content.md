---
title: Sharing content between markdown files
last_updated: 2021-04-01
toc: false
sidebar: unidata_sidebar
permalink: sharing_content.html
---

In order to link the same content in multiple markdown files, you need to keep the actual markdown content in a separate file without frontmatter.
This can be done using a custom plugin that comes with the Unidata jekyll theme.
For example, information about how to handle headings using markdown is duplicated between the [Markdown Overview](overview.html#headings) and the [Style Guide](style.html#headings) pages.
The way this works is that the content about how to use headings in stored in the file `pages/unidata/sharing_content.md`, which looks like this:
{% capture rmd %}{% includefile pages/unidata/shared_content/headings.inc %}{% endcapture %}
~~~markdown
{{ rmd | rstrip }}
~~~

Then, the `includefiles` plugin is used to insert the content wherever it should be used.
For example, the beginning of the style guide markdown file (located at `pages/unidata/style_guide.md`) looks like:

~~~md
---
title: Style guide
last_updated: 2021-04-01
toc: false
sidebar: unidata_sidebar
permalink: style.html
---

{% raw %}
{% capture rmd %}{% includefile pages/unidata/shared_content/headings.inc %}{% endcapture %}
{{ rmd | liquify | markdownify }}
{% endraw %}

## Technical jargon

...
~~~

and the relevant part of the Markdown Overview markdown file (located at `pages/netcdfJava/developer/DocGuide.md`) looks like:

~~~markdown
---
title: Markdown Overview
last_updated: 2021-04-01
toc: true
sidebar: unidata_sidebar
permalink: overview.html
---

## General Kramdown Syntax

...

Here are some highlights to get you going.
{% raw %}
{% capture rmd %}{% includefile pages/unidata/shared_content/headings.inc %}{% endcapture %}
{{ rmd | liquify | markdownify }}
{% endraw %}
## links

General format is:
...
~~~

Note that in both cases, the content of the file is stored into a liquid variable called `rmd` using `capture`.
Then, the variable is passed through a `liquify` filter, which will process any liquid templates contained within the markdown.
After the `liquify` filter, the resulting text is passed through the `markdownify` filter, which turns the markdown into html.bv