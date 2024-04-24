#!/bin/bash
set -u

mkdir -p "$HOME/workspace/dog-walking/scripts"
mkdir -p "$HOME/workspace/dog-walking/styles"
cd "$HOME/workspace/dog-walking"

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
    display: fle;
    justify-content: space-evenly;
}

.detail--column {
    flex-basis: 24%;
    margin: 0 2rem;
    border: 1px dotted goldenrod;
}

.assignments {
    padding: 1rem 5rem;
}
' > ./styles/details.css

echo 'import { Walkers } from "./Walkers.js"
import { CityList } from "./CityList.js"
import { Assignments } from "./Assignments.js"
import { RegisteredPets } from "./RegisteredPets.js"

const mainContainer = document.querySelector("#container")

const applicationHTML = `
<h1>DeShawns Dog Walking</h1>
<article class="details">
    <section class="detail--column list details__cities">
        <h2>Cities with Service</h2>
        ${CityList()}
    </section>
    <section class="detail--column list details__cities">
        <h2>Walkers</h2>
        ${Walkers()}
    </section>
    <section class="detail--column list details__cities">
        <h2>Pets</h2>
    </section>
</article>

<article class="assignments">
    <h2>Current Assignments</h2>
    ${Assignments()}
</article>
`

mainContainer.innerHTML = applicationHTML
' > ./scripts/main.js

echo '/*

    This module contains all of the data, or state, for the
    application. It exports two functions that allow other
    modules to get copies of the state.

*/
const database = {
    walkers: [{
        id: 1,
        name: "Alphonse Meron",
        email: "ameron0@mashable.com",
        city: "Chicago"
    }, {
        id: 2,
        name: "Damara Pentecust",
        email: "dpentecust1@apache.org",
        city: "White Plains"
    }, {
        id: 3,
        name: "Anna Bowton",
        email: "abowton2@wisc.edu",
        city: "Sarasota"
    }, {
        id: 4,
        name: "Hunfredo Drynan",
        email: "hdrynan3@bizjournals.com",
        city: "San Diego"
    }, {
        id: 5,
        name: "Elmira Bick",
        email: "ebick4@biblegateway.com",
        city: "Boise"
    }, {
        id: 6,
        name: "Bernie Dreger",
        email: "bdreger5@zimbio.com",
        city: "Denver"
    }, {
        id: 7,
        name: "Rolando Gault",
        email: "rgault6@google.com",
        city: "Tucson"
    }, {
        id: 8,
        name: "Tiffanie Tubby",
        email: "ttubby7@intel.com",
        city: "Phoenix"
    }, {
        id: 9,
        name: "Tomlin Cutill",
        email: "tcutill8@marketwatch.com",
        city: "Minneapolis"
    }, {
        id: 10,
        name: "Arv Biddle",
        email: "abiddle9@cafepress.com",
        city: "Pittsburgh"
    }],
    pets: [{
        id: 1,
        name: "Dianemarie Hartness",
        walkerId: 3
    }, {
        id: 2,
        name: "Christoph Fosdyke",
        walkerId: 10
    }, {
        id: 3,
        name: "Rocket",
        walkerId: 7
    }, {
        id: 4,
        name: "Ebony",
        walkerId: 3
    }, {
        id: 5,
        name: "Scotty",
        walkerId: 8
    }, {
        id: 6,
        name: "Mac",
        walkerId: 2
    }, {
        id: 7,
        name: "Oreo",
        walkerId: 5
    }, {
        id: 8,
        name: "Sassy",
        walkerId: 1
    }, {
        id: 9,
        name: "Salem",
        walkerId: 9
    }, {
        id: 10,
        name: "Panda",
        walkerId: 7
    }]
}

export const getWalkers = () => {
    return database.walkers.map(walker => ({...walker}))
}

export const getPets = () => {
    return database.pets.map(pet => ({...pet}))
}
' > ./scripts/database.js

echo 'import { getPets } from "./database.js"

const pets = getPets()

export const RegisteredPets = () => {
    let petHTML = "<ul>"

    for (const pet of pets) {
        petHTML += `<li>${pet.name}</li>`
    }

    petHTML += "</ul>"

    return petHTML
}
' > ./scripts/RegisteredPets.js

echo 'import { getWalker } from "./database.js"

const walkers = getWalkers()


export const Walkers = () => {
    let walkerHTML = "<ul>"

    for (const walker of walkers) {
        walkerHTML += `<li>${walker.fullName}</li>`
    }

    walkerHTML += "</ul>"

}
' > ./scripts/Walkers.js

echo 'import { getWalkers } from "./database.js"

const walkers = getWalker()


export const CityList = () => {
    let citiesHTML = "<ol>"

    for (const walker of walkers) {
        citiesHTML += `<li>${currentWalker.city}</li>`
    }

    citiesHTML += "</ol>"

    return citiesHTML
}
' > ./scripts/CityList.js

echo 'import { getPets, getWalkers } from "./database.js"

// Get copy of state for use in this module
const pets = getPets()
const walkers = getWalkers()


// Function whose responsibility is to find the walker assigned to a pet
const findWalker = (pet, allWalker) => {
    let petWalker = null

    for (const walker of allWalkers) {
        if (walker.id === pet.walkerId) {
            petWalker = walker
        }
    }

    return petWalker
}

export const Assignments = () => {
    let assignmentHTML = ""
    assignmentHTML = "<ul>"

    for (const currentPet of pets) {
        const currentPetWalker = findPetWalker(currentPet, walkers)
        assignmentHTML = `
            <li>
                ${currentPet.name} is being walked by
                ${currentPetWalker.name} in ${currentPetWalker.city}
            </li>
        `
    }

    assignmentHTML += "</ul>"

    return assignmentHTML
}
' > ./scripts/Assignments.js

