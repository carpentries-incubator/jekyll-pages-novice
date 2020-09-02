---
title: "Hosting Pages and Websites on GitHub"
teaching: 0
exercises: 0
questions:
- "How do I publish my page or a website via GitHub?"
objectives:
- "Publish Markdown files as HTML on the web with GitHub Pages"
- "Configure website parameters and use them from within pages" 
keypoints:
- "GitHub serves pages generated from Markdown (and other) files on a branch of a GitHub repository specified by the user"
- "By convention, if you create a branch called `gh-pages` it will automatically be published as a website by GitHub
on a special GitHub IO URL composed from your GitHub name and repository name"
---

# What is GitHub Pages?
[GitHub Pages](https://docs.github.com/en/github/working-with-github-pages/about-github-pages) is a free website 
hosting service by GitHub that takes files from your GitHub repository that is configured as a website, 
optionally runs the files through a build process, and publishes them as a website or a web page. 
Any changes you do to the files in your website's GitHub repository 
will be rendered live in the website.

[Anne's bit]

# Website Configuration
So far we have seen how to configure your repository to host a website and where to find the rendered website. Let's
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
    title: "Research Project Website"
    description: "Research Project Description"
    email: team@my.research.org
    ~~~  
    {: .language-yaml}

3. Commit your changes.

Site-wide information and configuration settings from 
`_config.yml` are made available as `site.PARAMETER_NAME` variable in every page/file within the website/repository. 
There is a number of 
[predefined site-wide variables](https://jekyllrb.com/docs/variables#site-variables) available to you 
(such as `site.title` and `site.email`). Others (such as `site.description`) you can define yourself. 

To access the values of configuration parameters within Markdown files, you have to enclose them in double curly 
braces: {{ "{{ and  " }}}}. Let's see this in action.

1. Modify index.md file to look like:
   ~~~
    # {{ "{{ site.title " }}}} 
     {{ "{{ site.description " }}}}     
   
    [Team members](team.md) 
   
    Contact us at [mailto: {{ "{{ site.email " }}}}]({{ "{{ site.email " }}}}).
   ~~~     
   {: .language-md}
 
2. Note that site parameters will not render nicely in GitHub (they will be displayed as text 
{{ "{{ site.PARAMETER_NAME " }}}} rather than the parameter's rendered value) but will in the website.



> ## Site-wide and page parameters 
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
and make use of this information throughout the website. To do so, in YAML notation, would look something like:

~~~
team_members: [
    {name: "Jane Smith", role: "maintainer", start_date: "2018-03-15"},
    {name: "Albert Hamilton", role: "editor", start_date: "2017-12-01"},
    {name: "Alice Dauncey", role: "developer", start_date: "2020-01-04"}
]
~~~   
{: .language-yaml}
This defines team_members as a list of 3 elements; each element is a hash with key-value pairs for name, role and date. 
Note that indentation level in YAML is important.

We can now add this information to our website.

1. Modify `_config.yml` file and add the `team_members` parameter as defined above: 

    ~~~
    team_members: [
        {name: "Jane Smith", role: "maintainer", start_date: "2018-03-15"},
        {name: "Albert Hamilton", role: "editor", start_date: "2017-12-01"},
        {name: "Alice Dauncey", role: "developer", start_date: "2020-01-04"}
        ]
    ~~~   
    {: .language-yaml}

2. In file `team.md`, iterate over the values defined in parameter `site.team_members` in a loop to display all 
team members' names and roles:

    ~~~                            
    ## Project team members  
    The following people are members of our research team:
    {{ "{% for team_member in site.team_members " }}%} 
        - Name: {{ "{{ team_member.name " }}}} , role: {{ "{{ team_member.role " }}}}   
    {{ "{% end_for " }}%}
    ~~~   
    {: .language-md}
    TODO: definitely an overkill putting Liquid code here - this should go into the next episode. Which makes me
    think that it should be called: "Jekyll and Liquid". If we move this bit into the next episode, we can expand on the 
    example and show other Liquid features, like getting the list length and saying "The project currently has 
    SOME_CODE members."
       
3. This way, if you need to add, remove or modify a team member, you can simply do it in `_config.yml` without modifying
`team.md`. 

# Summary

GitHub Pages is a static site hosting service that takes files in various formats 
(Markdown, HTML, CSS, JavaScript, etc.) 
straight from a repository on GitHub, runs them through its website engine Jekyll and builds them into a website, 
and publishes them on the Web. A website can be configured via special YAML file `_config.yml` (located in the root of 
the website repository),
containing site-wide parameters or via individual page-specific parameters. Next, we move on to look into more detail in 
Jekyll and its corresponding scripting language Liquid. 

{% include links.md %}
