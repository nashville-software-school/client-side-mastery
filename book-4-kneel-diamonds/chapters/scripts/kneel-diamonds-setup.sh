#!/bin/bash
set -u

mkdir -p $HOME/workspace/kneel-diamonds/scripts
mkdir -p $HOME/workspace/kneel-diamonds/styles
cd $HOME/workspace/kneel-diamonds

echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Kneel Diamonds</title>
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

echo 'import { DiamondSizes } from "./DiamondSizes.js"
import { MetalTypes } from "./MetalTypes.js"
import { JewelryStyles } from "./JewelryStyles.js"
import { CustomOrders } from "./CustomOrders.js"

const mainContainer = document.querySelector("#container")

const applicationHTML = `
<h1>Kneel Diamonds</h1>

<article class="customOrders">
    <h2>Custom Jewelry Orders</h2>
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
    styles: [
        { style: "Classic", price: 500 },
        { style: "Modern", price: 710 },
        { style: "Vintage", price: 965 }
    ],
    sizes: [
        { carets: 0.5, price: 405 },
        { carets: 0.75, price: 782 },
        { carets: 1, price: 1470 },
        { carets: 1.5, price: 1997 },
        { carets: 2, price: 3638 }
    ],
    metals: [
        { metal: "Sterling Silver", price: 12.42 },
        { metal: "14K Gold", price: 736.4 },
        { metal: "24K Gold", price: 1258.9 },
        { metal: "Platinum", price: 795.45 },
        { metal: "Palladium", price: 1241.0 }
    ]
}

export const getMetals = () => {
    return [...database.metals]
}

export const getSizes = () => {
    return [...database.sizes]
}

export const getStyles = () => {
    return [...database.styles]
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

