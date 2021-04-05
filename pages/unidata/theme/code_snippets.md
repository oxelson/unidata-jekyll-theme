---
title: Include code snippets contained elsewhere in the project
last_updated: 2021-04-01
toc: false
sidebar: unidata_sidebar
permalink: code_snippets.html
---
To import code snippets directly from project files, use the `"includecodeblock"` tag.
The tag takes the following arguments:
- name of the project home directory
- path to the file containing the code snippet, relative to the home directory
- either:
    - name of a function to include
    - first and last line numbers of code to include

Arguments to the tag are separated by the '&' character.

For example, including the function `openNCFile` from `unidata-jekyll-theme/source_code_snippet/ReadingCdmTutorial.java`
would be written like this:

~~~md
{% raw %}
{% capture rmd %}
{% includecodeblock unidata-jekyll-theme&source_code_snippet/ReadingCdmTutorial.java&openNCFile %}
{% endcapture %}
{{ rmd | markdownify }}
{% endraw %}
~~~

The markdownified text would look like this:
{% capture rmd %}
{% includecodeblock unidata-jekyll-theme&source_code_snippet/ReadingCdmTutorial.java&openNCFile %}
{% endcapture %}
{{ rmd | markdownify }}

Alternatively, to include the same code snippet by line number:
~~~md
{% raw %}
{% capture rmd %}
{% includecodeblock unidata-jekyll-theme&source_code_snippet/ReadingCdmTutorial.java&33&38 %}
{% endcapture %}
{{ rmd | markdownify }}
{% endraw %}
~~~

The include-by-line-numbers option is provided since not all documented code can be isolated in a function.
However, when code blocks are included by function name, the blocks will update automatically
if the code is edited such that the line numbers change; for code blocks included by line numbers,
markdown files will need to be manually updated.

To exclude lines of Java code from the documentation, add the `/* DOCS-IGNORE */` tag to the line.
For example, the following function:

~~~java
 public static Array readAllVarData(Variable v) throws IOException {
    Array data = v.read();
    return data; /* DOCS-IGNORE */
  }
~~~

will render as:

{% capture rmd %}
{% includecodeblock unidata-jekyll-theme&source_code_snippet/ReadingCdmTutorial.java&readAllVarData %}
{% endcapture %}
{{ rmd | markdownify }}

The allows code included in the documentation to log or return values for the purpose of testing.

Conversely, the `/* INSERT ... */` tag will render enclosed text in the documentation, for example:

~~~java
/* INSERT private */ArrayInt.D1 dateArray;
~~~

will render as:

~~~java
private ArrayInt.D1 dateArray;
~~~