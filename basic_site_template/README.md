# Minimal Site Quickstart

This directory contains a minimal site example.
Use this to bootstrap a new documentation site.

## Getting Started

To get started with this site template, follow these steps:

1. Bootstrap your documentation by copying the contents of this directory into the new project documentation directory.
2. If using Ruby to build the site, run `bundle install` to install the required gems.
3. Run `bundle exec jekyll serve` to build and serve the site locally.

## General Layout

Documentation pages are written in Markdown and are stored in the `pages/` directory.
Each Markdown file contains a front matter block that controls important page settings.
For exmaple, the main page of this example site is `pages/main_page.md`.
The front matter block looks like this:

~~~md
---
title: Main Page
last_updated: 2026-02-26
sidebar: sample_sidebar
toc: false
permalink: index.html
---
~~~

This defines the title of the page, the last updated date, which sidebar, if any, should be displayed, and if the table of contents should be displayed.
Most importantly, it defines the `permalink` for the page, which is used to reference this page from other pages as well as sidebars.
No matter what the structure of the Markdown file layout under `pages/` is, Jekyll will generate static site of flat HTML files named using the `permalink` value.
The static site is generated in the `_site/` directory.
For our "main page", the permalink is `index.html`.
When used in other documentation pages, simply refer to the permalink (see `pages/sample_page.md`).
When used in a sidebar, prefix the permalink with a `/` (see `_data/sidebars/sample_sidebar.yml`).
Sidebars are defined in `_data/sidebars/` and are referenced in `_config.yml`.
If you want to rename a sidebar, or use multiple sidebars, make sure they are properly defined in `_config.yml`.

A very basic .gitignore file for a documentation project would look something like:

```shell
_site
.jekyll-cache
Gemfile.lock
```

If there are files inside this top level documentation directory that you do not want to be included in the static site, be sure to exclude them using the `exclude` config in `_config.yml`.

For more information on how to use this theme, please visit the [Unidata Jekyll Theme documentation](https://unidata.github.io/unidata-jekyll-theme/).
