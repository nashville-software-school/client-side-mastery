#!/bin/bash
set -u

mkdir -p $HOME/workspace/sink-repair/api
mkdir -p $HOME/workspace/sink-repair/src/scripts
mkdir -p $HOME/workspace/sink-repair/src/styles
cd $HOME/workspace/sink-repair/api

echo '{

}' > database.json

cd $HOME/workspace/sink-repair/src

echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Maude and Merle'"'"'s Sink Repair</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>
        <main id="container">

        </main>

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

const mainContainer = document.querySelector("#container")

const applicationHTML = `
<h1>Maude and Merle'"'"'s Sink Repair</h1>
<article class="serviceForm">

</article>

<article class="serviceRequests">
    <h2>Service Requests</h2>

</article>
`

mainContainer.innerHTML = applicationHTML
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
