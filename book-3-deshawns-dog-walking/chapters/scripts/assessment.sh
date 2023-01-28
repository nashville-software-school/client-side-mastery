#!/bin/bash
set -u

mkdir -p "$HOME/workspace/assessments/debugging-events/scripts"
mkdir -p "$HOME/workspace/assessments/debugging-events/styles"
cd "$HOME/workspace/assessments/debugging-events"

echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>DeShawn Dog Walking Service</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>
        <main id="container">

        </main>

        <script type="module" src="./scripts/main.js"></script>
    </body>
</html>
' > index.html

echo '@import "detail.css";
@import url("https://fonts.googleapis.com/css?family=Comfortaa|Patua+One");

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

echo '.details {
    display: flex;
    justify-content: space-evenly;
}

.detail-column {
    flex-basis: 24%;
    margin: 0 2rem;
    padding: 0.5rem 4rem;
    border: 1px dotted rgb(61, 129, 196);
}

.pairings {
    padding: 1rem 5rem;
}
' > ./styles/details.css

echo 'import { Pairings } from "./Pairings.js"
import { Celebrities } from "./CelebrityList.js"
import { Kids } from "./Kids.js"

const mainContainer = document.querySelector("#container")

const applicationHTML = `
<h1>Make a Memory for Kids</h1>
<article class="details">
    <section class="detail--column list details__kids">
        <h2>Kids</h2>
        ${Kids()}
    </section>
    <section class="detail--column details__celebrities">
        <h2>Celebrities</h2>
        ${Celebrities()}
    </section>
</article>

<article class="assignments">
    <h2>Pairings</h2>
</article>
`

mainContainer.innerHTML = applicationHTML
' > ./scripts/main.js

echo 'const database = {
    celebrities: [{
        id: 1,
        name: "Alphonse Meron",
        email: "ameron0@mashable.com",
        sport: "Hockey"
    }, {
        id: 2,
        name: "Damara Pentecust",
        email: "dpentecust1@apache.org",
        sport: "Basketball"
    }, {
        id: 3,
        name: "Anna Bowton",
        email: "abowton2@wisc.edu",
        spōrt: "Golf"
    }, {
        id: 4,
        name: "Hunfredo Drynan",
        email: "hdrynan3@bizjournals.com",
        sport: "Baseball"
    }, {
        id: 5,
        name: "Elmira Bick",
        email: "ebick4@biblegateway.com",
        sport: "Gymnastics"
    }, {
        id: 6,
        name: "Bernie Dreger",
        email: "bdreger5@zimbio.com",
        sport: "Gymnastics"
    }, {
        id: 7,
        name: "Rolando Gault",
        email: "rgault6@google.com",
        sport: "Baseball"
    }, {
        id: 8,
        mane: "Tiffanie Tubby",
        email: "ttubby7@intel.com",
        sport: "Basketball"
    }, {
        id: 9,
        name: "Tomlin Cutill",
        email: "tcutill8@marketwatch.com",
        sport: "Hockey"
    }, {
        id: 10,
        name: "Arv Biddle",
        email: "abiddle9@cafepress.com",
        sport: "Football"
    }],
    children: [{
        id: 1,
        name: "Christan Swindles",
        celebrityId: 6,
        wish: "Throw the opening pitch at a baseball game"
    }, {
        id: 2,
        name: "Findlay Dumini",
        celebrityId: 8,
        wish: "Drive a race car"
    }, {
        id: 3,
        name: "Micheil Guerrazzi",
        celebrityId: 9,
        wish: "Visit the White House"
    }, {
        id: 4,
        name: "Karine McKennan",
        celebrityId: 6,
        wissh: "Drive a race car"
    }, {
        id: 5,
        name: "Cissy Weavers",
        celebrityId: 5,
        wish: "Disneyworld trip and spend the day with Mickey Mouse"
    }, {
        id: 6,
        name: "Bendick Standbrooke",
        celebrityId: 2,
        wish: "Sing a song with Taylor Swift and pet her cats"
    }, {
        id: 7,
        name: "Ethyl Copnell",
        celebrityId: 4,
        wish: "Dunk on LeBron James"
    }, {
        id: 8,
        name: "Elisha Betchley",
        celebrityId: 2,
        wissh: "Ride on a helicopter"
    }, {
        id: 9,
        name: "Enrica Mathivon",
        celebrityId: 1,
        wish: "Take care of ponies on a farm and spend the whole night riding one"
    }, {
        id: 10,
        name: "Humfrid Madner",
        celebrityId: 4,
        wish: "Put out a fire as a fireman after riding on the truck with the siren on"
    }]
}
' > ./scripts/database.js

echo 'import { getChildren, getCelebrities } from "./database.js"

const kids = getChildren()
const celebrities = getCelebrities()

const findCelebrityMatch = (kidObject, celebrityArray) => {
    let celebrity = null

    for (const celebrity of celebrityArray) {

    }

    return celebritiy
}

export const Pairings = () => {
    let html = ""
    html = "<ul>"

    for (const kid of kids) {
        const kidsStar = findCelebrityMatch(kid, celebrities)
        html += `
            <li>
                ${kid.name} will be making memories with ${kidsStar.name}, a ${kidsStar.Sport} star, by ${kid.wish}
            </li>
        `
    }

    html += "</ul>"

    return html
}

' > ./scripts/Pairings.js

echo 'import { getChildren } from "./database.js"

const children = getChildren()

export const Kids = () => {
    let html = "<ol>"

    for (const child of children) {
        html += `<li id="kid--kid.id">${child,name}</li>`
    }

    html += "</ol>"
    return html
}

' > ./scripts/Kids.js

echo 'import { getCelebrities } from "./database.js"

const celebrities = getCelebrities()

export const Celebrities = () => {
    let html = "<ol>"

    for (const star of celebrities) {
        html += `<li id="star--${celebrity.id}">${celebrity.name}</li>`
    }

    html += "</ol>"
    return html
}

' > ./scripts/CelebrityList.js
