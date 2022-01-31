#!/bin/bash
set -u

mkdir -p "$HOME/workspace/sink-repair/api"
mkdir -p "$HOME/workspace/sink-repair/src/scripts"
mkdir -p "$HOME/workspace/sink-repair/src/styles"
cd "$HOME/workspace/sink-repair/api"

echo '{
    "plumbers": [],
    "completions": [],
    "requests": [
        {
            "id": 1,
            "description": "Aut sint voluptatem fugit eius quas molestiae modi.",
            "address": "34445 Bianka Ports",
            "budget": 400,
            "neededBy": "2021-08-27"
        }
    ]
}' > database.json

cd "$HOME/workspace/sink-repair/src"

echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Maude and Merle'"'"'s Sink Repair</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>

        <script type="module" src="./scripts/main.js"></script>
    </body>
</html>
' > index.html

echo '@import url("https://fonts.googleapis.com/css?family=Comfortaa|Patua+One");

/*Typography
--------------------------------------------------------------*/
body,
button,
input,
select,
textarea {
	color: #404040;
	font-family: "Comfortaa", Arial, sans-serif;
	font-size: 14px;
	line-height: 1.5;
}

h1,h2,h3,h4,h5,h6 {
  font-family: "Patua One", serif;
  letter-spacing: 2px;
}
' > ./styles/main.css

echo '
export const SinkRepair = () => {
    return `
    <h1>Maude and Merle'"'"'s Sink Repair</h1>
    <section class="serviceForm">
    </section>

    <section class="serviceRequests">
        <h2>Service Requests</h2>
    </section>
    `
}
' > ./scripts/SinkRepair.js

echo 'import { SinkRepair } from "./SinkRepair.js"


const mainContainer = document.querySelector("#container")

const render = () => {
    mainContainer.innerHTML = SinkRepair()
}

render()
' > ./scripts/main.js

echo 'const applicationState = {

}
' > ./scripts/dataAccess.js

echo '
export const ServiceForm = () => {
    let html = ""

    return html
}
' > ./scripts/ServiceForm.js
