#!/bin/bash
set -u

mkdir -p $HOME/workspace/flowers
cd $HOME/workspace/flowers


echo '
// Manually add two objects to the array below.

const flowers = [

]

const addFlower = (flowerObject) => {
    /*
        Write the correct code below to add the value of
        `flowerObject` to the `flowers` array.
    */


}


const findExpensiveFlowers = () => {
    const expensiveFlowers = []  // Do not change this code


    /*
        Write a for..of loop that iterate the array
        of flowers, and if the price of a flower is
        greater than or equal to 1.00, it should be
        added to the `expensiveFlowers` array.
    */




    return expensiveFlowers  // Do not change this code
}




// Do not touch this code
module.exports = {
    findExpensiveFlowers, addFlower
}
' > flowers.js

echo 'const { addFlower, findExpensiveFlowers } = require("./flowers.js")

addFlower({
    id: 3,
    color: "Orange",
    species: "Tulip",
    price: 0.95
})

addFlower({
    id: 4,
    color: "White",
    species: "Baby Breath",
    price: 0.40
})

addFlower({
    id: 5,
    color: "Blue",
    species: "Orchid",
    price: 1.05
})

const expensiveFlowers = findExpensiveFlowers()

console.log(`







Automated Test: Adding three new flowers added to your array.
Price #1 is 0.95
Price #2 is 0.40
Price #3 is 1.05


Automated Test: Verifying that there are only two expensive flowers.
`)

console.log(flowers)

if (expensiveFlowers.length !== 2 || Array.isArray(expensiveFlowers[0])) {
    console.log(`
*************************
****   TEST FAILED   ****
*************************

The test code expected that two flowers should be
in the expensiveFlowers array, and that each item
in the array is an object.

Make sure that you have an \`if\` condition that
is checking the price property of each flower, and
that only flowers whose price is >= 1.00 are being
added.
`)
} else {
    console.log(`
****************************
****   TEST SUCCEEDED   ****
****************************

Congratulations on writing valid code for your first
self-assessment project.
`)
}

console.log(expensiveFlowers)

' > test.js

