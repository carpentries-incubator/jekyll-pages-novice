---
title: "Starting with Jekyll"
teaching: 0
exercises: 0
questions:
- "How can I use values stored in variables in my pages?"
- "How can I configure global values/settings for my site?"
- "How can I reuse the same chunks of material in multiple pages?"
objectives:
- "substitute variable values into their page content"
- "adjust the configuration of their pages"
- "create reusable blocks of content and insert them into pages"
keypoints:
- "Variables can be defined globally in `_config.yml` or locally in the YAML header"
- "Variable values can be substituted into page content with `{{ double_curly_brackets }}`"
---

- create and set a parameter in YAML header ("front matter")
- use parameter in page body
- use a global parameter from `_config.yml`
- use it again in another page
- change the value of the global parameter and study the effect


> ## Creating your own variable
>
> Let's practice making and using variables.
> Think of a variable you may want to use in your `index.md` page.
> Some possible options include: your name, the institution you work at, the PI of your lab group.
> Create the variable and reference it in your `index.md` and save/commit that to your repository.
> What did you add to your `index.md` to create this variable?
> Where did you add the line above to your `index.md`?
> How did you reference that variable?
>
> > ## Solution
> >
> > We will create the `pi` variable by adding the following line to the yaml header.
> > ~~~
> > pi: "Ada Lovelace"
> > ~~~
> >
> > Here is an example of using it in the `index.md` file
> > ~~~
> > ---
> > pi: "Ada Lovelace"
> > ---
> >
> > This project is lead by {% raw %}{{ page.pi }}{% endraw %}.
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}


> ## Making a global variable
>
> Grad student Davis wants to use their current institution name throughout their personal website
> but will soon be leaving to become a postdoc at another institution.
> They have created a variable `current_institution` in the YAML header of the `index.md` pages on their site.
> What changes would they make to use this variable on other pages as well?
> How might they need to change the following text on their `index.md` page after those changes?
>
> ~~~
> Davis currently works at {% raw %}{{ page.current_institution }}{% endraw %}.
> ~~~
> {: .source}
>
> > ## Solution
> >
> > They need to move the variable to the `_config.yml`
> > Then they would change the index code to the following.
> > ~~~
> > Davis currently works at {{ site.current_institution }}.
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}



{% include links.md %}
