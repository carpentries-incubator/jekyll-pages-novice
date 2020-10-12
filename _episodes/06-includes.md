---
title: "Re-using Blocks of Content"
teaching: 0
exercises: 0
questions:
- "How can I reuse the same chunks of material in multiple pages?"
objectives:
- "Create reusable blocks of content and insert them into pages"
keypoints:
- "The content of files in the `_includes/` directory can be inserted into a page with `{ % include file_name % }`"
---

In the previous episode,
we discussed the benefits of using global and local variables
to re-use values throughout our pages.
However, repeated use of content in across websites
is usually not limited to individual values such as
email addresses and social media handles.

> ## What gets re-used?
>
> Look at the two pages linked below,
> and browse some other pages on the same site.
>
> * [The Software Sustainability Institute][ssi-homepage]
> * [DiverseKids Book Store][diversekids]
>
>
> What content is being re-used between pages on these sites?
> Pair up and compare your partner's notes with your own.
> Can you identify any common type(s) of content that being re-used in these sites?
>
> > ## Solution
> >
> > The Software Sustainability Institute website re-uses many structural
> > elements, such as the **page header**
> > (containing the "top menu," the institute's logo, links to social media, etc)
> > and **footer**
> > (containing copyright and licensing information,
> > links to the privacy policy and accessibility statement,
> > a form to subscribe to the institute's newletter, etc).
> > Elsewhere, blocks of text and images are re-used in the main body
> > of multiple pages, e.g.
> > blog and news posts all end with a description of
> > how the reader can contact the SSI to discuss the content.
> >
> > The DiverseKids site has the same kind of shared header and footer
> > on each page: this is a common theme across most websites,
> > helping to improve navigation and other aspects of the user experience
> > and achieve consistent "branding" across the whole site.
> > The books listed under each category include a title, a price,
> > and cover image,.
> > The category links themselves are also shared across each page,
> > probably generated from the existing categories of books in the collection,
> > and updated automatically when a category is added or removed.
> {: .solution }
{: .challenge }

The most commonly reused content is structural: menus and branding information
used to present a consistent and recognisable interface to the user regardless
of which specific page of the site they're visiting.
We'll look more at that in the next episode.
But some content, such as contact statements and post/product listings,
can be reused in the body of pages.
The motivation for reusing content like this is that,
if you need to update that content - changing the contact address,
updating a price or picture associated with a listing, and so on -
you need only change this information in one place
for the update to be propagated across the whole site.

As far as we know,
the sites linked in the previous exercise aren't built with Jekyll.
But the principles behind reusing content apply regardless of
the particular framework being us to build the site.

Let's look at an example of how we can create a block of common content
and reuse it in multiple pages on our site.

{{site.testvar}}


> ## Why Not Use Variables?
>
> We must place our blocks of content for inclusion in separate files because
> **Jekyll does not support substitution of variables within variables**.
> If you'd like to investigate further,
> you might try creating a global variable in your site's `_config.yml`
> which include a call to anoth variable in its value, e.g.
> `social: "{% raw %}Follow us on [Twitter]({{site.twitter}}){% endraw %}"`,
> and using it in a page (`{% raw %}{{site.social}}{% endraw %}` for the exaple above).
{: .callout }

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

> ## Including Link References
>
> {: .callout }

{% include links.md %}
