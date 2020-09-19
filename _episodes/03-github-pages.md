---
title: "Hosting Pages and Websites on GitHub"
teaching: 0
exercises: 0
questions:
- "How do I publish my page or a website via GitHub?"
- "How do I configure my website?"
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

# Publishing a repository as a website

GitHub Pages is a service from GitHub to publish a website directly from a Git repository.

> ## Why Github?
>
> There are other services available to create and publish website but one of the main advantage of GitHub Pages is that you can version control your website and therefore keep track of all your changes. This is particularly helpful for collaborating on a project website. [GitLab](https://about.gitlab.com/) offers very similar services but GitHub pages is the simplest approach.
>
{: .callout}

Let's start from the github repository we have created in the previous episode {{ site.project-pages }}. One important file you should have is `index.md`: it will become the homepage of your project website.

In this episode, you will learn how to turn your project repository into a website.

## Turn on GitHub Pages for your main branch

GitHub Pages uses a special branch in your GitHub repository to look for website content, and by default this branch is named `gh-pages`. 

It is a convention used by Github and we need to change this default behavior because the content of our repository is under a branch called *main*.

> ## What is a branch?
> You may have never heard about git branches and wonder what they mean. It is not so important at this stage and for now we will assume that a branch in git is similar to the branch of a tree. The default branch (automatically created with a new github repository is called *main*.
>
{: .callout}


### View your website

As mentionned above, by default, GitHub serves automatically GitHub pages from `gh-pages` branch but where can we view our website?

- Click on the repository "**Settings**" as shown on the figure below:

**TODO: add picture**

![Repository settings](../fig/repo_settings.png)


- Then search for "GitHub pages" to find the web address of your website and select *main* branch so that GitHub pages are built from *main* and not *gh-pages*.

- Once GitHub pages are built, open the link (hilighted green box): your default browser will open and show your project website.

![Default project website](../fig/default_website.png)

You should see the contents of the `index.md` file that we created earlier. 

It can take from a few seconds to a few minutes before your website is available. It is mostly due to GitHub availability and complexity of your project website. You know it is ready when the link appears in green with a "tick" in front of the web address (as shown on the figure above).

What happened behind the hood, is that GitHub converted markdown to HTML. At the top of your website, the name of your repository appears as a link to the project homepage.

> ## What if my browser does not open?
>
> If your default web browser did not open and does not show the project website, we recommend to manually open your favourite web browser and paste the project web address.
>
{: .callout}



> ## Add new content to your website
>
> Update `index.md` from the GitHub interface and commit your changes.
> then view your changes on the website.
> 
> > ## Solution
> > **TODO**
> {: .solution }
{: .challenge }


As shown in the first episode, you can have several markdown files in your repository and link them, for instance from `index.md`. In the following exercise, this is what we will practice.

> ## Create a new markdown file team.md and link it from `index.md`
>
> - Create a new markdown file with your Github username and email address
> - Update `index.md` from the GitHub interface and commit your changes.
> - then view your changes on the website.
> 
> > ## Solution
> > **TODO**
> {: .solution }
{: .challenge }

> ## Render website from another branch
> By default GitHub renders `gh-pages` automatically (no configuration needed). However, you can change this behavior and choose any branches in your GitHub repository.
>
{: .callout}

### Understanding GitHub web addresses

The resulting website does not have a random web address. It is formed by:

- your github username or organization name
- followed by `github.io`
- And finally the repository name: / {{ site.project-pages }}

> ## Customize domain
> **TODO**
{: .callout}

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

1. Modify index.md file to look like:
   ~~~
    # {% raw %}{{ site.title }}{% endraw %} 
     {% raw %}{{ site.description }}{% endraw %}    
   
    [See our full team](team.md) 
   
    Contact us at [mailto:{% raw %}{{ site.email }}{% endraw %}]({% raw %}{{ site.email }}{% endraw %}).
   ~~~     
   {: .source}

2. Note that site parameters will not render nicely in GitHub (they will be displayed as text
`{% raw %}{{ site.PARAMETER_NAME }}{% endraw %}` rather than the parameter's rendered value) but will in the website.

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
    {name: "Sarah Becker", role: "project lead", start_date: "2016-02-01"},
    {name: "Jane Smith", role: "maintainer", start_date: "2018-03-15"},
    {name: "Albert Hamilton", role: "editor", start_date: "2017-12-01"},
    {name: "Alice Dauncey", role: "developer", start_date: "2020-01-04"}
]
~~~
{: .language-yaml}
This defines team_members as a list of 3 elements; each element is a hash with key-value pairs for name, role and date.

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
      
    Contact us at [mailto:{% raw %}{{ site.email }}{% endraw %}]({% raw %}{{ site.email }}{% endraw %}).                      
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

# Summary

GitHub Pages is a static site hosting service that takes files in various formats
(Markdown, HTML, CSS, JavaScript, etc.)
straight from a repository on GitHub, runs them through its website engine Jekyll and builds them into a website,
and publishes them on the Web. A website can be configured via special YAML file `_config.yml` (located in the root of
the website repository),
containing site-wide parameters or via individual page-specific parameters. Next, we move on to look into more detail in
Jekyll and its corresponding scripting language Liquid.

{% include links.md %}
