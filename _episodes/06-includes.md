---
title: "Re-using Content"
teaching: 0
exercises: 0
questions:
- "How can I reuse the same chunks of material in multiple pages?"
objectives:
- "Create reusable blocks of content and insert them into pages"
keypoints:
- "The content of files in the `_includes/` directory can be inserted into a page with `{ % include file_name % }`"
---

> ## Including Contact Information
>
> The last line of `index.md` includes the kind of information you might want to
> re-use in multiple places throughout your site.
>
> ~~~
> Have any questions about what we do? [We'd love to hear from you!](mailto:{% raw %}{{site.email}}{% endraw %})
> ~~~
> {: .source }
>
> Copy the snippet and save it into an appropriately-named file,
> then use an `include` statement to re-insert it
> at the bottom of your site's `index.md`,
> and add it at the bottom of the `team.md` pages.
>
> > ## Solution
> > create a file called `contact.md`
> > (or similar) inside the `_includes` folder:
> >
> > ~~~
> > Have any questions about what we do? [We'd love to hear from you!](mailto:{% raw %}{{site.email}}{% endraw %})
> > ~~~
> > {: .source }
> >
> > and add the line
> >
> > ~~~
> > {% raw %}{% include contact.md %}{% endraw %}
> > ~~~
> > {: .source }
> >
> > at the end of `index.md` (replacing the equivalent line if it's still present)
> > and `team.md`.
> {: .solution }
{: .challenge }

- write a longer block of material, including variable substitutions, as a parameter
- try to use it in a page
- save it to a file in `_includes` and use `{% raw %}{% include file_name %}{% endraw %}`
- note about `includes` for link references

{% include links.md %}
