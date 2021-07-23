---
title: Sidebars
last_updated: 2021-04-02
toc: false
sidebar: unidata_sidebar
permalink: sidebars.html
---

Sidebar are defined using `YAML` files stored in `_data/sidebars/`.
For example, the sidebar used for this page is `_data/sidebars/unidata_sidebar.yml`.
If you add a new sidebar, you will need to make sure to add it to the `_config.yml` file at the top level of the docs directory.

The Sidebar will be assigned a title based on the following, if defined (in order of precedence):
* The value of the `product` key associated with the first `title` key under `entries` in the sidebar yaml file
* The value of the first `title` key under `entries` in the sidebar yaml file
* The value of `site_title` defined in `_config.yml`

If version information is found, it will be added to the sidebar title based on the following (in order of precedence)
* The value of the `version` key associated with the first `title` key under `entries` in the sidebar yaml file
* The value of `docset_version` defined in `_config.yml`

If none of these are defined, the sidebar will have a label of "Untitled Sidebar".
The sidebar used for this page looks like the following:

{% capture rmd %}{% includefile _data/sidebars/unidata_sidebar.yml %}{% endcapture %}
~~~yaml
{{ rmd | rstrip }}
~~~

If you want the title of your sidebar to link to a page other than `index.html`, use the `sidebar_url` key associated with the first `title` key under `entries` in the sidebar yaml file, like so:

~~~yaml
entries:
- title:
  sidebar_url: otherpage.html
  ...
~~~

