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

{% include links.md %}
