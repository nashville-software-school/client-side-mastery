# Daily Journal

The Daily Journal application will be your opportunity to take the concepts you learn in class, and practice with the exercises and apply them elaboratively throughout the course.

Ultimately the daily journal will display a list of posts with the ability to add, edit, and delete a post. For now, we are just focusing on our layout.

## Design and Layout
Before coding, it is essential that you plan what you will build. Use an online tool (_we like [sketchboard.io](https://sketchboard.io/)_) or you can use the tried &amp; true pen with paper method to create a wireframe visual of your journal. Wireframes establish the basic structure of a page to determine where your components will appear once you are finished with the visual design stage of a project.

The journal app will include the following components:

1. A logo. You can call your application **Daily Journal** or you can pick your own name.
1. Your name so the people know whose journal entries they are looking at.
1. A form to collect journal entry information. The form component will contain child components.
	1. Date field. Input elements in HTML can be of type `date` which will automatically render a calendar control for you to use.
	1. Concepts covered. A short input field of type `text` where you enter in what concept(s) were covered and are driving the journal entry.
	1. Journal entry. This is a `textarea` field where you can enter in as much text about what you learned, how you felt, and plans for the upcoming days.
	1. Mood. This should be a `select` element with as many `option` child elements as you would like to describe your mood for the day. You can start with the simply happy, fine, and sad values, or pick your own scaling system.
	1. A `button` element labeled `Record Journal Entry`, or any other text that you would like. This button will, when clicked, save the entry to a database. You will learn how to do this in Book 5.
1. A list component for all journal entries. Each item in the list is a component whose responsibility is to display an HTML representation of a single journal entry. Draw a few boxes to indicate that it is a list.
1. Individual entries. Each entry component will include a `Delete` button and a `Edit` button.

1. A footer area that includes your name with a link to GitHub and copyright.


## Semantic HTML and Layout

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
* Get more specific with `<h2>` to `<h6>`, `<p>`, and `<a>`.
* Continue this process until you block in the page with all of the details from your wireframe.


## Build the Journal Form

You are going to use the `form` component, the `fieldset`, `label`, `input`, `textarea`, `select`, and the `option` elements to build your form.

The first step is to create a date field.

```html
<main id="container">
    <form class="entryForm">
        <fieldset>
            <label for="entryDate">Date</label>
            <input type="date" name="entryDate" class="entryForm__date">
        </fieldset>
    </form>
</main>
```

Then create an `<h2>` element above the form containing the text _Daily Journal_.

Save your file. Go to the terminal. Type in `serve`. You should see something like this.

![date field in action](./images/Qy2gJq5gv8.gif)

## Create the Remaining Fields

Now you create the rest of the fields using HTML elements. When you are done, the form should look simlar to this.

![](./images/daily-journal-basic-layout.png)


## Column Layout with Flexbox

Now use the `display: flex`, and `flex-direction: column` CSS properties to change your form to look like this.

![image](./images/P5FPNsVInT.gif)

## List Element

After your form HTML, but before the closing `</main>` tag, add the following article element. You will be using this element in later chapters to display your journal entries.

```html
<article id="entries"></article>
```
