#!/bin/bash
set -u

rm -rf ./public
mkdir ./src/services

# index.html
echo '<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chuckle Checklist</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>' >./index.html

# main.jsx
echo 'import React from "react"
import ReactDOM from "react-dom/client"
import { App } from "./App.jsx"
import "./index.css"

const container = document.getElementById("root")
const root = ReactDOM.createRoot(container)
root.render(<App />)' >./src/main.jsx

# index.css
echo '/*Reset
--------------------------------------------------------------*/
html,
body,
div,
span,
applet,
object,
iframe,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
a,
abbr,
acronym,
address,
big,
cite,
code,
del,
dfn,
em,
img,
ins,
kbd,
q,
s,
samp,
small,
strike,
strong,
sub,
sup,
tt,
var,
b,
u,
i,
center,
dl,
dt,
dd,
ol,
ul,
li,
fieldset,
form,
label,
legend,
table,
caption,
tbody,
tfoot,
thead,
tr,
th,
td,
article,
aside,
canvas,
details,
embed,
figure,
figcaption,
footer,
header,
hgroup,
menu,
nav,
output,
ruby,
section,
summary,
time,
mark,
audio,
video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
menu,
nav,
section {
  display: block;
}
body {
  line-height: 1;
}
ol,
ul {
  list-style: none;
}
blockquote,
q {
  quotes: none;
}
blockquote:before,
blockquote:after,
q:before,
q:after {
  content: "";
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}' >./src/index.css

# App.jsx
echo 'import "./App.css"

export const App = () => {
  return <div>Hello World!</div>
}' >./src/App.jsx

# App.css
echo '@import url("https://fonts.googleapis.com/css?family=Roboto:400,700");
@import url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:300");

/* Add your own colors here */
:root {
  --col-0: #fbabb7;
  --col-1: #f391a0;
  --col-2: #ea3788;
  --col-3: #b0228c;
  --col-4: #282c34;
  --col-5: #a4eb7c;
}

h1 {
  font-family: "Source Sans Pro", sans-serif;
  font-weight: 300;
}

/* This styling is for the background of the app
It also keeps the box centered on the page */
body {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  min-height: 100vh;
  background-image: linear-gradient(
    -225deg,
    var(--col-1) 0%,
    var(--col-2) 48%,
    var(--col-3) 100%
  );
  padding: 50px 0;
  box-sizing: border-box;
  font-family: Roboto, sans-serif;
  font-weight: 400;
}

/* This is the styling for the box. */
#root {
  background: #f4f6f9;
  width: 80%;
  border-radius: 4px;
  box-sizing: border-box;
  padding: 50px;
  display: flex;
  justify-content: center;
  box-shadow: 2px 4px 10px hsla(0, 0%, 0%, 0.3),
    2px 4px 20px hsla(0, 0%, 0%, 0.2);
}

/* -------------------------- APP CUSTOM STYLES -------------------------- */
/* Heres some pre-made styling you can add you your elements to save some
time on styling. Youll have to think about the structure of your html and
add the given classes to the correct elements. Most elements will need parent
divs in order for these classes to work, so pay attention to the nested
styles. Learn more about nested selectors here: 
https://developer.chrome.com/articles/css-nesting 
Notes about each selector are added below. You are also welcome comment out 
these styles and create your own styles and layout for the application.

/** Class for the app container. It should be added to a div that wraps all of your jsx. */
.app-container {
  width: 80%;
}

/** Class for the heading container. It should be added to a div that wraps all the heading elements.*/
.app-heading {
  display: flex;
  flex-flow: column nowrap;
  align-items: center;

  /** Class for the text for the heading. It should be added to an h1 inside of the div with the .app-heading class*/
  .app-heading-text {
    font-size: 2.5rem;
    margin-top: 1rem;
  }
}

/** Targets all h2s in the app. Intended for the "Add Joke", "Untold", and "Told" headers*/
h2 {
  border: none;
  border-bottom: 3px solid var(--col-2);
  padding: 0.25rem 0;
}

/** Class for the container that wraps your input and button for adding a joke. */
.joke-add-form {
  display: flex;
  flex-wrap: nowrap;
  align-items: center;

  /** Class for the input element for a new one-liner*/
  .joke-input {
    border-radius: 0.5rem 0rem 0rem 0.5rem;
    border: 2px solid white;
    flex-grow: 1;
    margin: 1rem 0;
  }

  /** Adds styling for when the user clicks in the input field*/
  .joke-input:focus::placeholder {
    color: transparent;
  }

  /** Class for the button to add*/
  .joke-input-submit {
    width: 20%;
    margin: 1rem 0;
    border-radius: 0rem 0.5rem 0.5rem 0rem;
    background: white;
    color: var(--col-5);
    border: 2px solid var(--col-5);
  }

  /** Adds styling for when the user hovers over the button*/
  .joke-input-submit:hover,
  .joke-input-submit:active {
    cursor: pointer;
    transition: all 0.25s ease-in;
    background: var(--col-5);
    color: white;
  }

  /** Adds styles for both the joke-input class and the joke-input-submit class*/
  .joke-input,
  .joke-input-submit {
    outline: none;
    padding: 0.5rem 1rem;
  }
}

/** Class for the lists container. It should be added to a div that wraps both of your joke lists. */
.joke-lists-container {
  display: flex;
  flex-flow: row wrap;
  justify-content: space-between;
  align-items: flex-start;
  width: 100%;

  /** Class for a single list container. It should be added to a div that wraps a every element for a single list.*/
  .joke-list-container {
    flex-basis: 45%;
    width: 100%;

    /** Class for the count of told jokes. Add it to a <span> element within the <h2> for Told */
    .told-count {
      color: var(--col-5);
    }

    /** Class for the count of untold jokes. Add it to a <span> element within the <h2> for Untold */
    .untold-count {
      color: var(--col-0);
    }

    /** Adds styles for both the told-count class and the untold-count class*/
    .told-count,
    .untold-count {
      float: right;
    }
  }
}

/** Class for an individual <li>*/
.joke-list-item {
  border: none;
  border-bottom: 1px solid hsla(0, 0%, 50%, 0.5);
  margin: 5px 0;
  padding: 5px;
  box-sizing: border-box;
  display: flex;
  align-items: center;
  justify-content: space-between;

  /** Class for the joke text. Add it to a <p> element*/
  .joke-list-item-text {
    margin: 0;
    font-size: 0.7rem;
    flex-basis: 75%;
  }

  /** Classes for the action buttons. Wrap the buttons in their own div*/
  /** The toggle class is for the buttons to mark a joke as told or untold*/
  .joke-list-action-delete,
  .joke-list-action-toggle {
    border: none;
    padding: 5px;
    margin-left: 0.25rem;
    background: transparent;
    color: var(--col-4);
  }

  /** Adds styling for when the user hovers over the delete button*/
  .joke-list-action-delete :hover {
    color: var(--col-0);
    cursor: pointer;
    transition: all 0.1s ease-in;
  }

  /** Adds styling for when the user hovers over one of the toggle buttons*/
  .joke-list-action-toggle :hover {
    color: var(--col-5);
    cursor: pointer;
    transition: all 0.1s ease-in;
  }
}' >./src/App.css
