#!/bin/bash
set -u

mkdir -p $HOME/workspace/flowers
cd $HOME/workspace/flowers


echo '
const flowers = [
    {
        id: 1,
        type: "Rose",
        colors: ["White", "Red", "Violet", "Pink", "Black", "Yellow"],
        price: 2.59,
        usdaZones: [3, 4, 5, 6, 7, 8, 9, 10]
    },
    {
        id: 2,
        type: "Tulip",
        colors: ["Orange", "White", "Yellow", "Violet", "Red"],
        price: 1.04,
        usdaZones: [5, 6, 7, 8, 9]
    },
    {
        id: 3,
        type: "Daisy",
        colors: ["Gold", "White", "Orange", "Crimson"],
        price: 0.89,
        usdaZones: [3, 4, 5, 6, 7, 8]
    },
    {
        id: 4,
        type: "Carnation",
        colors: ["Peach", "Yellow", "Magenta", "Pink", "Coral"],
        price: 1.59,
        usdaZones: [5, 6, 7, 8, 9]
    },
    {
        id: 5,
        type: "Bird of Paradise",
        colors: ["Orange", "White"],
        price: 2.33,
        usdaZones: [9, 10, 11]
    },
    {
        id: 6,
        type: "Delphinium",
        colors: ["Blue", "Violet", "White", "Pink"],
        price: 1.67,
        usdaZones: [3, 4, 5, 6, 7]
    },
    {
        id: 7,
        type: "Gladiolus",
        colors: ["White", "Cream", "Yellow", "Red", "Pink", "Green", "Lavender", "Voilet"],
        price: 1.85,
        usdaZones: [6, 7, 8, 9, 10]
    },
    {
        id: 8,
        type: "Lilly",
        colors: ["White", "Yellow", "Orange", "Red", "Pink", "Lavender"],
        price: 1.52,
        usdaZones: [3, 4, 5, 6, 7, 8, 9]
    },
    {
        id: 9,
        type: "Chinese Lantern",
        colors: ["Orange"],
        price: 2.33,
        usdaZones: [3, 4, 5, 6, 7, 8, 9]
    }
]

/*
    Below are some functions, in which you will write ALL of your
    code. Do not modify the code that defines the functions, and
    do not write any code outside of the functions.
*/


/*
    This function should return inexpensive flowers - ones that cost
    less than 2.00 per flower.
*/
const inexpensiveFlowers = () => {
    const filteredFlowers = []  // Do not modify


    // Write your algorithm first, and then your code. Feel free to remove this comment



    return filteredFlowers  // Do not modify

}

/*
    This function should return flowers that grow in
    USDA zones of 3 and 8.
*/
const zoneFlowers = () => {
    const filteredFlowers = []  // Do not modify


    // Write your algorithm first, and then your code. Feel free to remove this comment




    return filteredFlowers  // Do not modify
}



/*
    This function should return flowers that come in the color Orange
*/
const orangeFlowers = () => {
    const filteredFlowers = []  // Do not modify



    // Write your algorithm first, and then your code. Feel free to remove this comment




    return filteredFlowers  // Do not modify
}



/*
    This function should return an HTML representation of each flower.

    Expected string format:
        <article>
            <h1>Bird of Paradise</h1>

            <h2>Colors</h2>
            <section>White</section>
            <section>Orange</section>

            <h2>USDA Zones</h2>
            <div>9</div>
            <div>10</div>
            <div>11</div>
        </article>
*/
const flowersAsHTML = () => {
    let flowersHTMLString = ""  // Do not modify


    /*
        Algorithmic thinking is most important on this one.
        We would rather see the correct algorithm than the
        correct code. If you have code that works, but no
        algorithm, then you failed the exercise.
    */


    return flowersHTMLString  // Do not modify
}















































































/*  DO NOT TOUCH THIS CODE  */
const getFlowers = () => flowers
module.exports = {
    inexpensiveFlowers, orangeFlowers, zoneFlowers, flowersAsHTML
}
/*  DO NOT TOUCH THIS CODE  */
' > main.js

echo 'console.clear()

const { getFlowers, inexpensiveFlowers, orangeFlowers, zoneFlowers, flowersAsHTML } = require("./main.js")


