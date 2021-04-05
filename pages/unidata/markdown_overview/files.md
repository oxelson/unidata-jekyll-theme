---
title: Files
last_updated: 2021-04-01
sidebar: unidata_sidebar
toc: false
permalink: files.html
---

To include a link to download a file contained within the documentation, use:

~~~md
{%raw%}{% include link_file.html file="<path to file starting directly under files/>" text="my link text" %}{%endraw%}
~~~

For example, to link the NcML file `$PATH_TO_GIT_REPO/docs/src/public/userguide/files/netcdfJava_tutorial/ncml/basic_ncml/exercise1.ncml `, like this:

{% include link_file.html file="netcdfJava_tutorial/ncml/basic_ncml/exercise1.ncml" text="my link text" %}

use:

~~~md
{%raw%}{% include link_file.html file="netcdfJava_tutorial/ncml/basic_ncml/exercise1.ncml" text="my link text" %}{%endraw%}
~~~

