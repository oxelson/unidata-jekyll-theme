---
title: Adding Custom CSS In Project
last_updated: 2026-06-01
toc: false
sidebar: unidata_sidebar
permalink: custom_css.html
---
You can add custom CSS to your project without having to modify the existing theme.

Jekyll comes bundled with SCSS (Sassy CSS) converter plugin which automatically compiles SCSS files into standard CSS when it builds your project documenation.

## Create The `customstyles.scss` File

Create `assets/css/customstyles.scss` directly in the top level documentation directory:

```none
project_docs/
├── _data/
├── assets/                     <──┐
│   └── css/                    <──┤  Create these
│       └── customstyles.scss   <──┘
├── images/
├── pages/
├── Gemfile
├── _config.yml
├── ...
```

## Add Jekyll Hooks To `customstyles.scss`

Add the following content exactly as it appears to the `customstyles.scss` file:

```scss
---
---

// custom css here
```

The two lines of triple dashes (`---`) at the top of the file tells Jekyll to process the file.

## Add Your Custom CSS

Replace the  `// custom css here` with your custom css.  
Jekyll will merge this CSS into the main Unidata theme's `assets/css/customstyles.css` file as it compiles the project.

{%include info.html content="
For more information about the Jekyll SCSS converter, see: <https://jekyllrb.com/docs/configuration/sass/>
" %}