const cheap = inexpensiveFlowers()
let success = true

if (!Array.isArray(cheap)) {
    console.log(`\x1b[91m
*************************
****   TEST FAILED   ****
*************************`)
console.log(`\x1b[93m
The inexpensiveFlowers function did not return an array.
Did you modify code that you should not have?
`)

    success = false
}




if (success && cheap.length !== 6) {
    console.log(`\x1b[91m
*************************
****   TEST FAILED   ****
*************************`)
console.log(`\x1b[93m
The test code expected that 6 flowers should be
be the array of inexpensive flowers.

There were ${cheap.length} items in the array.

Make sure that you have an \`if\` condition that
is checking the price property of each flower, and
that only flowers whose price is < 2.00 are being
added.
`)

    success = false
}

if (success && cheap.length > 0 && Object.prototype.toString.call(cheap[0]) !== "[object Object]") {
    console.log(`\x1b[91m
*************************
****   TEST FAILED   ****
*************************`)
console.log(`\x1b[93m
The test code expected that the array of inexpensive
flowers should contain objects and not another data
type like strings or numbers.

Make sure that you are using the .push() method to
add the entire flower object to the array, and not
a specific property of the flower.
`)

    success = false
}



const zones = zoneFlowers()

if (success && zones.length !== 4) {
    console.log(`\x1b[91m
*************************
****   TEST FAILED   ****
*************************`)
console.log(`\x1b[93m
The test code expected that 4 flowers should be
be the array of flowers zoned to 3 and 8.

There were ${zones.length} items in the array.
`)

    success = false
}

if (success && zones.length > 0 && Object.prototype.toString.call(zones[0]) !== "[object Object]") {
    console.log(`\x1b[91m
*************************
****   TEST FAILED   ****
*************************`)
console.log(`\x1b[93m
The test code expected that the array of zoned
flowers should contain objects and not another data
type like strings or numbers.

Make sure that you are using the .push() method to
add the entire flower object to the array, and not
a specific property of the flower.
`)

    success = false
}



const orange = orangeFlowers()


if (success && orange.length !== 5) {
    console.log(`\x1b[91m
*************************
****   TEST FAILED   ****
*************************`)
console.log(`\x1b[93m
The test code expected that 5 flowers should be
be the array of orange flowers.

There were ${orange.length} items in the array.

Make sure that you have an \`if\` condition that
is checking if the colors property array includes
the string of "Orange".
`)

    success = false
}

if (success && orange.length > 0 && Object.prototype.toString.call(orange[0]) !== "[object Object]") {
    console.log(`\x1b[91m
*************************
****   TEST FAILED   ****
*************************`)
console.log(`\x1b[93m
The test code expected that the array of orange
flowers should contain objects and not another data
type like strings or numbers.

Your array contains the following values:
[${orange}]

Make sure that you are using the .push() method to
add the entire flower object to the array, and not
a specific property of the flower.
`)

    success = false
}


const htmlRepresentations = flowersAsHTML()

if (success) {
    const htmlContainsArticleTags = htmlRepresentations.match(/article/g)?.length / 2 || 0
    const htmlContainsSectionTags = htmlRepresentations.match(/section/g)?.length / 2 || 0
    const htmlContainsDivTags = htmlRepresentations.match(/div/g)?.length / 2 || 0

    if (htmlContainsArticleTags !== 9 || htmlContainsSectionTags !== 41 || htmlContainsDivTags !== 51) {
        console.log(`\x1b[91m
*************************
****   TEST FAILED   ****
*************************`)
        console.log(`\x1b[93m
The test code expected that 9 <article> elements should be
in the HTML representation.

There were ${htmlContainsArticleTags} articles in the string.

-----------------------------------------------------------

The test code expected that 41 <section> elements should be
in the HTML representation.

There were ${htmlContainsSectionTags} sections in the string.

-----------------------------------------------------------
The test code expected that 51 <div> elements should be
in the HTML representation.

There were ${htmlContainsDivTags} divs in the string.
`)

        success = false
    }
}



if (success) {
    console.log(`\x1b[92m
*********************************
****   ALL TESTS SUCCEEDED   ****
*********************************

Congratulations on writing valid code for your first
self-assessment project.
`)

}

' > test.js

