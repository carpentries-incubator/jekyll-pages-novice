---
title: "Wrap-up"
teaching: 0
exercises: 0
questions:
- "What have we learned so far?"
- "What other resources are available for learning more on Jekyll?"
objectives:
- "Summarise all the different technologies that are coming together to create Jekyll websites"
- "Recap the anatomy of a Jekyll website repository"
- "Identify other resources about Jekyll and creating webpages."
keypoints:
---

## Summary

Throughout this lesson, we learned how to create formatted webpage content with Markdown, configure a GitHub 
repository to use the Jekyll static site generator to build our Markdown pages and various other files 
(HTML snippets, CSS, images, etc.) into a set of HTML documents that are then served via the GitHub Pages framework.

HTML is the basic building block of webpages served on the Internet. It describes the structural elements of the 
page and their raw content and is often aided by CSS - an ordered set of styling instructions telling the browser 
how the content from within HTML document should be organised and formatted. It is very verbose and difficult 
to write by hand - beyond their initial design HTML pages are meant to be processed by machines. 
For that reason, Markdown was introduced - a lightweight Markup language and a convention for 
adding style information to textual content while retaining the human-readable form. It is not as rich in syntax as HTML,
but comparably more usable by a wider audience. 

Jekyll is a powerful static site generator behind GitHub Pages that supports a high degree of reuse and separation of 
content and presentation. It can be configured via the `_config.yml` YAML file 
that stores site-wide variables accessible from anywhere within our site. 
It also allows us to define and reuse page-wide variables, by defining them as the *front matter* at the beginning of
our Markdown pages. Used in conjunction with Liquid, its scripting language, Jekyll allows us to include content from 
reusable markup snippets that can be repeated on multiple pages and to embed code snippets and filters into our pages to 
create some complex content assembly pipelines. That way, adding a new blog post to your website may only involve 
creating a file in the `_posts` folder of your website, setting it to use the 'post' template and focusing on its 
content - and it will magically appear at the top of your Blog timeline without any extra effort on your part.

If you are a learner or an instructor that has some time left in their workshop - at this point 
we strongly recommend visiting the [Jekyll Themes episode in Extras section](../_extras/jekyll_themes.md) of the 
lesson. It builds on the knowledge we 
gained so far and expands on how to build more complex and 
professional-looking websites by reusing existing website themes. Here, we are going to recap the anatomy of 
a GitHub Pages website and its common building blocks, which will also help you better understand Jekyll themes once 
you get to learning about them. 

## Jekyll Website Directory Structure

We are going to visit the directory structure of the [Jekyll website used to develop this lesson](https://github.com/carpentries-incubator/building-websites-with-jekyll-and-github-or-gitlab), which uses the 
following [Jekyll theme](https://github.com/carpentries-incubator/template). Reusing this template to create a new lesson can be achieved by copying the theme repository and customising it by adding your episodes in the appropriate place.





## Further Resources
- [JekyllRB - the ultimate source of Jekyll resources](https://jekyllrb.com/)
- [Guides](https://jekyllrb.com/resources/#guides)
- [Jekyll themes](https://jekyllrb.com/resources#themes)
