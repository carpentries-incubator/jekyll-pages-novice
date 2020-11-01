---
title: "Page Layouts"
teaching: 0
exercises: 0
questions:
- "How can I design the layout for all pages on my site?"
- "Where can I find pre-built themes for my site?"
- "How can I create new layouts based on those I already have?"
objectives:
- "Apply a template layout to a page"
- "Find and implement pre-existing themes to determine the style of a site"
- "Create new page templates that inherit from existing layouts"
keypoints:
- "Files in the `_layouts/` directory can be used as page templates"
- "The structure of a page is determined by the `layout` page metadata"
- "You can find many pre-existing themes for sites on the Internet"
- "You can avoid duplicated effort by basing new layouts on previous ones"
---

Elements that will appear on every page across our website,
like the banner image we `include`d in our pages in the previous section,
form part of the structure of the page:
unlike the content specific to each page,
these structural elements do not change from page to page.
As such, although the `include` tags reduce the pain we endure when
adjusting that repeated content,
it is not good practice to `include` the same content over and over again.
This structure can instead be defined within the _layout_ of the pages of the site.

Common elements found in a layout are
logos,
banners,
navigation menus,
footer content such as copyright and licensing information:
material often found at the very top or very bottom of a webpage.

To demonstrate how layouts work in Jekyll we will copy the contents of
`_includes/banner.html`, the HTML file defining the `img` element for our banner,
to `_layouts/page.html`, a new file in a new folder.
GitHub doesn't provide a way to make a copy of a file,
so you will need to do this manually.
Note that the name of the `_layouts` folder begins with an underscore,
which as we learned earlier means it has special meaning to Jekyll.
You have just defined the first layout for pages on your site.
Congratulations!

To apply this layout to your site's landing page,
add `layout: page` to the YAML front matter of `index.md`.
When you reload your site's homepage you will see
that there is good news and bad news:
The good news: the banner image is there again;
the bad: all the other page content has disappeared!

FIXME: add screenshot here

The page content is missing because we haven't yet told Jekyll where to put it.
To do that we need to add the special `content` variable into the layout file:

~~~
{% raw %}<img src="carpentries-incubator.github.io/building-websites-with-jekyll-and-github-or-gitlab/files/site_banner.png">{% endraw %}

{% raw %}{{ content }}{% endraw %}
~~~
{: .source}


> ## Expanding the layout
>
> We will probably want to include the contact line we added in the previous section
> in every standard page on our site.
> Instead, we can place it in the layout template
> so we don't have to remember to `include` it every time we make a new page.
> Create a new layout, `page-contact.html`,
> which is based on the existing `page` layout and
> displays the contact information from `_includes/contact.md`
> after the page content.
> Check that this works by applying that layout to the `team.md` page.
>
> > ## Solution
> > Your new layout file, `_layouts/page-contact.html`,
> > should look like this:
> >
> > ~~~
> > ---
> > layout: page
> > ---
> >
> > {% raw %}{{ content }}
> > {% include contact.md %}{% endraw %}
> > ~~~
> > {: .source }
> >
> > and the `layout` field in the YAML front matter of `team.md` should
> > be updated to this new layout.
> >
> > ~~~
> > layout: page-contact
> > ~~~
> > {: .source }
> {: .solution }
{: .challenge }

> ## Valid HTML, Page Metadata and a Default Layout
>
> - a reminder about valid HTML
> - metadata and SEO
> - `_layouts/default.html`
>
{: .callout}

## Using a Pre-Existing Theme

- link to jekyllthemes.io and any other listing/collection of themes
- recommend using one of these and adapting as you need

{% include links.md %}
