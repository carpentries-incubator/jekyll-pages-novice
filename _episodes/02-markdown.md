---
title: "Authoring with Markdown"
teaching: 0
exercises: 0
questions:
- "How can I write content for my webpages?"
- "How do I link to other pages?"
objectives:
- "create simple pages of formatted text"
keypoints:
- "Markdown is an relatively easy way to write formatted text"
- "Markdown and HTML tags can be used together in a single page"
- "I recommend writing Markdown links 'reference-style'"
- "The landing page for a website is conventionally named `index.md`"
---

- vanilla text
- adding a title
- bold & italic
- code
  - inline
  - code blocks & formatting
- links
  - inline style
  - reference style
  - reference style makes it easier to re-use and refactor links
- link out to a more comprehensive guide, e.g.
  - https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
  - https://docs.gitlab.com/ee/user/markdown.html
- save to a file called index.md
- put directory under version control with git
  - link to SWC git-novice

# Markdown
Markdown is a lightweight markup language, i.e. a convention for adding
style information to textual content.
As the name Markdown indicates, the syntax elements of this language
are shut *down* to a minimum.
Having a rather minimalistic syntax, text formatted in Markdown is comparably
well readable.
This might be one reason for Markdown having become the language of choice
for formated user input on websites like for example
- [Stack Exchange](https://stackexchange.com/)
- [GitHub](https://github.com/)
- [GitLab](https://about.gitlab.com/).


# Where to start writing Markdown?
A lot of tools for rendering Markdown source code exist.
Rendering is the process of generating a nice view of the content
using the style information included in the source text.
Chances are high, your editor can do this.
As we are working towards authoring websites using Jeckyll and GitHub pages,
we will use GitHub straight away for learning the basics of Markdown.
The GitHub project you created in the last episode contains a file `README.md`.

The picture below shows the projects default view.
This view includes a rendered view of the content inside the file `README.md`.
Your project should look quite similar except for the red circle around the pencil symbol.

![Warning: You should see a picture here displaying: Github repository for the group website](../fig/group_website_repo_edit.png)

You can click on that pencil symbol to open an edit view of your projects README file.
This looks like

![Warning: You should see a picture here displaying: Editing the group websites README file](../fig/group_website_readme_edit.png)

displaying the content of your projects README file.
You can change this content and have a look at the rendered view by clicking the `Preview Changes` tab.
This looks like

![Warning: You should see a picture here displaying: Rendering the group websites README file](../fig/group_website_readme_render.png)

If you like to permanently save the content to the file `README.md`, scroll down a bit and commit your changes.
After having changed something, the commit menu looks like this

![Warning: You should see a picture here displaying: Commit changes to the README file](../fig/group_website_readme_commit.png)


...> ## Reproduce Markdown Source Code: Heading, Text, Emphasis
>
> Try to reproduce the source code of the view which is rendered below this line:
>
> ---
>
> # This largest heading is followed
> ### by a two times smaller one.
>
> Vanilla text may contain *italic* and **bold words**.
>
> This **paragraph** is separated from the vanilla text paragraph by a blank line and
> line breaks
> are caused by two trailing spaces at the end of the lines.
>
>
> > ## Solution
> > ~~~
> > # This largest heading is followed
> > ### by a two times smaller one.
> >
> > Vanilla text may contain *italic* and **bold words**.
> >
> > This **paragraph** is separated from the vanilla text paragraph by a blank line and
> > these line breaks
> > are caused by two trailing spaces at the end of the lines.
> > ~~~
> > {: .source }
> {: .solution }
{: .challenge }


> ## Lists, Enumerations
>
> Try to reproduce the source code of this challenge from the rendered view below this line:
>
> ---
>
> - A list of items
> - can be
>   - deeply
>     - nested
> - returning to the top-level like this.
>
> New text blocks require **blank lines** and
>
> 23. enumerations
> 23. starting at any number
> 23. continue to increase
> 26. in steps of one.
>     1. Sub enumerations (in some editors have to start at **one**)
>     2. and can include
>        - sub lists
>     4. keeping the enumeration count.
>
> > ## Solution
> > ~~~
> > - A list of items
> > - can be
> >   - deeply
> >     - nested
> > - returning to the top-level like this.
> >
> > New text blocks require **blank lines** and
> >
> > 23. enumerations
> > 23. starting at any number
> > 23. continue to increase
> > 26. in steps of one.
> >     1. Sub enumerations (in some editors have to start at **one**)
> >     2. and can include
> >        - sub lists
> >     4. **without** disturbing the enumeration count.
> > ~~~
> > {: .source }
> {: .solution }
{: .challenge }




> ## Add Code
> Fill in the blanks below to create the rendered view below this line:
>
> ---
>
> Discussing code details can be very helpful.
> Therefore, referring to variables, e.g. `path` in a formatted way is great.
>
> Larger code snippets look like this:
> ```
> print('Hello World')
> ```
>
> ~~~
> Discussing code details can be very helpful.
> When doing so, it's great to be able to refer to variables, functions, etc, e.g. `path` in a formatted way.
>
> Larger code snippets look like this:
>
> ___
> print('Hello World')
> ___
> ~~~
> {: .source }
>
> > ## Solution
> > ~~~
> > Discussing code details can be very helpful.
> > When doing so, it's great to be able to refer to variables, functions, etc, e.g. `path` in a formatted way.
> >
> > Larger code snippets look like this:
> > ```
> > print('Hello World')
> > ```
> > ~~~
> > {: .source }
> {: .solution }
{: .challenge }


> ## Syntax Highlighting
> Syntax highlighting increases readability a lot.
> Below are code snippets written in HTML, Python, and R.
> Guess in which programming language each snippet is written
> and fill the gaps to activate syntax highlighting, creating this rendered view:
>
> -------------
> ```r
> print(paste("How","are","you?"), quote = FALSE)
> ```
> -------------
>
> ```python
> s = "How are you?"
> print s
> ```
> -------------
>
> ```html
> <!DOCTYPE html>
> <html>
> <body>
> > <a href=https://carpentries.org/>This is a link</a>
> > </body>
> </html>
> ```
> -------------
>
> ~~~
> ```_
> print(paste("How","are","you?"), quote = FALSE)
> ```
>
> ```______
> s = "How are you?"
> print s
> ```
>
> ```____
> <!DOCTYPE html>
> <html>
> <body>
> > <a href=https://carpentries.org/>This is a link</a>
> > </body>
> </html>
> ```
> ~~~
> {: .source }
>
> > ## Solution
> > ~~~
> > ```r
> > print(paste("How","are","you?"), quote = FALSE)
> > ```
> >
> > ```python
> > s = "How are you?"
> > print s
> > ```
> >
> > ```html
> > <!DOCTYPE html>
> > <html>
> > <body>
> > > <a href=https://carpentries.org/>This is a link</a>
> > > </body>
> > </html>
> ```
> > ~~~
> > {: .source }
> {: .solution }
{: .challenge }


Linking other websites is an essential feature of a website.
Bare URLs like https://carpentries.org/ can be made clickable like this
<https://carpentries.org/> by wrapping them into
angle brackets "\< \>".
However, usually the bare URL is not very nice and displaying a clickable
alternative text is beneficial.

You can define either
1. Inline style links - specifying the URL in line - or
2. Reference style links - referencing a reusable link reference -


> ## Links
> Fill in the blanks below to create the following rendered view:
>
> ---
>
> Examples:
> 1. [Inline link](https://carpentries.org/)
> 2. [Reference link][case-InSeNsiTiVe-reference-tag]
>
> [case-insensitive-reference-tag]: https://carpentries.org/
>
> ~~~
> Examples:
> 1. [___](https://carpentries.org/)
> 2. [___]___case-InSeNsiTiVe-reference-tag___
>
> [case-insensitive-reference-tag]: https://carpentries.org/
> ~~~
> {: .source }
>
> > ## Solution
> > ~~~
> > Examples:
> > 1. [Inline link](https://carpentries.org/)
> > 2. [Reference link][case-InSeNsiTiVe-reference-tag]
> >
> > [case-insensitive-reference-tag]: https://carpentries.org/
> > ~~~
> > {: .source }
> {: .solution }
{: .challenge }



> ## Flavors
>
> Basic Markdown features are the same on all platforms such as GitHub and GitLab.
> However, there are differences in the details and scope of the features offered.
> To address this situation, the Markdown
> used at GitHub is called **GitHub-flavored Markdown**
> and the one used at GitLab is called **GitLab Flavored Markdown**.
> - So be aware of
>   - [GitHub-flavored Markdown][github-flavored-markdown]
>   - [GitLab Flavored Markdown][gitlab-flavored-markdown]
{: .callout}




{% include links.md %}
