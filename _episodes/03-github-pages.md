---
title: "Hosting Pages and Websites on GitHub"
teaching: 0
exercises: 0
questions:
- "How do I publish my pages or a website via GitHub?"
objectives:
- "Publish Markdown files as HTML on the web with GitHub Pages"
- "Configure website parameters and use them from within pages" 
keypoints:
- "GitHub serves pages generated from Markdown (and other) files on a branch of a GitHub repository specified by the user"
- "By convention, if you create a branch called `gh-pages` it will automatically be published as a website by GitHub
on a special URL "
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
now look into how to do some website configuration.

## Simple Parameter Configuration
We have already mentioned that GitHub has an engine under the hood to build functional websites out of your content. 
This engine is called Jekyll and its main configuration options are specified in `_config.yml` file placed in your 
site’s root directory. We will talk more about Jekyll in the following episodes. `_config.yml` file is written 
in the language called YAML - a human-readable data-serialization language that allows us to define scalar 
parameters, lists, and dictionaries (hashes). 

> ## YAML 
>
> [YAML](https://yaml.org/) is a human-readable data-serialization language. It is commonly used for configuration files and in 
> applications where text data is being stored or transmitted and it is programming language agnostic.  
>
{: .callout}

Let's create some configuration parameters for our website.

1. From GitHub interface, create `_config.yml` file in your site’s root directory.
2. Add parameters `title`, `description` and `email` to it as:

    ~~~
    title: "Research Project Website"
    description: "Research Project Description"
    email: team@my.research.org
    ~~~  
    {: .language-yaml}

3. Commit your changes.

Let's see how we can use these parameters from our pages. Site-wide information and configuration settings from 
`_config.yml` are made available as `site.parameter_name` variable in every page/file within the website/repository. 
There is a number of 
[predefined site-wide variables](https://jekyllrb.com/docs/variables#site-variables) available to you 
(such as `site.title` and `site.email`). Others (such as `site.description`) you can define yourself. 

We will now make use of these parameters in our pages.

1. Modify index.md file to look like:
   ~~~
    # site.title
     site.description    
   
    [Team members](team.md) 
   
    Contact us at [mailto: site.email](site.email).
   ~~~     
   {: .language-md}
    TODO: fix md code to show curly braces around site parameters and not to render values but show verbatim
 
2. Note that site parameters will not render nicely in GitHub but will in the website.

In addition to site-wide configuration available via the `site` global variable, page-specific information is 
available to you via the `page` global variable. Some of these are pre-defined (like `page.title`); 
others you can define yourself. Check this [list of predefined page parameters](https://jekyllrb.com/docs/variables#page-variables).

## More Complex Parameter Configuration

We can make use of `_config.yml` to define more complex parameters using list or dictionaries/hashes. For example, we may want 
to save the names or our team members, their roles and start dates inside the `_config.yml` to make use of this 
information throughout the website.

1. Modify `_config.yml` file to add a list of team_members (each team member is defined as a hash and 
indentation level in YAML is important): 

    ~~~
    team_members: [
        {name: "Jane Smith", role: "maintainer", start_date: "2018-03-15"},
        {name: "Albert Hamilton", role: "editor", start_date: "2017-12-01"},
        {name: "Alice Dauncey", role: "developer", start_date: "2020-01-04"}
        ]
    ~~~   
    {: .language-yaml}

2. Access `team_member` values in `team.md` file in a loop to print all their names and roles.

    ~~~                            
    ## Project team members
    {% for team_member in site.team_members %}
      Name: {{ team_member.name }}, role: {{ team_member.role }}  
    {% endfor %}
    ~~~   
    {: .language-md}
    TODO: fix md code to show curly braces around site parameters and not to render values but show verbatim
        
3. This way, if you need to add, remove or modify a team member, you can simply do it in `_config.yml` without modifying
`team.md`. 

# Summary

GitHub Pages is a static site hosting service that takes files in various formats 
(Markdown, HTML, CSS, JavaScript, etc.) 
straight from a repository on GitHub, runs them through its website build engine Jekyll and builds then into a website, 
and publishes it on the Web. A website can be configured via special YAML file `_config.yml` (located in the root of 
the website repository),
containing site-wide parameters or via individual page-specific parameter. 
{% include links.md %}
