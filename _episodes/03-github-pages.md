---
title: "Hosting Pages on GitHub"
teaching: 0
exercises: 0
questions:
- "How do I publish my pages via GitHub?"
objectives:
- "publish Markdown files as HTML on the web with GitHub Pages"
keypoints:
- "GitHub serves pages generated from `.md` files on a branch specified by the user"
---

# Publishing a repository as a website

GitHub Pages is a service from GitHub to publish a website directly from a Git repository.

> ## Why Github?
>
> There are other services available to create and publish website but one of the main advantage of GitHub Pages is that you can version control your website and therefore keep track of all your changes. This is particularly helpful for collaborating on a project website. [GitLab](https://about.gitlab.com/) offers very similar services but GitHub pages is the simplest approach.
>
{: .callout}

Let's start from the github repository we have created in the previous episode {{ site.project-pages }}. One important file you should have is `index.md`: it will become the homepage of your project website.

In this episode, you will learn how to turn your project repository into a website.

## Create gh-pages branch

GitHub Pages uses a special branch in your GitHub repository to look for website content, and by default this branch is named `gh-pages`. This branch does not exist yet and the first step is to create it from the Github interface.

**TODO: add figure once we agree on the name of the repo **

![gh-pages branch creation](../fig/gh-pages_branch_creation.jpg)

It is a convention used by Github and we will learn later on to change this default behavior.

> ## GitHub interface versus command line
> Branches can also be created from the command line but for simplicity, we will only show you how to publish a website using the GitHub interface.
>
{: .callout}



> ## What is a branch?
> You may have never heard about git branches and wonder what they mean. It is not so important at this stage and for now we will assume that a branch in git is similar to the branch of a tree. From now, we will make sure to update `gh-pages` branch and the default `master` branch will remain untouched.
>
{: .callout}


## Configure repository as a website

### View your website

As mentionned above, by default, GitHub serves automatically GitHub pages from `gh-pages` branch but where can we view our website?

- Click on the repository "**Settings**" as shown on the figure below:

**TODO: add picture**

![Repository settings](../fig/repo_settings.png)


- Then search for "GitHub pages" to find the web address of your website and click on the shown link. Your default browser will open and show your project website:

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


{% include links.md %}
