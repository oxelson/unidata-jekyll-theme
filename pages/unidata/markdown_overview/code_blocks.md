---
title: Code Blocks
last_updated: 2026-06-01
toc: false
sidebar: unidata_sidebar
permalink: code_blocks.html
---

## Code Block Syntax

Use triple tildes (~~~) or triple backticks (```) to wrap your code:

```none
    ```bash
    ldmadmin status
    ```
```

or

~~~none
    ~~~bash
    ldmadmin status
    ~~~
~~~

will result in a code block:

```bash
ldmadmin status
```

## Code Block Language Label

The language you specify right after the opening triple tilde or backticks delimiter will be displayed at the top of the code block.  

### When You Don't Use A Language Label

If you don't specify a language for your code block:

```none
    ```
    your code block content here
    ```
```

will result in the term `PLAINTEXT` will be shown for the code block:

```
your code block content here
```

### How To Omit The Language Label

To omit a language label altogether, use the word `none` after the delimiter:

```none
    ```none
    your code block content here
    ```
```

which will result in:

```noned
your code block content here
```

{%include note.html content="
Mispelling or specifying a non-standard language after the delimiter will also result in no label being displayed for the code block.
" %}
