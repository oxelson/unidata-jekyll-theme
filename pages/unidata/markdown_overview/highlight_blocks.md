---
title: Highlight Blocks
last_updated: 2021-04-01
sidebar: unidata_sidebar
toc: false
permalink: highlight_blocks.html
---

These templates live under the top level `_includes/` directory.
Here is what is available:

{%include troubleshooting.html content="
Troubleshooting block.
" %}

{%include note.html content="
Note block.
" %}

{%include info.html content="
Info block.
" %}

{%include important.html content="
Important block.
" %}

{%include question.html content="
Question block.
" %}

{%include ahead.html content="
Thinking ahead block
" %}

{%include warning.html content="
Warning block
" %}

```
{%raw%}{%include troubleshooting.html content="
Troubleshooting block.
" %}{%endraw%}

{%raw%}{%include note.html content="
Note block.
" %}{%endraw%}

{%raw%}{%include info.html content="
Info block.
" %}{%endraw%}

{%raw%}{%include important.html content="
Important block.
" %}{%endraw%}

{%raw%}{%include question.html content="
Question block.
" %}{%endraw%}

{%raw%}{%include ahead.html content="
Thinking ahead block
" %}{%endraw%}

{%raw%}{%include warning.html content="
Warning block
" %}{%endraw%}
```

Note - if you want to include a link inside a highlight block that opens in a new window, you will need to use actual html, like:

~~~md
{%raw%}<a href=\"https://tomcat.apache.org/tomcat-8.0-doc/config/realm.html\" target=\"_blank\">{%endraw%}
~~~

So, for example:

~~~md
{%raw%}{%include ahead.html content="{%endraw%}
{%raw%}Tomcat Realms:{%endraw%}
{%raw%}A <a href=\"https://tomcat.apache.org/tomcat-8.0-doc/config/realm.html\" target=\"_blank\">realm</a> element represents a database of usernames, passwords, and roles (similar to Unix groups) assigned to those users.{%endraw%}
{%raw%}" %}{%endraw%}
~~~

looks like:

{%include ahead.html content="
Tomcat Realms:
A <a href=\"https://tomcat.apache.org/tomcat-8.0-doc/config/realm.html\" target=\"_blank\">realm</a> element represents a database of usernames, passwords, and roles (similar to Unix groups) assigned to those users.
" %}
