#!/bin/bash
set -u

rm ./src/App.css
rm -rf ./src/assets
rm -rf ./public

# index.html
echo '<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Honey Rae Repairs</title>
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
echo '/* Import the google web fonts you want to use */
@import url("https://fonts.googleapis.com/css2?family=Nunito:wght@300&family=Quicksand&family=Roboto:wght@100&display=swap");

/* FONTS
font-family: "Nunito", sans-serif;
font-family: "Quicksand", sans-serif;
font-family: "Roboto", sans-serif; 
*/

/* COLOR PALETTE */
/* Feel free to change these values and create your own color palette! https://coolors.co/ is a great resource */
:root {
  --primary: #ffb400;
  --secondary: #00a6ed;
  --info: #7fb800;
  --warning: #f6511d;
  --white: #ffffff;
  --offWhite: #f2f2f3;
  --dark: #3b3b3b;
  --outline: #c3c0c0;
  --appBackground: #dddade;
}

/* GLOBAL STYLES */
body,
button,
input,
select,
textarea {
  font-family: "Nunito", sans-serif;
}

body {
  background-color: var(--appBackground);
  margin: 0;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: "Roboto", serif;
}

/* This prevents all the links in the app from having default underline */
a {
  text-decoration: none;
  color: inherit;
}
/* This prevents all the links in the app from turning purple after visiting */
a:visited {
  color: inherit;
}
/* This prevents all the inputs in the app from having that blue outline when in focus */
input:focus {
  outline: none;
}

/* GLOBAL STYLING FOR ALL THE BUTTONS BUTTONS */
button {
  padding: 0.5rem 1rem;
  border: 1px solid transparent;
  border-radius: 0.5rem;
  color: var(--white);
  cursor: pointer;
}

/* These are all the color options for the buttons */
/* If you change the color variables, be sure to change the hover colors to be a darker shade of the colors you chose*/
.btn-primary {
  background-color: var(--primary);
}

.btn-primary:hover {
  background-color: #e5a000;
}

.btn-secondary {
  background-color: var(--secondary);
}

.btn-secondary:hover {
  background-color: #0097d7;
}

.btn-warning {
  background-color: var(--warning);
}

.btn-warning:hover {
  background-color: #e14617;
}

.btn-info {
  background-color: var(--info);
}

.btn-info:hover {
  background-color: #71a500;
}

/* This CSS can be deleted. It is only used for the first chapter */
.welcome {
  text-align: center;
  margin: 5rem 14rem;
  font-size: 4rem;
  color: aliceblue;
  font-weight: bold;
  text-shadow: 2px 3px 4px lightslategray;
}
' >./src/index.css

# App.js
echo 'export const App = () => {
  return <div className="welcome">Welcome to your first React Application!</div>
}' >./src/App.jsx
