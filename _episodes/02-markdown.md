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


> ## Reproduce Markdown Source Code: Heading, Text, Emphasis
>
> Try to reproduce the source code of this challenge from the following rendered view:
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
> > {: .markdown }
> {: .solution }
{: .challenge }


> ## Lists, Enumerations
>
> Try to reproduce the source code of this challenge from rendered view:
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
> > {: .markdown }
> {: .solution }
{: .challenge }




> ## Add Code
> Fill in the blanks below to create this rendered view
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
> Therefore, referring to variables, e.g. _path_ in a formatted way is great.
>
> Larger code snippets look like this:
>
> ___
> msg = 'Hello World'
> print(msg)
> ___
> ~~~
> {: .source }
> 
> > ## Solution
> > ~~~
> > Discussing code details can be very helpful.  
> > Therefore, referring to variables, e.g. `path` in a formatted way is great.
> >
> > Larger code snippets look like this:
> > ```
> > print('Hello World')
> > ```
> > ~~~
> > {: .markdown }
> {: .solution }
{: .challenge }

> ## Flavors
>
> Basic Markdown features are the same on all platforms such as Github and Gitlab.
> However, there are differences in the details and scope of the features offered.
> To address this situation, the Markdown 
> used at Github is called **Github-flavored Markdown**
> and the one used at Gitlab is called **GitLab Flavored Markdown**.
> - So be aware of
>   - [Github-flavored Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
>   - [GitLab Flavored Markdown](https://docs.gitlab.com/ee/user/markdown.html)
{: .callout}




{% include links.md %}
