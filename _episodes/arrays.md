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


## Array Parameters and For Loops

YAML lets us define lists and dictionaries too, in addition to simple parameters we have seen so far.
And Jekyll supports the use of these more complex parameters as well.

For example, we may want
to list the names of all the project team members, together with their roles and start dates inside the `_config.yml` file
and make use of this information throughout the website. To do so in YAML notation would look something like:

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
> Note that indentation level in YAML is important - it can be a cause of some not-so-obvious mistakes. Use online YAML
>code validators, such as [YAML Lint](http://www.yamllint.com/), to make sure your YAML is correctly formatted.
>
{: .callout}

In order to access all elements in a list you need a 'for loop', which is performed in Liquid
by surrounding it in a curly brace percentage sign as:
`{% raw %}{% for variable in list %}{% endraw %}`. You follow this with the 'body' of your loop, and finish off
 with the 'for loop' end-tag: `{% raw %}{% endfor %}{% endraw %}`.

Let's access the information about the team and display the name of the project lead on the home page `index.md` and the information about the whole team in `about.md`. Note that we access the team lead's name as `team_members[0]["name"]` because the team lead is the first team member in the `team_members` list.

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

2. In file `about.md`, we add a new section for the team and iterate over the values defined in parameter `site.team_members` in a loop to display all team members' names and roles. The file now should look like:

   ~~~
   # About

   ## Project
   {% raw %}{{ site.description }}{% endraw %}

   ## Funders
   We gratefully acknowledge funding from the XYZ Founding Council, under grant number 'abc'.

   ## Team

   The following people are members of our research team:
   {% raw %}{% for team_member in site.team_members %}
      - Name: {% raw %}{{ team_member.name }}{% endraw %}, role: {% raw %}{{ team_member.role }}{% endraw %}
   {% raw %}{% endfor %}{% endraw %}

   ## Cite us
   You can cite the project as:

   >    *My research project. Zenodo. https://zenodo.org/record/doi*

   ## Contact us

   Email: [team@my.research.org](mailto:{% raw %}{{ site.email }}{% endraw %})

   Twitter: [@my_research_project]({% raw %}{{ site.twitter }}{% endraw %})
   ~~~
   {: .language-markdown}


3. In file `index.md` add the team lead's name so that it looks like:

   ~~~
   # {% raw %}{{ site.title }}{% endraw %}

   ## Description
   {% raw %}{{ site.description }}{% endraw %}

   The project is led by {% raw %}{{ site.team_members[0]["name"] }}{% endraw %}.
   [See our full team](/about#team)

   Have any questions about what we do? [We'd love to hear from you!]({% raw %}mailto:{{ site.email }}{% endraw %})
   ~~~
   {: .language-markdown}

If you need to add, remove or modify a team member, you can simply do it in `_config.yml` without modifying your pages.
Let's now change the values of a global parameter and study the effect.

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
