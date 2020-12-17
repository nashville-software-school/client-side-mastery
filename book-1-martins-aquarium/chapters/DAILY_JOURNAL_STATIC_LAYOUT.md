# Daily Journal Semantic HTML and Layout

Use your wireframe as a guide to create the HTML for your daily journal. 

## Project Directory and First Files

1. Create a new sub-directory in your `workspace` directory named `daily-journal`.
1. In that directory, create an `index.html` file.
1. Create a sub-directory named `scripts`. This directory will contain all of your JavaScript files in the future.
1. Create a `styles` sub-directory and create a `main.css` file in it.

Once those are created, make sure you are in your root directory and open Visual Studio Code with the `code .` command in the terminal. Once it launches, you are ready to start coding.

### Boilerplate HTML Code

Open your `index.html`. Visual Studio Code provides many shortcuts and can write boilerplate code for you, which you then customize for your needs. Just type in the letters `html` and in the Intellisense context menu that appears, choose the "html:5" item to get some boilerplate HTML.

Inside the `<head>` tag, create a new line, type in `link` and choose the "link:css" item and change the href to `main.css`

## HTML Layout

Refer to your wireframe and write semantic HTML for the page.

* Start broad with `<header>`, `<main>` and `<footer>`.
* Get more specific with `<section>`, `<article>`, and `<form>`. (Don't worry about the details of the form - you will build that out below).
* Get more specific with `<h2-h6>`, `<p>`, and `<a>`.
* Continue this process until you block in the page with all of the details from your wireframe.
 

## Build the Journal Form

You are going to use the `form` component, the `fieldset`, `label`, `input`, `textarea`, `select`, and the `option` elements to build your form.

The first step is to create a date field.

![date field creation](./images/MArcqtbyj6.gif)

Then create an `<h2>` element above the form containing the text _Daily Journal_.

Save your file. Go to the terminal. Type in `serve`. Then go to Chrome and open your dev tools to ensure you aren't viewing a cached version of the site. Refresh the browser if you need to.

You should see something like this.

![date field in action](./images/Qy2gJq5gv8.gif)

## Create the Remaining Fields

Now you create the rest of the fields using HTML elements. When you are done, the form should look simlar to this.

![](./images/daily-journal-basic-layout.png)


## Column Layout with Flexbox

Now use the `display: flex`, and `flex-direction: column` CSS properties to change your form to look like this.

![](./images/P5FPNsVInT.gif)

**Once your project is pushed to GitHub, be sure to include your wireframe in the `README.md` file.**

##
## UI/UX Challenge
** This is an optional challenge once you meet MVP.

### Best Practices for Form Design
Take a look at Luke Wroblewski's article on form design, the following sections will get you started. [webforms_lukew.pdf](webforms_lukew.pdf)
1. Inputs: pp18-48 (lots of visual examples)
2. Actions: pp49-56

Refactor your Daily Journal to include best practices for form design.
