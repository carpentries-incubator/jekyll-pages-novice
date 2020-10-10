---
title: "Working with Filters"
teaching: 0
exercises: 0
questions:
- "How can I control the format of variable values such as dates I insert them into a page?"
- "How can I access a filtered subset from an array of values?"
- "Where can I find out more about Jekyll and Liquid?"
objectives:
- "Use simple filters to control the format and content of substituted values."
- "Select values from an array."
keypoints:
- "You can use Liquid filters to adapt the values of variables when adding them into your pages."
- "Datetime filters such as `date_to_string` can provide more readable timestamps on your pages and posts."
- "Array filters such as `where` and `sample` are helpful when you want only a subset of the available values."
- "GitHub Pages doesn't use the most recent version of Jekyll, so you should avoid the features added most recently."
---

- add date to top of post layout
  - use `date_to_long_string: "ordinal"` filter to adjust date format
- use `group_by` filter to group post listing by `category` parameter
- link to [full list of filters][filters]

{% include links.md %}
