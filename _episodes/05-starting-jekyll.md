---
title: "Starting with Jekyll"
teaching: 0
exercises: 0
questions:
- "How can I use values stored in variables in my pages?"
- "How can I configure global values/settings for my site?"
- "How can I reuse the same chunks of material in multiple pages?"
objectives:
- "Substitute variable values into page content"
- "Adjust the configuration of the site and individual pages"
- "Create reusable blocks of content and insert them into pages"
keypoints:
- "Variables can be defined globally in `_config.yml` or locally within YAML header (*front matter*) of a page"
- "Variable values can be substituted into page content with Liquid notation: `{{ variable }}`"
- "Global variables are accessible from any page of your website; local variables can only be accessed within 
the page in which they were defined (and any pages that include this page)"
---

[Jekyll](https://jekyllrb.com/) is a powerful static site generator behind GitHub Pages. It creates static HTML
website content out of various files in your repository (Markdown files, CSS style sheets, page templates/layouts, etc.).
This 'compiled' content is then served as you website via `github.io` Web domain (remember your website's URL
from the previous episode?). Jekyll automatically re-generates all the HTML pages for your website each time you 
make a change to your repository.

Jekyll makes managing your website easier because it depends on templates. Templates (or layouts in Jekyll notation) are blueprints that can be reused by multiple pages. For example, instead of repeating the same navigation markup on every page you create (such a header, a footer or a top navigation bar), you can create a Jekyll layout that gets used on all the pages. Otherwise, each time you update a navigation item - you'd have to make edits on every page. We will cover Jekyll layouts in a bit; for now let's start learning Jekyll and its scripting language called [Liquid](https://shopify.github.io/liquid/basics/introduction/). 

## Global Parameters
Jekyll's main configuration options are specified in a `_config.yml` file, which is written in a language 
called [YAML](https://yaml.org/) and placed in your site’s root directory. Parameters configured in `_config.yml` 
are global or site-wide - that means they are accessible in every page of your website.

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
    title: "Building Websites in GitHub"
    description: "This research project develops training materials for reseachers wanting to learn to build project
    websites in GitHub with GitHub Pages."
    email: "team@my.research.org"
    ~~~
    {: .language-yaml}

3. Commit your changes.

Global configuration settings from
`_config.yml` are made available as `site.PARAMETER_NAME` variable in every page within the website. So, global parameter `email` we defined above would be accessed as `site.email`. 

In order to access the parameter's value within a page, you use Liquid's notation to output content by surrounding a variable in curly braces as `{% raw %}{{ variable }}{% endraw %}`. 

> ## Predefined Global Parameters
>In addition to the global parameters you define, Jekyll also makes a number of
[useful predefined site-wide variables](https://jekyllrb.com/docs/variables#site-variables) available to you within your website: e.g. `{% raw %}{{ site.time }}{% endraw %}` (the current time) or `{% raw %}{{ site.pages }}{% endraw %}` (a list of all pages).
{: .callout}

Let's make use of global parameters in our pages.

1. Modify `index.md` file to make use of our global parameters like this:

   ~~~
    # {% raw %}{{ site.title }}{% endraw %}
   
    ## Description
    {% raw %}{{ site.description }}{% endraw %}

    Have any questions about what we do? [We'd love to hear from you!]({% raw %}mailto:{{ site.email }}{% endraw %})
   ~~~  
   
2. We can use the same parameter in different pages. Let's reuse `{% raw %}{{ site.description }}{% endraw %}` and 
`{% raw %}{{ site.email }}{% endraw %}` in `about.md` like this:

    ~~~ 
    # About
   
    ## Project
    {% raw %}{{ site.description }}{% endraw %}
           
    ## Funders
    We gratefully acknowledge funding from the XYZ Founding Council, under grant number 'abc'.
   
    ## Cite us
    You can cite the project as:  
    
    >    *My research project. Zenodo. https://zenodo.org/record/doi*
    
    ## Contact us
   
    Email: [{% raw %}{{ site.email }}{% endraw %}](mailto:{% raw %}{{ site.email }}{% endraw %})   
    
    Twitter: [@my_research_project](https://twitter.com/my_research_project)   
    ~~~
    
3. Go to your website to see the changes.
4. Note that site parameters will not render nicely when viewing files in GitHub (they will be displayed as text
`{% raw %}{{ site.PARAMETER_NAME }}{% endraw %}` rather than the parameter's rendered value) but will in the website.

> ## Exercise 
> In `about.md` we have a Twitter URL under the 'Contact us' section. That's one piece of information that could go into 
> global parameters in `_config.yml` as you may want to repeat it on a footer of every page. 
> Make changes to your website to extract Twitter URL as a global parameter.
> > ## Solution
> > 1. Add parameter twitter to `_config.yml`: 
> >
> >    ~~~
> >    title: "Building Websites in GitHub"
> >    description: "This research project develops training materials for reseachers wanting to learn to build project
> >    websites in GitHub with GitHub Pages."
> >    email: "team@my.research.org"
> >    twitter: "https://twitter.com/my_research_project"
> >    ~~~
> >    {: .language-yaml}
> > 2. Make use of the twitter parameter in `about.md`: 
> >
> >    ~~~  
> >    # About
> >   
> >    ## Project
> >    {% raw %}{{ site.description }}{% endraw %}
> >           
> >    ## Funders
> >    We gratefully acknowledge funding from the XYZ Founding Council, under grant number 'abc'.
> >   
> >    ## Cite us
> >    You can cite the project as:  
> >    
> >    >    *My research project. Zenodo. https://zenodo.org/record/doi*
> >    
> >    ## Contact us
> >   
> >    Email: [team@my.research.org](mailto:{% raw %}{{ site.email }}{% endraw %})   
> >    
> >    Twitter: [@my_research_project]({% raw %}{{ site.twitter }}{% endraw %})   
> >    ~~~
> >    
> > 3. Note that you should not see any changes to your website really. However, you can now access your Twitter URL from
> > any website page, should you need to.    
> {: .solution}
{: .challenge}

> ## Reuse and Reduce
> Jekyll's global parameters are a useful way to keep all your site-wide configuration in 
> a single place (even if you only use them once). In combination with Jekyll layouts/templates (to be covered in the next episode) they are a great way of creating reusable markup snippets that can be repeated on multiple or even on every page of your website. Reuse helps you reduce the amount of code you have to write.  
{: .callout}

### List Parameters and For Loops

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

3. In file `index.md` add the team lead's name so that it looks like:

    ~~~
    # {% raw %}{{ site.title }}{% endraw %}
   
    ## Description
    {% raw %}{{ site.description }}{% endraw %}

    The project is led by {% raw %}{{ site.team_members[0]["name"] }}{% endraw %}.
    [See our full team](/about#team)

    Have any questions about what we do? [We'd love to hear from you!]({% raw %}mailto:{{ site.email }}{% endraw %})
    ~~~
    
If you need to add, remove or modify a team member, you can simply do it in `_config.yml` without modifying your pages. 
Let's now change the values of a global parameter and study the effect.

> ## Exercise
> Your project team has changed. The team lead has left and in her place is a new person: 'Tom Cat', who started on 
>'2020-10-01'. In addition, the team was expanded and a new developer called 'Alice Dauncey' who joined on '2020-09-15'. 
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

## Local Parameters

In addition to global (site-wide) parameters available via the `site` global variable, Jekyll makes _local_ (page-specific) information available to you via the `page` variable. 
Some of these are pre-defined - like `page.title`, which gives you the title of the page that is currently active/being visited. Others you can define yourself. Check this [list of predefined page parameters](https://jekyllrb.com/docs/variables#page-variables).

You can define local parameters using YAML notation within a Markdown page by including it in a page header and delimiting the header with triple-dashed lines `---`. These headers are called *front matter* and are 
used to set variables and metadata on individual pages in your Jekyll site.

> ## Front matter        
> From [Jekyll's website](https://jekyllrb.com/docs/front-matter/):
>
>   >   Any file that contains a YAML front matter block will be processed by Jekyll as a special file. The front matter must be the first thing in the file and must take the form of valid YAML set between triple-dashed lines.
{: .callout}

Here is an example:
    
    ---
    layout: post
    title: "My first blog post"
    author: "Danger Mouse"
    ---
    
Between these triple-dashed lines, you can overwrite predefined variables (like `page.layout` or `page.title`) or create custom ones you need locally on the page (like `page.author`). These variables will then be available for you to access using Liquid's tags {% raw %}{{{% endraw %} and {% raw %}}}{% endraw %} further down in the file and also in any files that include this one.                                                                                                                     

> ## Exercise
>
> Let's practice making and using local variables. Think of a local variable you may want to use only in your `about.md` or `index.md` page.
> If you cannot think of any, create a local variable called 'lesson-example' with the value 
> of 'https://carpentries.github.io/lesson-example/' and reference it in your `index.md`. 
>
> What did you add to your `index.md` to create this variable?
> Where did you add the front matter in your `index.md`?
> How did you reference that variable?
>
> > ## Solution
> >
> > Create a YAML header at the very top of `index.md` and add the `lesson-example` variable in between the
> > triple-dash delimiters. Your file should now look like:
> > 
> >    ~~~
> >    ---  
> >    lesson-example: "https://carpentries.github.io/lesson-example/"
> >    ---  
> >   
> >    # {% raw %}{{ site.title }}{% endraw %}
> >   
> >    ## Description
> >    {% raw %}{{ site.description }}{% endraw %}
> >
> >    The project is led by {% raw %}{{ site.team_members[0]["name"] }}{% endraw %}.
> >    [See our full team](/about#team)
> >
> >    Have any questions about what we do? [We'd love to hear from you!]({% raw %}mailto:{{ site.email }}{% endraw %})
> >    ~~~
> > 
> > You can now reference the value within your `index.md` page as 
> > `{% raw %}{{{% endraw %} page.example-lesson {% raw %}}}{% endraw %}`:
> > 
> >    ~~~
> >    ---  
> >    lesson-example: "https://carpentries.github.io/lesson-example/"
> >    ---    
> >    
> >    # {% raw %}{{ site.title }}{% endraw %}
> >   
> >    ## Description
> >    {% raw %}{{ site.description }}{% endraw %}
> >
> >    The project is led by {% raw %}{{ site.team_members[0]["name"] }}{% endraw %}.
> >    [See our full team](/about#team)
> >                                      
> >    See some [examples of our work]({% raw %}{{{% endraw %} page.example-lesson {% raw %}}}{% endraw %}).
> >
> >    Have any questions about what we do? [We'd love to hear from you!]({% raw %}mailto:{{ site.email }}{% endraw %})
> >    ~~~
> > Note that this variable is not accessible from `about.md` page and is local to `index.md`.
> {: .solution}
{: .challenge}

{% include links.md %}
