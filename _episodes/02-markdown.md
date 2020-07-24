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


> ## Reproduce Markdown source code: Heading, Emphasis, Lists, Enumerations
>
> Try to reproduce the source code of this challenge from rendered view:
> # This largest heading is followed
> ### by a two times smaller one.
>
> Vanilla text may contain *italic* and **bold words** and
> 
> - a list of items
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
>     4. **without** disturbing the enumeration count.
> 
>
> > ## Solution
> > ~~~
> > # This largest heading is followed
> > ### by a two times smaller one.
> >
> > Vanilla text may contain *italic* and **bold words**.and
> > 
> > - a list of items
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
