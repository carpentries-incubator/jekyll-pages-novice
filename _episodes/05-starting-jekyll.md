---
title: "Starting with Jekyll"
teaching: 0
exercises: 0
questions:
- "How can I use values stored in variables in my pages?"
- "How can I configure global values/settings for my site?"
- "How can I reuse the same chunks of material in multiple pages?"
objectives:
- "substitute variable values into their page content"
- "adjust the configuration of their pages"
- "create reusable blocks of content and insert them into pages"
keypoints:
- "Variables can be defined globally in `_config.yml` or locally in the YAML header"
- "Variable values can be substituted into page content with `{{ double_curly_brackets }}`"
---

- create and set a parameter in YAML header ("front matter")
- use parameter in page body
- use a global parameter from `_config.yml`
- use it again in another page
- change the value of the global parameter and study the effect

{% include links.md %}
