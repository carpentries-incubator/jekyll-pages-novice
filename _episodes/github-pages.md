---
title: "Hosting Websites on GitHub"
teaching: 0
exercises: 0
questions:
- "How do I publish my page or a website on the Web via GitHub?"
objectives:
- "Publish Markdown files as HTML on the Web with GitHub Pages"
keypoints:
- "GitHub Pages is a static site hosting service that takes files in various formats
  (Markdown, HTML, CSS, JavaScript, etc.)
  straight from a repository on GitHub, runs them through its website engine Jekyll, builds them into a website,
  and publishes them on the Web"
- "By convention, if you create a branch called `gh-pages` in your repository, it will automatically be published as a website by GitHub"
- "You can configure any branch of a repository to be used for website (it does not have to be `gh-pages`)"
- "GitHub publishes websites on special URLs formatted as 'https://GITHUB_USERNAME.github.io/REPOSITORY_NAME'"

---

Now that you know how to create Markdown files, let's see how to turn them into Web pages. GitHub has a
service just for that called GitHub Pages.

# Publishing a Website With GitHub Pages
[GitHub Pages](https://docs.github.com/en/github/working-with-github-pages/about-github-pages) is a free website
hosting service by GitHub that takes files (Markdown, HTML, CSS, JavaScript, etc.)
from your GitHub repository which is configured as a website,
optionally runs the files through a build process, combines them and publishes them as a website.
Any changes you do to the files in your website's GitHub repository
will be rendered live in the website.

There are other services available to create and publish websites but one of the main advantages of GitHub Pages is that you can version control your website and therefore keep track of all your changes. This is particularly helpful for collaborating on a project website. [GitLab](https://about.gitlab.com/) offers very similar services but GitHub pages is the simplest approach.

Let's continue from the GitHub repository we have created in the previous episode. One important file you should already have is `README.md`, which will become the homepage of your project website (until we add the index file later on).

## Enabling GitHub Pages
In order to tell GitHub that your repository contains a website that needs rendering you need to configure GitHub Pages settings. You can do so from your repository's `Settings`, as explained below.

You may have noticed that when we created our repository in previous episode, by default GitHub created a branch called `main` and stored our files there. We now need to tell GitHub Pages that this branch contains our website files.

> ## What is a Branch?
> You may have never heard about Git branches and wonder what they mean. A branch is one version of your project (the files in your repository) that can contain its own set of commits - you can have many branches (versions) of your repository. The default branch automatically created with a new github repository is called `main`.
>
{: .callout}
1. Click on the repository's `Settings` tab (the one with the little cog) as shown on the figure below:

    <img src="../fig/repo_settings.png" alt="Repository settings" width="width=800">

2. Scroll down to "GitHub Pages" settings. You will see that these are currently disabled. Select branch `main` to
enable GitHub Pages for this repository and to tell GitHub which branch to use as a source.

    <img src="../fig/default_website.png" alt="Default website branch" width="width=800">

3. The link to your repository's website will appear in the highlighted box above. If you click the link  - your default browser will open and show your project website. If this does not happen, you should manually open your favourite web browser and paste the URL.

    <img src="../fig/website_url.png" alt="Project website URL" width="width=800">

4. It may take a while (from a few seconds to a few minutes) for GitHub to compile your website (depending on GitHub's availability and the complexity of
your website) and it may not become visible immediately. You will know it is ready when the link appears in green box with a "tick" in front of the web address (as shown in the figure below).

    <img src="../fig/website_url_green_tick.png" alt="Project website URL - successfull build" width="width=800">

5. Once ready, you should see the contents of the `README.md` file that we created earlier, rendered as a website.

    <img src="../fig/first_website.png" alt="First website" width="width=800">

> ## Using Branch `gh-pages` for Websites
> By convention, GitHub Pages uses branch called `gh-pages` to look for the website content. By creating a branch with that name, you implicitly tell GitHub that you want your content published and you do not need to configure
> GitHub Pages in `Settings`. Once you create `gh-pages` from your current branch (typically `main`, created by default when you created the repository), you can then choose to delete the other branch to avoid any confusion about where your content is stored.
{: .callout}

Either of the above two approaches to turning a repository to a website will give you the same result - the `gh-pages` approach is perhaps more common as it favours convention over configuration.

## Understanding GitHub Pages' URLs

You may have noticed a slightly strange URL for your website appearing in that green box with a "tick" in front of it.
This URL was generated by GitHub Pages and is not random. It is formatted as
'https://GITHUB_USERNAME.github.io/REPOSITORY_NAME' and is formed by appending:

- your GitHub username or organisation name under which the repository is created (GITHUB_USERNAME)
- '.github.io/' (GitHub's web hosting domain)
- the repository name (REPOSITORY_NAME)

Because the repository name is unique within one's personal or organisational GitHub account - this naming
convention gives us a way
of neatly creating Web address for just about any GitHub repository without any conflicts.

> ## Customising Domain
>  GitHub Pages supports using custom domains, or changing your site's URL from the default
>'https://GITHUB_USERNAME.github.io/REPOSITORY_NAME' to any domain you own.
> [Check out the documentation on configuring a custom domain for your GitHub Pages site](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/configuring-a-custom-domain-for-your-github-pages-site).
{: .callout}

## Making Your Pages More Findable

On the right hand side of your repository on GitHub, you can see the details of your repository under 'About'. It is good
practice to update your repository details with a brief description. This is also a place where you can put
your repository's Web URL (as not everyone will have access to your repository's `Settings` to find it)
and add descriptive topics or tags about the content or technologies used in your repository or project.

You can edit the details of your repository by clicking on the little cog button as shown on the figure below.

<img src="../fig/repository_details.png" alt="Repository details" width="width=800">

By doing this, you add a link to the repository's website on your repository's landing page and anyone (including yourself) can access it quickly when visiting your GitHub repository.

## Index Page

Up to now, the content of your webpage is identical to what visitors to your repository on GitHub will see in the project's `README.md` file. It is often better to have different content in the homepage of your site - aimed at visitors to the website - than in the README, which is supposed to provide information about the GitHub repository e.g. license information, local installation instructions, the structure and configuration of the repository, etc. By default, the homepage for a GitHub Pages website is built from a file called `index.md`: in the absence of a file with that name the "fallback" option is to use `README.md`, which is why your homepage is currently being built from that file.

To separate the contents of the repository's README from the website's homepage, create a new file called
`index.md`.

To create a new file from GitHub interface,
click the `Add file` button and select `Create new file` from the dropdown.

<img src="../fig/github_create_file.png" alt="Create file" width="width=800">

Next, type some text into `index.md`, as shown below.

<img src="../fig/github_add_index.png" alt="Create file" width="width=800">

We are now ready to start adding more content to our website. Let's do some exercises.

> ## Exercise: Add New Content to the Website
> Add a new section 'Description' to file `index.md` and add some description.
> 1. From the GitHub interface, edit file `index.md` and add a new section called `Description` to it, with some text about the project.
> 2. View the changes on the website.
>
> > ## Solution
> > 1. Edit `index.md` file to look something like:
> >
> >    ~~~
> >    # My Research Project
> >
> >    ## Description
> >    This research project is all about teaching you how to create websites with GitHub pages.
> >    ~~~
> >    {: .language-markdown }
> >
> > 2. Go to your website. It should now look like:
    ![Add About section to index](../fig/episode03_exercise01_add_description.png)
> {: .solution }
{: .challenge }

Both the pages built from `README.md` and `index.md`
have been served to us at the "root" of our site:
the page we see when we point our browser to
`https://YOURUSERNAME.github.io/REPONAME/`.
The actual name of this page is `index.html`
(navigate to `https://YOURUSERNAME.github.io/REPONAME/index.html`
to see this for yourself),
i.e. _the file `index.md` is converted by Jekyll to a page called `index.html`_.

As more Markdown files are added to your repository,
the same process will automatically occur for those files too.
For example, a file called `contact.md` will be converted to `contact.html`
and `cake-recipes.md` will become `cake-recipes.html`.
However, unlike the special `index.html` file,
which Web browsers look for as the default "landing page" to display when
pointed towards a URL with a trailing forward slash,
we must request these pages by name when we want to view them on the Web.
Continuing with the above examples,
if we wanted to visit the `cake-recipes.html` page,
we would need to point our browser at
`https://YOURUSERNAME.github.io/REPONAME/cake-recipes.html`,
and `https://YOURUSERNAME.github.io/REPONAME/contact.html`
for the page built from `contact.md`.

However, when linking **between pages of the same site** (_relative linking_),
GitHub Pages allows us to refer to the name of the original Markdown file,
and handles the URL conversion for us.
This means that, to link to `cake-recipes.html` from `index.html`,
we can write a link such as
`[Read our recipe for Triple Chocolate Raspberry Surprise Cake and more](cake-recipes.md)` and Jekyll will convert this to the appropriate URL.
(It won't write or bake the recipe for us, unfortunately.)
Relative links can point to files in other directories too:
`recipes/chocolate-salted-caramel-pudding.md` and `../local-dentists.md`
are both valid link targets
(assuming the relevant files exist in your repository).

> ## Exercise: Create Links Between Pages
>
> Create a new file `about.md` and link to it from `index.md`.
> 1. From the GitHub interface, create a new Markdown file called `about.md` and add some content to it.
> 2. Add a link to `about.md` from `index.md`.
> 3. View the changes on the website.
>
> > ## Solution
> >
> > 1. Create new file called `about.md` from the GitHub interface:
> >    ![Create file](../fig/github_create_file.png)
> >    Edit `about.md` file to look something like:
> >
> >    ~~~
> >    # About
> >
> >    ## Project
> >    This reseach project is all about teaching you how to create websites with GitHub pages.
> >
> >    ## Funders
> >    We gratefully acknowledge funding from the XYZ Founding Council, under grant number 'abc'.
> >
> >    ## Cite us
> >    You can cite the project as:
> >
> >    > *My research project. Zenodo. https://zenodo.org/record/doi*
> >
> >    ## Contact us
> >
> >    - Email: [team@my.research.org](mailto:team@my.research.org)
> >    - Twitter: [@my_research_project](https://twitter.com/my_research_project)
> >    ~~~
> >    {: .language-markdown }
> >
> >    Note how we used various Markdown syntax: quoted text (`>`), italic font (`*`) and external links
> >    (a combination of square `[]` and round brackets `()` containing the link text and mailto or regular Web URLs respectively).
> >
> > 2. Edit `index.md` to add a link to `about.md`.
> >
> >    ~~~
> >    # My Research Project
> >
> >    ## Description
> >    This research project is all about teaching you how to create websites with GitHub Pages.
> >
> >    More details about the project are available from the [About page](about).
> >    ~~~
> >    {: .language-markdown }
> >
> > 3. Go to your website and click the link to 'About' page. It should look like:
> >    ![About page](../fig/episode03_exercise01_about_page.png)
> >
> >    Note that the URL has '/about' appended to it - you can use this URL to access the 'About' page directly.
> {: .solution }
{: .challenge }

{% include links.md %}
