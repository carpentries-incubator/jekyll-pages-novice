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

![gh-pages branch creation](../fig/gh-pages_branch_creation.jpg)

> ## GitHub interface versus command line
> Branches can also be created from the command line but for simplicity, we will only show you how to publish a website using the GitHub interface.
>
{: .callout}


It is a convention used by Github and we will learn later on to change this default behavior.

> ## What is a branch?
> You may have never heard about git branches and wonder what they mean. It is not so important at this stage and for now we will assume that a branch in git is similar to the branch of a tree. From now, we will make sure to update `gh-pages` branch and the default `master` branch will remain untouched.
>
{: .callout}



- Explain what gh-pages branches are for
- Create a gh-pages branch in the repo

## Configure repository as a website

- Configure gh-pages branch to be used for serving website (in Settings)
- Already configured now by defaul, show the settings and where to find the URL
- Show how to add this URL in the website field of the repo
- Show the rendered page in GitHub IO, explain this is the HTML version that was converted from the md file with repo name at the top then our md content
- Explain how URLs are created
- Convention over configuration: gh-pages branch is used for websites by default, but master or any other branch can be used (callout)

## Rendering a repository as a website (heading)

- explain publicly viewable URLs and how they are generated
- make another change to index.md and see how the website is updated (point out the green tick when GH finishes building the page as feedback to user - as it can take some time)
- Exercise - create another page called team.md with team members of the project and link to it from the index.md

- push to a GitHub repo
- activate Pages in the repo settings
- change something in `index.md`
- go to landing page
- make a change in `index.md` and see how landing page updates
- add a second `.md`
- add minimal YAML header

{% include links.md %}
