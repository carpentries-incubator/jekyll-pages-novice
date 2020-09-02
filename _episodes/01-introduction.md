---
title: "Introduction"
teaching: 0
exercises: 0
questions:
- "What is static web content?"
- "Why should I use GitHub or GitLab Pages to create my website?"
objectives:
- "explain what a static site generator does."
- "choose the appropriate tool for their website/project."
keypoints:
- "A static site generator combines page-specific content with layout elements and styling information to construct individual webpages."
- "GitHub/GitLab Pages is a good choice for people who are already familiar with Git and GitHub/GitLab."
- "This approach can be used to create a relatively small website/blog on a limited budget."
---

When we use a web browser to visit a page on the World-Wide Web,
the browser asks for information from a server -
a computer storing the data relevant to the site and configured to receive and respond to requests for that data.
Assuming there were no problems at this stage
(e.g. asking for a page which doesn't exist, or being unable to reach the server),
our browser receives and interprets this information
to render and display the webpage on our screen.
(A web developer would probably be horrified to read such a gross oversimplification,
which is just one reason why
web developers are not the target audience of this tutorial.)

The information displayed by the web browser is a combination of
**HTML** - a hierarchical format describing the structural elements of the page and their raw content -
**CSS** - an ordered set of styling instructions telling the browser how to organise and format that content -
and any **images** that should be embedded in the page.
Other information received from the server,
but not displayed by the browser,
includes **metadata** and other non-visible elements in the HTML -
information about the site that could be relevant for a computer
but probably isn't interesting to a human
(there are [exceptions][qwantz-easter-egg-ext] to this) -
and scripts that the browser may run to do something
in response to various triggers.

> ## Writing Basic HTML
>
> TODO: brief overview of tags,
> including strong, heading, and link.
> Fill-in-the-blanks exercise to write HTML to recreate some example text.
{: .challenge }

## Hello world in HTML

When learning a new programming language,
you may often find a references to the popular `Hello world`.
These examples typically capture the simplest code that
can produce and display the `Hello world` on screen.

As HTML requires certain tags to be present and almost always in matching pairs (open `<tag>` and closing `</tag>`).
HTML documents tend to be get verbose rather quickly.

The simplest, valid HTML `Hello world` is:

```html
<html>
  <head>
  </head>
  <body>
    <p>Hello World<p>
  </body>
</html>
```

So as you can imagine, writing long HTML documents by hand is rather painful.
Notice that we didn't specify anything about how and where the text should be displayed.
To achieve this we would additionally need to include CSS instructions.

Sites consisting of pages whose content doesn't change
after that initial information is received by the server
are referred to as _static_.
Conversely, sites whose pages can be updated after loading,
with information continuing to be passed between browser and server,
are called _dynamic_.
This lesson focuses on static sites and tools that can be used to create them,
known as **Static Site Generators**.

TODO: add discussion of when SSGs are useful and when not.

One of the advantages of using static site generators is that
they remove the need for us to manually produce a lot of HTML,
allowing us to focus on the human-readable content we want our pages to contain.
However, we still need a way to tell the generator how we want our content
to look when it's displayed in the browser.
For that, we will use a tool called Markdown.

> ## The perfect tool for the job
>
> Given the following types of websites,
> reason if a static site generator is an appropriate solution to implement them.
>
> 1. A personal website with *About* and *Projects* sections
> 2. A forum or discussion platform
> 3. A community blog or news website
> 4. A search engine (such as google.com)
> 5. A wiki (such as wikipedia.com)
> 6. An online book
>
> > ## Solution
> >
> > 1. In most cases, **Yes**. This kind of content is typically written/edited by one person and meant to have a read-only access to visitors.
> > 2. Most likely **No**. Such website requires interactivity and ways to identify who wrote what content.
> >
> > For questions 3 to 5 the answer is both **Yes** and **No** depending on the requirements and necessary functionality.
> >
> > 3. A simple blog or news website, maintained by a small set of users, is perfectly achievable by using a static generator. For very large groups of content creators or if access to articles needs to be controlled individually, using a static generator will lead to difficult technical challenges.
> > 4. Implementing something as sophisticated as Google's search would be close to impossible with a static generator. That said, it's possible to have a simple engine that searches across all pages produced by a static generator using clever indexing solutions.
> > 5. A simple wiki is perfectly doable with a static generator, however it becomes limiting as soon as its content needs to be edited or discussed by many users, as is the case of Wikipedia.
> > 6. Definitely **Yes**. Static generators are perfect for this type of website. They typically provide ways to avoid repeating content (variables and templates), automatic creation of a *Table Of Contents*, among other goodies.
> {: .solution }
{: .challenge }

[qwantz-easter-egg-ext]: https://chrome.google.com/webstore/detail/dinosaur-comics-easter-eg/bojkkeeefjmeogpgnlomodfkkfkfhabj
