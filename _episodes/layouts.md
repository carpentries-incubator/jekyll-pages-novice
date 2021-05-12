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
- "The structure of a page is determined by the `layout` field in the page front matter"
- "You can find many pre-existing themes for sites on the Internet"
- "You can avoid duplicated effort by basing new layouts on previous ones"
---

Elements that will appear on every page across our website,
like the banner image we included in our pages in the previous section,
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

## Defining a Layout

Jekyll layouts are defined as HTML files in a special `_layouts` folder.
We will want our navigational links to appear on every page of our site so,
instead of using an `include` tag on each page individually,
we should add it to the layout used for each page.
Just like our site's pages, layouts can `include` blocks defined in other files,
but the catch is that these must also be HTML (remember the last exercise when we asked you to create a footer in HTML
instead of Markdown?).

We will now define a new page layout called `default`,
which we will save in a file `_layouts/default.html`.
Having defined our navigational links in a separate file,
we will start with a layout file that only includes this file:

~~~
{% raw %}{% include navigation.html %}{% endraw %}
~~~
{: .language-markdown }

You have just defined the first layout for pages on your site.
Congratulations!

To apply this layout to your site's home page,
add `layout: default` to the YAML front matter of `index.md`. Similarly, to apply this layout to the site's About 
page, add `layout: default` to the YAML front matter of `about.md`.
When you reload your site's homepage (or any page you applied the layout to), you will see
that there is good news and bad news:
The good news: the navigation links are there again;
the bad: all the other page content has disappeared!

The page content is missing because we haven't yet told Jekyll where to put it.
To do that we need to add the special `content` variable into the layout file:

~~~
{% raw %}{% include navigation.html %}{% endraw %}

{% raw %}{{ content }}{% endraw %}
~~~
{: .language-markdown }

We can use the `content` variable to tell variable where it should place
**all the content defined in the Markdown of the page** within this layout.
If we make the change above to `_layouts/default.html` and reload our site's homepage,
we now see the page content has returned but we have two more problems:
the styling of our pages has changed (for the worse) and
the navigational links appear twice!

![A page displaying the navigation section twice.](../fig/layouts_double_navigation.png){: width="800px"}

The duplication is happening because the
`{% raw %}{% include navigation.html %}{% endraw %}`
tag is still present in `index.md`.

> ## Exercise: Cleaning Up
>
> Remove the include tag for navigation links from all the pages of your site (e.g. `about.md`),
> and set every page to use the `default` layout.
>
{: .challenge }

Now that we have cleaned the duplicated navigation links, we may want to add another element to our layout. In a similar manner 
to the navigation links appearing on every page, we may want a common footer to appear too.

> ## Exercise: Expanding the Layout
>
> Expand the layout we have just created to include a footer element at the bottom defined in `_includes/footer.html`
>so that it appears at the end of each page that uses this layout.
>
> > ## Solution
> > Include the footer file in the `_layouts/default.html` layout file as follows:
> >
> > ~~~
> > {% raw %}{% include navigation.html %}
> >
> > {{ content }}
> >
> > {% include footer.html %}{% endraw %}
> > ~~~
> > {: .language-html }     
> >
> > Remove all references to `footer.html` from pages as they will now be included via the layout. 
> > Check that this works by reloading any of the pages that uses the `default` layout. You should see a footer at 
> > the bottom of the page.
> {: .solution }
{: .challenge }

## HTML Structure, Metadata and a Default Layout
Before we defined a layout for our pages,
Jekyll used a _default theme_ to style the site.
That default has been overwritten now that we applied a layout file
to our site and that means,
if we want to use our own customised layouts,
we will need to start telling the browser in more detail how we would like our pages to be styled.
There is still more to learn about page layouts,
so we will come back to this issue of styling at the end of the episode.

