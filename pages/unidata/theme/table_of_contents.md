---
title: Table Of Contents 
last_updated: 2021-04-02
toc: true
sidebar: unidata_sidebar
permalink: toc.html
---

## In-Page Navigation

You can add in-page navigation by enabling the [Table Of Contents](https://github.com/ghiculescu/jekyll-table-of-contents){:target='_blank'} feature.

### How To Enable

This will change the theme from a 2-column layout to a 3-column and add the Table Of Contents as a 3rd column on the right of the page.

To enable, denote the `toc` value at the top of the markdown page as `true`:

~~~
---
title: Table Of Contents 
last_updated: 2021-04-02
toc: true
sidebar: unidata_sidebar
permalink: toc.html
---
~~~

## Creating TOC Entries

The Table Of Contents is build using the headers (`h2`, `h3`, `h4`) within the markdown page.
Nested headers tags will also be included. 

For example, the following:

```
## Title
## Page 1
### Note on Paragraph 3
## Page 2
### Note on Paragraph 2
### Note on Paragraph 4
```

will render this Table Of Contents in the right column of the page:

{% include image.html file="table_of_contents.png" alt="TOC" caption="" %}