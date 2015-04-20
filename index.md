---
title: Documentation Theme for Jekyll
permalink: "/"
tags: overview
---
{% include linkrefs.html %}

{% if site.audience == "writer" %}
{{note}} This is the version of the documentation designed for writers.{{end}}
{% endif %}


{% if site.audience == "designer" %}
{{note}} This is the version of the documentation designed for designers.{{end}}
{% endif %}


This is a Jekyll theme intended for documentation projects. What makes this theme unique is the approach in using Jekyll for single sourcing, that is, producing multiple outputs from the same theme. For example, you might have 3 different help systems that you're generating from the same Jekyll files. More than anything, this Jekyll theme shows you how to use Jekyll for documentation projects from the perspective of a technical writer. 

{{note}} I'm using this theme for my own technical writing projects, so this is an evolving project.{{end}}

## Intended audience

Although this theme could be used for any website, I'm assuming that my main audience involves technical writers. Very few technical writers are even aware of Jekyll as a platform, let alone how to use it for tech comm scenarios. The instructions for this theme, therefore, are extensive because they discuss a lot of Jekyll basics as well. I'm not going to assume that you're already familiar with Jekyll, or that you're a UX guru, or that you know how to do backflips in Liquid. I'll try to hold your hand as much as possible.

## Supported tech comm features with Jekyll

As far as I can tell, Jekyll supports most of the features a technical writer needs to author and publish content. See {{supported_features}} for an extensive list. Most importantly, using Jekyll allows you to take full advantage of a modern web development platform. 

## Theme features

This theme specifically provides the following:

* Bootstrap framework with responsive design
* Integrated search
* Navigation sidebar and top navigation
* Font Awesome
* Options for creating multiple builds for different audiences

## Getting started

To get started, see {{getting_started}}. It explains how to create a new project.

## Questions

Feel free to ask me a question if there's something I haven't addressed here. 

Tom Johnson <br /><a href="mailto:">tomjohnson1492@gmail.com</a>






