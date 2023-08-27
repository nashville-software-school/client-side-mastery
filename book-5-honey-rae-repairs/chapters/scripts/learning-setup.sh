#!/bin/bash
set -u

rm ./src/App.css
rm ./src/App.test.js
rm ./src/logo.svg
rm ./src/reportWebVitals.js
rm ./src/setupTests.js
rm ./public/*

mkdir ./src/services
mkdir ./src/components

# index.html
echo '<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Learning Moments</title>
  </head>
  <body>
    <div id="root"></div>
  </body>
</html>
' >./public/index.html

# index.js
echo 'import { App } from "./App"
import { createRoot } from "react-dom/client"
import "./index.css"

const container = document.getElementById("root")
const root = createRoot(container)
root.render(<App />)' >./src/index.js

# index.css
echo '/*Reset Default Styling
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
}
' >./src/index.css

# App.js
echo '
export const App = () => {
  return <div>Hello World!</div>
}' >./src/App.js

echo '# README
## Writing a Readme
Write the steps needed to run this application. Leave yourself some notes or key learning moments while building this application
' >./README.md