You might recall from
[the introduction](/introduction/index.html#hello-world-in-html)
to this tutorial, that a _valid_ HTML page consists of more than
only the content we want to display.
We haven't written these extra elements (`<html>`, `<head>`, `<meta>`, etc)
in our layout file: but there are some advantages to defining these yourself:
these invisible elements of a web page describe metadata about the page,
which can be used by Internet search engines to better understand what
the page is about and who it is for.
This information is factored in when the search engine indexes the page,
and subsequently makes it more findable for your target audience.
(This is one consideration in the much larger field of
[Search Engine Optimisation][seo-wikipedia].)

For example, to make the browser automatically adjust the way your pages are
shown on different displays/devices,
you could include the metadata element
`<meta name="viewport" content="width=device-width, initial-scale=1.0">`
inside the `<head>` of your pages.
([Read this W3Schools page to learn more][w3-viewport].)

It is common practice to define the structural HTML elements of your site's pages
inside a `_layouts/default.html` file.
This file defines the bare minimum layout your pages should have.

> ## Exercise: Adding HTML Structural Elements to Default Layout
>
> Modify the default layout file `_layouts/default.html` with the following content:
>
> ~~~
> {% raw %}<!doctype html>
> <html lang="en">
>   <head>
>     <meta charset="utf-8">
>     <title>{{ page.title }}</title>
>   </head>
>   <body>
>     {% include navigation.html %}
>     <h1>{{ page.title }}</h1>
>     <section>
>       {{ content }}
>     </section>
>     {% include footer.html %}
>   </body>
> </html>{% endraw %}
> ~~~
> {: .language-html }
{: .challenge }

Note that we have also included some additional HTML elements in out default layout- the display of the 
page title as level-one heading and wrapping the main page content within <section> and </section> tags.

## Layout Inheritance

To prevent the duplication of all this "invisible" HTML across all the layouts
we define for a site,
Jekyll allows for layouts to be based on other layouts,
which can be based on other layouts,
and so on.
This is referred to as _layout inheritance_,
and is refreshingly easy to use.

For example, let's say we want to create a slightly different 
layout for our home page and include a banner image just below navigation links to make is pretty. 
To do so, we first need to upload a banner image to our repository and create a HTML snippet 
`_includes/banner.html` to include the banner image:

1. To add a pre-made banner image, click "Create new file" under the "Add file"
dropdown on your repository homepage,
2. In the "Name your file..." box, type `images/`.
   The folder name should be automatically inserted in the path displayed
   next to this box for naming the file. It is good practice to store all image files in a common folder.
3. You can then leave the file blank and name it `.gitkeep`.
   When you commit the changes, the `images` folder will have been
   added to your repository. We will be uploading our banner image to this folder in a moment. 
   Unfortunately GitHub does not provide a way to create a new folder
while uploading existing files, only while creating new ones.
When making these blank files,
which exist only to allow the existence of their parent repository,
it is traditional to call them `.gitkeep`.
4. Now [download this banner image that we will add to our pages][banner-image]
save it with the name `site_banner.png` and
upload the file to your newly-created `images` folder on GitHub:
you can do this by navigating into the folder and choosing
"Upload files" from the "Add file" dropdown you used before.

Now that the banner image is available in our site repository,
add the HTML file `_includes/banner.html` with the following content:

~~~
<img src="./images/site_banner.png" alt="Group Website banner">
~~~
{: .language-html }
 
Next, we need to create a new layout file `_layouts/home.html` and then 
set it to inherit from the default layout by adding YAML front matter to it specifying the `layout` (of the layout file) 
to be `default`. 

We can then 
add any extentions to the new layout `home.html` that will be applied on top of the default layout. This is what 
`_layouts/home.html` file should look like: 
~~~
{% raw %}---
layout: default
---

{% include banner.html %}

{{ content }}{% endraw %}
~~~
{: .language-html }

> ## Defining a Layout for a Layout    
>Note how you can apply layouts not only to regular pages but also to other layouts, effectively making a layout
>inherit from another layout.
{: .callout }

Finally, we can now update the layout of the home page to be `home` instead of `default` by modifying the YAML front matter. 
If you reload the home page now,
you should now see that it has all of the structure provided in `default` layout
as well as the banner image included from the `home` layout.

![Home page with inherited layout](../fig/layouts_homepage_layout.png){: width="800px"}

The purpose of this approach, defining the core structure that will be common
to every page across your site in a default layout,
then basing more specific layouts on this foundation,
is to keep duplication to a minimum within our repository.
Whenever you want to update something about the styling or structure of your site,
you should only need to make that change in a single file and let it propagate
to all the relevant pages.

> ## You Can't Include Link References in the Layout
>
> In the previous section,
> [we recommended that you `include` a file of references](/includes/indx.html#including-link-references)
> for the links on your site.
> Unfortunately, you cannot add this `{% raw %}{% include links.md %}{% endraw %}`
> tag to the default layout of your site to prevent you from needing to
> add it at the bottom of every page.
> This is a result of [the order of Jekyll's rendering process][jekyll-rendering],
> which constructs the HTML of the page content in isolation
> _before_ constructing the HTML of the relevant layout(s) and nesting it inside.
> If the link references are included in the layout rather than the content,
> those references will not be available while the content is converted to HTML
> and the links will not render correctly.
> It is annoying to have to remember to add
> `{% raw %}{% include links.md %}{% endraw %}`
> to the end of every page's Markdown,
> but less annoying than having to manually edit the same link reference in
> multiple locations throughout the site.
>
{: .callout}

## Using Pre-Existing Layouts from a Theme

We have now seen how to create pages,
re-use content across them,
and define layouts,
and you may be coming to understand that it requires a lot of work
to build a website from the ground up.
This is not a task we recommend you undertake lightly!

Instead, an alternative is to base your site on one of
the many pre-existing themes for Jekyll.
Many of these themes are free and open source and,
as long as you follow the terms of the license
(e.g. remember to give due credit to the original -
check the full terms for details),
can be adapted/customised to suit your purposes.
**You can browse a list of Jekyll themes on [jekyllthemes.io][jekyllthemes]**.

These themes can be elaborate and quite complicated.
We hope that the knowledge of Jekyll that you have gained from
following this lesson will help you understand how they work
and determine what you need to change and where, to make the customisations
you need for your site.

{% include links.md %}
