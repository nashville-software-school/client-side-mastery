# Daily Journal

The Daily Journal application will be your opportunity to take the concepts you learn in class, and practice with the exercises and apply them elaboratively throughout the course.

## Daily Journal Design and Layout

Your first step is to build a `form` component in HTML through which you will enter your daily journal entries. It should contain the following fields.

1. Date field. Input elements in HTML can be of type `date` which will automatically render a calendar control for you to use.
1. Concepts covered. A short input field of type `text` where you enter in what concept(s) were covered and are driving the journal entry.
1. Journal entry. This is a `textarea` field where you can enter in as much text about what you learned, how you felt, and plans for the upcoming days.
1. Mood. This should be a `select` element with as many `option` child elements as you would like to describe your mood for the day. You can start with the simply happy, fine, and sad values, or pick your own scaling system.

After you have completed the form, place a `button` element beneath it labeled `Record Journal Entry`, or any other text that you would like.

## Getting Started

### Project Directory and First Files

Create a new sub-directory in your `workspace` directory named `daily-journal`. In that directory, create an `index.html` file and a `journal.css` file.

![](./images/97RFcUEOLV.gif)

Once those are created, open Visual Studio Code with the `code .` command in the terminal. Once it launches, you are ready to start coding.

### Boilerplate HTML Code

Open your `index.html`. Visual Studio Code provides many shortcuts and can write boilerplate code for you, which you then customize for your needs. Just type in the letters `html` and in the Intellisense context menu that appears, choose the "Simple HTML5 starting point" item to get some boilerplate HTML.

Change your CSS file to `journal.css`, and go ahead and remove the `<script>` element for now. We don't need it just yet.

![html boilerplate](./images/zRTljYM6kq.gif)

## Building the Journal Form

You are going to use the `form` component, the `fieldset`, `label`, `input`, `textarea`, `select`, and the `option` elements to build your form.

The first step is to create a date field.

![date field creation](./images/MArcqtbyj6.gif)

Then create an `<h1>` element above the form containing the text _Daily Journal_.

Save your file. Go to the terminal. Type in `hs -o`. Once the browser launches, open your dev tools to ensure you aren't viewing a cached version of the site. Refresh the browser if you need to.

You should see this.

![date field in action](./images/Qy2gJq5gv8.gif)

## Create the Remaining Fields

Now you create the rest of the fields using HTML elements. When you are done, this is how your form should look.

![](./images/daily-journal-basic-layout.png)

## Column Layout with Flexbox

Now use the `display: flex`, and `flex-direction: column` CSS properties to change your form to look like this.

![](./images/P5FPNsVInT.gif)
