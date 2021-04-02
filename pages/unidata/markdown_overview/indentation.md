---
title: Indentation
last_updated: 2021-04-01
sidebar: unidata_sidebar
toc: false
permalink: indentation.html
---
Example:

1. Restart Tomcat so the TDS is reinitialized:

   ~~~bash
   $ cd ${tomcat_home}/bin
   $ ./shutdown.sh
   $ ./startup.sh
   ~~~

   ~~~~~md
   1. Restart Tomcat so the TDS is reinitialized:
      ~~~bash
      $ cd ${tomcat_home}/bin
      $ ./shutdown.sh
      $ ./startup.sh
      ~~~
   ~~~~~

   All indented text are aligned with the `"R"` in `"Restart"`, which is 3 spaces.
   Alignment is with the start of the text in the bullet of the list.
   This works the same way with nested lists.

2. Using the `~` character in code blocks

   In order to get the `~~~bash~~~` and `~~~` to show up in the code block above, I had to do the following:

   ~~~~~~~~md
   ~~~~~md
   ~~~bash
   $ cd ${tomcat_home}/bin
   $ ./shutdown.sh
   $ ./startup.sh
   ~~~
   ~~~~~
   ~~~~~~~~

   Whatever highlighting you would like, just make sure it has more `~` characters than any nested code blocks.
