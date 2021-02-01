---
title: "Loops and Collections"
teaching: 0
exercises: 0
questions:
- "FIXME"
objectives:
- "FIXME"
keypoints:
- "FIXME"
---

Now we have learned how to substitute and format values stored in variables
into pages on our site, how to include and re-use entire blocks of content,
and how to specify the layout of our different pages.
One thing we are still missing is how to automatically generate
lists of pages and other values:
for a blog site it is usually desirable to include a list of the most
recent posts to the blog, and an archive of all historic posts;
for a group website, we may wish to do something similar with research projects
or profile pages for individual team members.

Using what we already know about Markdown,
we _could_ write these lists by ourselves.
But this would be time-consuming and ineffecient:
we would have to manually adjust these listings every time we
write a new post/start a new project/welcome a new team member to the group.
Instead, we will learn about two more features of Jekyll,
_for loops_ and _collections_,
which can be used to populate and update lists within pages automatically.


## Array Parameters and For Loops

In addition to the single-value variable types we are already familiar with,
YAML lets us define [lists](https://glosario.carpentries.org/en/#list) and [dictionaries](https://glosario.carpentries.org/en/#dictionary) too.

For example, we may want to list the names of all the team members for a project,
together with their roles and start dates, inside `_config.yml`
and make use of this information throughout the website.

To do so in YAML notation would look something like:

~~~
team_members: [
    {name: "Sarah Becker", role: "project lead", start_date: "2016-02-01"},
    {name: "Jane Smith", role: "maintainer", start_date: "2018-03-15"},
    {name: "Albert Hamilton", role: "editor", start_date: "2017-12-01"},
]
~~~
{: .language-yaml}

This defines 'team_members' as a list of 3 elements; each element is a dictionary with key-value pairs for name, role and date.

> ## Indentation in YAML
> Note that indentation level in YAML is important -
> it can be a cause of some not-so-obvious mistakes.
> Use online YAML code validators,
> such as [YAML Lint](http://www.yamllint.com/),
> to make sure your YAML is correctly formatted.
>
{: .callout}

Now that the `site.team_members` variable has been defined,
we can insert it into any page on our site exactly as we have done before.
However, with list variables such as this, it is often preferable to _iterate_
through the values so that we can handle and display each one individually.
To do so we need a for loop,
inside which we can define what we want to do to to each of the list's values.
In Liquid syntax, loops are created by surrounding the loop body in `for`/`endfor` tags as:

~~~
{% raw %}{% for thing in list %}
[ This is the loop body. Do something with the "thing" variable here. ]
{% endfor %}{% endraw %}`
~~~
{: .source }

Let's use a loop to access the information about the team and
display it in `about.md`.

1. Modify `_config.yml` file and add the `team_members` parameter as defined above. The file should now look like:

   ~~~
   title: "Building Websites in GitHub"
   description: "This research project develops training materials for reseachers wanting to learn to build project
   websites in GitHub with GitHub Pages."
   email: "team@my.research.org"
   twitter: "https://twitter.com/my_research_project"
   team_members: [
       {name: "Sarah Becker", role: "project lead", start_date: "2016-02-01"},
       {name: "Jane Smith", role: "maintainer", start_date: "2018-03-15"},
       {name: "Albert Hamilton", role: "editor", start_date: "2017-12-01"}
   ]
   ~~~
   {: .language-yaml}

2. In file `about.md`, we add a new section for the team and
   iterate over the values defined in parameter `site.team_members` in a loop to
   display a table of the team members' names and roles.
   The file now should look like:

    ~~~
    # About
    {% raw %}
    ## Project
    {{ site.description }}

    ## Funders
    We gratefully acknowledge funding from the XYZ Founding Council, under grant number 'abc'.

    ## Team

    The following people are members of our research team:
    <table>
    <tr><th>Name</th><th>Role</th></tr>
    {% for team_member in site.team_members %}
    <tr><td>{{ team_member.name }}</td><td>{{ team_member.role }}</td></tr>
    {% endfor %}
    </table>

    ## Cite us
    You can cite the project as:

    >    *My research project. Zenodo. https://zenodo.org/record/doi*

    ## Contact us

    Email: [team@my.research.org](mailto:{{ site.email }})

    Twitter: [@my_research_project]({{ site.twitter }})
    {% endraw %}
    ~~~
    {: .language-markdown}

FIXME: add screenshot of rendered team member listing


## Filtering a List

What if we want to pull out the information for a specific team member,
e.g. the Lead of a particular project?
To achieve this,
we can use another filter like the ones we saw in the previous episode:
the `where` filter creates a filtered list containing only those items
that fulfil the criteria provided.
For example, to filter only the project leads from the `team_members` list,
we would write the filter like this:

~~~
{% raw %}{{ site.team_members | where:"role", "project lead" }}{% endraw %}
~~~
{: .source }

`where` returns a list,
but we expect there will be only one lead defined for each project,
and in such cases the best way to access this single value from the
filtered list is with another filter, `first`.
This filter returns the first entry in whichever list it is called on:

~~~
{% raw %}{{ site.team_members | where:"role", "project lead" | first }}{% endraw %}
~~~
{: .source }

## Assigning Variables Within a Page

We are almost there! But how do we access only the value for `name`  within
the list entry returned by our combination of the `where` and `first` filters?
We cannot do so directly from the filtered list,
but Liquid provides a way for us to create a new variable
from the value returned by those filters.
For this, we use the `assign` tag, e.g.

~~~
{% raw %}{% assign lead = site.team_members | where:"role", "project lead" | first %}
{{ lead.name }}{% endraw %}
~~~
{: .source }

Use this `assign` tag whenever you need to create variables for use "on the fly"
as you work with lists in your site.
We will see another examples of this when we investigate collections in the
next section.

3. In file `index.md` add the team lead's name so that it looks like:

   ~~~
   # {% raw %}{{ site.title }}

   ## Description
   {{ site.description }}
   {% assign lead = site.team_members | where:"role", "project lead" | first %}
   The project is led by {{ lead.name }}.
   [See our full team](/about#team)

   Have any questions about what we do? [We'd love to hear from you!](mailto:{{ site.email }}{% endraw %})
   ~~~
   {: .language-markdown}

Now, if you need to add, remove or modify a team member,
you only need to update the list in `_config.yml` without modifying your pages.

> ## Exercise: Personnel Changes
> Your project team has changed. The team lead has left and in her place is a new person: 'Tom Cat', who started on
> '2020-10-01'. In addition, the team was expanded and a new developer called 'Alice Dauncey' who joined on '2020-09-15'.
> Update your website to reflect these team changes.
> > ## Solution
> > Luckily, we keep all our global settings in `_config.yml` so all we have to do is update the values there. This saved us some work as for the team lead we would otherwise have to modify both `index.md` and `about.md`.
> >
> >For the new developer joining the team, we also only need to her information to `team_members` in `_config.yml` and our `for loop` from `about.md` will simply pick up the changes automatically. Magic! Our `_config.yml` file should now look like:
> >
> > ~~~
> > title: "Building Websites in GitHub"
> > description: "This research project develops training materials for reseachers wanting to learn to build project
> > websites in GitHub with GitHub Pages."
> > email: team@my.research.org
> > twitter: "https://twitter.com/my_research_project"
> > team_members: [
> >    {name: "Tom Cat", role: "project lead", start_date: "2020-10-01"},
> >    {name: "Jane Smith", role: "maintainer", start_date: "2018-03-15"},
> >    {name: "Albert Hamilton", role: "editor", start_date: "2017-12-01"},
> >    {name: "Alice Dauncey", role: "developer", start_date: "2020-09-15"}
> > ]
> > ~~~
> > {: .language-yaml}
> > Check the changes in your website.
> {: .solution}
{: .challenge}

- create posts collection in `_config.yml`
- create a couple files in _posts
- create second layout that inherits from first
  - add block to list posts
