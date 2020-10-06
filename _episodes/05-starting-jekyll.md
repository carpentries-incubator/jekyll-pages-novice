---
title: "Starting with Jekyll"
teaching: 0
exercises: 0
questions:
- "How can I use values stored in variables in my pages?"
- "How can I configure global values/settings for my site?"
- "How can I reuse the same chunks of material in multiple pages?"
- "How do I configure my website?"
objectives:
- "substitute variable values into their page content"
- "adjust the configuration of their pages"
- "create reusable blocks of content and insert them into pages"
keypoints:
- "Variables can be defined globally in `_config.yml` or locally in the YAML header"
- "Variable values can be substituted into page content with `{{ double_curly_brackets }}`"
- "Configure website parameters and use them from within pages"
- "A website can be configured via special YAML file `_config.yml` (located in the root of the website repository)
containing site-wide parameters. You can also use page-specific parameters for configuration."
---

- create and set a parameter in YAML header ("front matter")
- use parameter in page body
- use a global parameter from `_config.yml`
- use it again in another page
- change the value of the global parameter and study the effect


# Website Configuration
So far we have seen how to configure your repository to make it a website host and where to find the rendered website's URL. Let's
now look into the configuration of the website itself.

## Configuring Parameters via `_config.yml`
We have already mentioned that GitHub has an engine under the hood to process your files and
build functional websites out of your content.
This engine is called Jekyll and we will talk more about Jekyll in the following episodes.
Jekyll's main configuration options are specified in `_config.yml` file placed in your site’s root directory.
`_config.yml` file is written
in the language called [YAML](https://yaml.org/) - a human-readable data-serialization language that allows us to define scalar
parameters (that contain single values) as well as parameters that contain lists and dictionaries (hashes).

> ## YAML
>
> [YAML](https://yaml.org/) is a human-readable data-serialization language. It is commonly used for configuration files and in
> applications where text data is being stored or transmitted and it is programming language agnostic.
>
{: .callout}

Let's create some configuration parameters for our website.

1. From the GitHub interface, create `_config.yml` file in your site’s root directory.
2. Add parameters `title`, `description` and `email` to it as:

    ~~~
    title: "Learn to Build Websites in GitHub Project"
    description: "This research project develops training materials for reseachers wanting to learn to build project
    websites in GitHub with GitHub Pages."
    email: team@my.research.org
    ~~~
    {: .language-yaml}

3. Commit your changes.

Site-wide information and configuration settings from
`_config.yml` are made available as `site.PARAMETER_NAME` variable in every page/file within the website/repository.
There is also a number of
[predefined site-wide variables](https://jekyllrb.com/docs/variables#site-variables) available to you.

To access the values of configuration parameters within Markdown files, you have to enclose them in double curly
braces: {% raw %}{{ and  }}{% endraw %}. Let's see this in action.

1. Modify `index.md` file to add a link to contact email address using parameter {% raw %}{{ site.email }}{% endraw %} we defined in `_config.yml`. File `index.md` should now look like this:
   ~~~
    # {% raw %}{{ site.title }}{% endraw %}
     {% raw %}{{ site.description }}{% endraw %}

    [See our full team](team.md)

    Have any questions about what we do? [We'd love to hear from you!]({% raw %}mailto:{{ site.email }}{% endraw %})
   ~~~
   {: .source}

2. Note that site parameters will not render nicely in GitHub (they will be displayed as text
`{% raw %}{{ site.PARAMETER_NAME }}{% endraw %}` rather than the parameter's rendered value) but will in the website.

> ## Site- and page-wide parameters
>
> In addition to site-wide configuration available via the `site` global variable, page-specific information is
> available to you via the `page` global variable. Some of these are pre-defined (like `page.title`);
> others you can define yourself. Check this [list of predefined page parameters](https://jekyllrb.com/docs/variables#page-variables).
>
{: .callout}

## More Complex Parameters

We can define more complex parameters such as list and dictionaries (hashes) too.
For example, we may want
to define the names of the project team members, their roles and start dates inside the `_config.yml` file
and make use of this information throughout the website. To do so in YAML notation would look something like:

~~~
team_members: [
    {name: "Sarah Becker", role: "project lead", start_date: "2016-02-01"},
    {name: "Jane Smith", role: "maintainer", start_date: "2018-03-15"},
    {name: "Albert Hamilton", role: "editor", start_date: "2017-12-01"},
    {name: "Alice Dauncey", role: "developer", start_date: "2020-01-04"}
]
~~~
{: .language-yaml}
This defines team_members as a list of 4 elements; each element is a hash with key-value pairs for name, role and date.

> ## Indentation in YAML
> Note that indentation level in YAML is important - it can be a cause of some not-so-obvious mistakes. Use online YAML
>code validators, such as [YAML Lint](http://www.yamllint.com/), to make sure your YAML is correctly formatted.
>
{: .callout}

Let's access the information about the team and display the name of the project lead on the home page. We can do so
by using the value `team_members[0]["name"]` because the team lead is the first team member in the `team_members`
list.

1. Modify `_config.yml` file and add the `team_members` parameter as defined above. The file should now look like:

    ~~~
    title: "Learn to Build Websites in GitHub Project"
    description: "This research project develops training materials for reseachers wanting to learn to build project
    websites in GitHub with GitHub pages."
    email: team@my.research.org
    team_members: [
        {name: "Sarah Becker", role: "project lead", start_date: "2016-02-01"},
        {name: "Jane Smith", role: "maintainer", start_date: "2018-03-15"},
        {name: "Albert Hamilton", role: "editor", start_date: "2017-12-01"},
        {name: "Alice Dauncey", role: "developer", start_date: "2020-01-04"}
        ]
    ~~~
    {: .language-yaml}

2. In file `index.md` add the team lead's name so that it looks like:

    ~~~
    # {% raw %}{{ site.title }}{% endraw %}
    {% raw %}{{ site.description }}{% endraw %}

    Project lead is: {% raw %}{{ site.team_members[0]["name"] }}{% endraw %}.
    [See our full team](team.md)

    Have any questions about what we do? [We'd love to hear from you!]({% raw %}mailto:{{ site.email }}{% endraw %})
    ~~~
    {: .source}

3. **Remove this example and move to the next episode!**
In file `team.md`, iterate over the values defined in parameter `site.team_members` in a loop to display all
team members' names and roles:

    ~~~
    ## Project team members
    The following people are members of our research team:
    {% raw %}{{ for team_member in site.team_members }}
        - Name: {% raw %}{{ team_member.name }}{% endraw %} , role: {% raw %}{{ team_member.role }}{% endraw %}
    {% raw %}{{ end_for }}{% endraw %}
    ~~~
    {: .source}
    TODO: definitely an overkill putting Liquid code here - this should go into the next episode. Which makes me
    think that it should be called: "Jekyll and Liquid". If we move this bit into the next episode, we can expand on the
    example and show other Liquid features, like getting the list length and saying "The project currently has
    SOME_CODE members." to show of the function for getting list length which is commonly used.

3. This way, if you need to add, remove or modify a team member, you can simply do it in `_config.yml` without modifying
Markdown files. It is also good practice to keep all configuration details in one location.

 Next, we move on to look into more detail in
Jekyll and its corresponding scripting language Liquid.


> ## Creating your own variable
>
> Let's practice making and using variables.
> Think of a variable you may want to use in your `index.md` page.
> Some possible options include: your name, the institution you work at, the PI of your lab group.
> Create the variable and reference it in your `index.md` and save/commit that to your repository.
> What did you add to your `index.md` to create this variable?
> Where did you add the line above to your `index.md`?
> How did you reference that variable?
>
> > ## Solution
> >
> > We will create the `pi` variable by adding the following line to the yaml header.
> > ~~~
> > pi: "Ada Lovelace"
> > ~~~
> >
> > Here is an example of using it in the `index.md` file
> > ~~~
> > ---
> > pi: "Ada Lovelace"
> > ---
> >
> > This project is lead by {% raw %}{{ page.pi }}{% endraw %}.
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}


> ## Making a global variable
>
> Grad student Davis wants to use their current institution name throughout their personal website
> but will soon be leaving to become a postdoc at another institution.
> They have created a variable `current_institution` in the YAML header of the `index.md` pages on their site.
> What changes would they make to use this variable on other pages as well?
> How might they need to change the following text on their `index.md` page after those changes?
>
> ~~~
> Davis currently works at {% raw %}{{ page.current_institution }}{% endraw %}.
> ~~~
> {: .source}
>
> > ## Solution
> >
> > They need to move the variable to the `_config.yml`
> > Then they would change the index code to the following.
> > ~~~
> > Davis currently works at {% raw %}{{ site.current_institution }}{% endraw %}.
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}



{% include links.md %}
