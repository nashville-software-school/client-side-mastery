#!/bin/bash
set -u

rm ./src/App.css
rm ./src/App.test.js
rm ./src/logo.svg
rm ./src/reportWebVitals.js
rm ./src/setupTests.js
rm ./public/*

touch -p ./public/index.html

# index.html
echo '<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Web site created using create-react-app"
    />
    <title>Honey Rae Repairs</title>
  </head>
  <body>
    <div id="root"></div>
  </body>
</html>' >./public/index.html

# index.js
echo 'import { Repairs } from "./components/Repairs"
import { createRoot } from "react-dom/client"
import "./index.css"
import { BrowserRouter } from "react-router-dom"

const container = document.getElementById("root")
const root = createRoot(container)
root.render(
    <BrowserRouter>
        <Repairs />
    </BrowserRouter>
)
' >./src/index.js

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
}' >./src/index.css

# App.js
echo 'export const App = () => {
  return <></>
}' >./src/App.js
