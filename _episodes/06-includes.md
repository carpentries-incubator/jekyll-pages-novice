---
title: "Re-using Content"
teaching: 0
exercises: 0
questions:
- "How can I reuse the same chunks of material in multiple pages?"
objectives:
- "create reusable blocks of content and insert them into pages"
keypoints:
- "The content of files in the `_includes/` directory can be inserted into a page with `{ % include file_name % }`"
---

- write a longer block of material, including variable substitutions, as a parameter
- try to use it in a page
- save it to a file in `_includes` and use `{% raw %}{% include file_name %}{% endraw %}`
- note about `includes` for link references

{% include links.md %}
