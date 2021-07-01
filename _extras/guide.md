---
title: "Instructor Notes"
---

## Episode: [Introduction](../introduction/index.html)

### HedgeDoc/CodiMD Collaborative Notes Document
We recommend the usage of [HedgeDoc](https://hedgedoc.org) (formerly called CodiMD) and for instance 
[The Carpentries CodiMD instance](https://codimd.carpentries.org) for creating your new documents. 
All instructors can use it for note-taking when preparing or teaching this lesson and we also encourage 
its usage during the workshop for asking questions and collaborating during exercises, especially when using breakout rooms. 
The main advantage is that it uses Markdown so it can easily convince learners on the importance of learning Markdown. 
Make use of [HackMD Mechanics](https://coderefinery.github.io/manuals/hackmd-mechanics/#basic-controls) 
from [CodeRefinery](https://coderefinery.org/). Take time to orient your learners to using the document early on 
to be ensure everyone understands how to use HedgeDoc.

### Hello World in HTML 
When demonstrating "Hello World in HTML" you may choose to write the example HTML in a text editor 
before viewing the saved file in a browser. Or you may prefer to write the HTML directly into the workshop 
HedgeDoc/CodiMD shared notes document, which will provide immediate visual feedback on the rendered equivalent. 
The advantage to using the workshop CodiMD is that it reduces the need to switch between so many windows and introduce 
the text editor. The advantage of opening a plain `.html` file in the browser is that it 
clearly demonstrates the utility of the `title` element.

### Shared Website Example Repository 
When multiple instructors are teaching this lesson, the person who demonstrates creating the website repository 
(at the end of the [Introduction](../introduction/index.html) episode) should remember to add the 
other instructors as collaborators on that repository. 
This will save you trying to maintain consistency between multiple demo repositories while also handling questions, 
helping people who are stuck, etc.

## Episode: [Authoring With Markdown](../markdown/index.html)

### 'Add Your Repository Details to HedgeDoc' Exercise
We recommend doing the ["Optional Exercise: Add Your Repository Details to CodiMD" exercise](../markdown/index.html#optional-exercise-add-your-repository-details-to-codimd) when teaching online, as it is 
very useful for helpers to have links to all the learner repos **and** rendered websites for troubleshooting. 
Then when a learner messages in chat, the helper can find their repo and look at the commit history to find the error.

## Episode: [Hosting Websites on GitHub](../github-pages/index.html

## Episode: [Starting With Jekyll](../starting-jekyll/index.html)

## Episode: [Reusing Blocks of Content](../includes/index.html)

### `includes` vs `include`
Learners sometimes get confused about when to use `includes` vs `include` in the 
[Reusing Blocks of Content](../includes/index.html) episode. Good to stress that the folder is `_includes` 
(e.g. it contains several files that can be included hence the plural form) and when you want to use something from that folder you `include` it.

## Episode: [Page Layouts](../layouts/index.html)

### Layout Names Confusion
Learners sometimes get confused about conventional names of layouts used in Jekyll - for example `home` 
layout vs. home page (`index.html`), `page` layout vs. page used as a term for 'webpage', `default` layout was not much better 
either. While it is not a must, recommendation here is to stick with this conventional terminology as it is 
reused across different Jekyll websites that learners may come across in future and to spend some time clarifying this. 

## Episode: [Working With Filters](../filters/index.html)

## Episode: [Loops and Collections](../arrays/index.html)

## Episode: [Wrap-up](../wrap-up/index.html)

{% include links.md %}
