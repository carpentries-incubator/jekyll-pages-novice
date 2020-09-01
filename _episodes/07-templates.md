---
title: "Page Templates"
teaching: 0
exercises: 0
questions:
- "How can I design the layout for all pages on my site?"
- "Where can I find pre-built themes for my site?"
- "How can I create new layouts based on those I already have?"
objectives:
- "apply a template to a page"
- "find and implement pre-existing themes to determine the style of a site"
- "create new page templates that inherit from existing layouts"
keypoints:
- "Files in the `_layouts/` directory can be used as page templates"
- "The structure of a page is determined by the `layout` page metadata"
- "You can find many pre-existing themes for sites on the Internet"
- "You can avoid duplicated effort by basing new layouts on previous ones"
---

- create a layout in `_layouts`
  - include page title and author info at the bottom
- set `layout` parameter in page metadata
- create second layout that inherits from first
  - add block to list posts
- create posts collection in `_config.yml`
- exercise idea: move post list block to `_includes`
- link to jekyllthemes.io and any other listing/colelction of themes

{% include links.md %}
