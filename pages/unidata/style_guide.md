---
title: Style guide
last_updated: 2021-04-01
toc: false
sidebar: unidata_sidebar
permalink: style.html
---

{% capture rmd %}{% includefile pages/unidata/shared_content/headings.inc %}{% endcapture %}
{{ rmd | liquify | markdownify }}

## Technical jargon

italicize jargon on first use:

_catalog roots_

_client catalog_

_configuration catalog_

~~~md
_catalog roots_

_client catalog_

_configuration catalog_
~~~

inline text html, xml elements, properties, code variables, snippets, file paths, surround in back ticks, like this:

`<catalog>`

~~~md
`<catalog>`
~~~

## Keeping git diffs clean

One line of text per line in file.
A blank line is needed for new paragraph, so no formatting issues in doing this.
This keeps git diff clean

~~~md
One line of text per line in file.
A blank line is needed for new paragraph, so no formatting issues in doing this.
This keeps git diff clean
~~~