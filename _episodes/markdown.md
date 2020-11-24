---
title: "Authoring with Markdown"
teaching: 0
exercises: 0
questions:
- "How can I write content for my webpages?"
- "How do I link to other pages?"
objectives:
- "Create simple pages with formatted text"
keypoints:
- "Markdown is an relatively easy way to write formatted text"
---

# Markdown
Markdown is a lightweight markup language, i.e. a convention for adding
style information to textual content.
As the name Markdown indicates, the syntax elements of this language
are shut *down* to a minimum.
Having a rather minimalistic syntax, text formatted in Markdown is comparably
readable.
This might be one reason for Markdown having become the language of choice
for formatted user input on websites like, for example:
- [Stack Exchange](https://stackexchange.com/)
- [GitHub](https://github.com/)
- [GitLab](https://about.gitlab.com/).


# Where to Start Writing Markdown?
A lot of tools for rendering Markdown source code exist.
Rendering is the process of generating a nice view of the content
using the style information included in the source text.
Chances are high, your editor can do this.
As we are working towards authoring websites using Jekyll and GitHub pages,
we will use GitHub straight away for learning the basics of Markdown.
The GitHub project you created in the last episode contains a file `README.md`.

The picture below shows the projects default view.
This view includes a rendered view of the content inside the file `README.md`.
Your project should look quite similar except for the red circle around the pencil symbol.

<img src="../fig/group_website_repo_edit.png" alt="On the homepage of a GitHub repository, the edit button is positioned to the top right of the README preview" width=600>


You can click on that pencil symbol to open an editing interface of your projects `README.md` file.
Once you've clicked the pencil symbol, GitHub will open that file in the editing interface.

<img src="../fig/group_website_readme_edit.png" alt="Editing interface of the group websites README file" width=600>

You can change the content and have a look at the rendered view by clicking the _Preview changes_ tab.

<img src="../fig/group_website_readme_render.png" alt="Preview of the rendered content of the group websites README file" width=600>

Let's add `Some **bold** font` and see what happens when we preview it using the preview tab.
If new sections were added you will also find green vertical bars visually highlighting the new content.
To save the content to the file `README.md`, scroll down a bit and you'll see a _Commit changes_ menu
where you can commit your changes.
After having changed something, the commit menu looks like this:

<img src="../fig/group_website_readme_commit.png" alt="Commit menu for changes done in the GitHub web interface is located at the bottom of the website" width=600>

> ## Writing a Commit Message
>
> A commit message is a short, descriptive, and specific comment that will help us remember later on what we did and why.
> You find more about writing commit message in [this section][swc-git-novice-episode-track-changes] of the Git-novice lesson.
>
{: .callout}


# Writing Markdown

Now that we know about the editing interface and preview tab of our projects `README.md`
we can use it as a text editor and investigate selected Markdown features.

Our `README.md` already contains vanilla text and
two formatting features:
- Heading `# group-website`
- Emphasis using `**bold**`.

Let's learn some more markdown by adding some formatting and see what happens when we preview it using the preview tab.
Add the following to your `README.md` file.

~~~
# group-website
Repo for learning how to make websites with Jekyll pages

## Learning Markdown

Vanilla text may contain *italic* and **bold words**.

This paragraph is separated from the previous one by a blank line.
Line breaks  
are caused by two trailing spaces at the end of a line.

[Carpentries Webpage](https://carpentries.org/)


### Carpentries Lesson Programs:
- Software Carpentry
- Data Carpentry
- Library Carpentry
~~~
{: .language-markdown }

You can then click the preview tab again to see how the formatting renders.

<img src="../fig/markdown_preview_formatting.png" alt="Preview of the formatting added to the Readme" width=600>

To keep this addition to our `README.md` we need to commit these changes to save them.
Scroll down to the bottom of the page, add a commit message if you wish, and then commit to the `main` branch.

<img src="../fig/committing_formatting_addition_to_readme.png" alt="Committing the formatting added to the Readme" width=800>

Let's do an exercise to try out writing more markdown.

> ## Try out Markdown
> Use [this cheatsheet][github-flavored-markdown] to add to your readme:
>
> - Another second level heading
> - Some text under that second level heading that includes an link and ~~strikethrough~~ text.
> - A third level heading
> - A numbered list
> - Bonus: Add this image <https://github.com/carpentries/carpentries.org/blob/main/images/TheCarpentries-opengraph.png>
>
> > ## Example Solution
> > For example your markdown might look like the following:
> > ```
> > ## More info on the lesson
> > You can find this lesson [here](https://carpentries-incubator.github.io/building-websites-with-jekyll-and-github-or-gitlab/).
> >
> > ### Four reasons you should learn Markdown:
> >
> > 1. Less formatting than HTML
> > 2. Easy to read even with formatting
> > 3. Commonly used for websites and software development
> > 4. We ~~don't~~ use it in The Carpentries
> >
> > ![Carpentries Logo](https://github.com/carpentries/carpentries.org/blob/main/images/TheCarpentries-opengraph.png)
> > ```
> > <img src="../fig/markdown_exercise.png" alt="Rendered solution to the markdown exercise" width=800>
> >
> {: .solution }
{: .challenge }

We will continue to use markdown and learn more throughout the rest of the lesson.

> ## Markdown Cheatsheet
>
> Markdown offers a variety of formatting features.
> Have a look at this [cheatsheet][github-flavored-markdown] to get an overview or look things up.
>
{: .callout}

> ## Optional Exercise: Add Your Repository Details to CodiMD
>
> If your instructors are using _CodiMD_ to take notes during this workshop,
> use Markdown to add a link in that document to the repository you are using
> to follow along with this lesson.
> The link text should be your GitHub username, and the target your repository.
> Your instructors will direct you towards the appropriate location in the
> document to add your link.
>
{: .challenge }

> ## Markdown Flavours
>
> Basic Markdown features are the same on all platforms such as GitHub and GitLab.
> However, there are differences in the details and scope of the features offered.
> To address this situation, the Markdown
> used at GitHub is called **GitHub-flavored Markdown**
> and the one used at GitLab is called **GitLab Flavored Markdown**.
> - So be aware of:
>   - [GitHub-flavored Markdown][github-flavored-markdown]
>   - [GitLab-flavored Markdown][gitlab-flavored-markdown]
{: .callout}




{% include links.md %}
