#!/bin/bash
set -u

WORKSPACE="$HOME/workspace"
mkdir -p "$WORKSPACE/flowers"
cd "$WORKSPACE/flowers"


echo 'const flowers = [

]

const addFlower = (flowerObject) => {
    /*
        This function should add an `id` property
        to the object that was sent to the function.
        The value of the `id` property should be 1
        greater than the current maximum `id` in the
        array.

        Once the `id` property has been added to the,
        object, the object should then be put into the
        `flowers` array.
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
    color: "Orange",
    species: "Tulip",
    price: 0.95
})

addFlower({
    color: "White",
    species: "Baby Breath",
    price: 0.40
})

addFlower({
    color: "Blue",
    species: "Orchid",
    price: 1.05
})

const expensiveFlowers = findExpensiveFlowers()

console.log(`







Test: Three new flowers added to array.
Price #1 is 0.95
Price #2 is 0.40
Price #3 is 1.05
`)

if (expensiveFlowers.length !== 2) {
    console.log(`
*************************
****   TEST FAILED   ****
*************************

The test code expected that two flowers should be
in the expensiveFlowers array, but instead saw ${expensiveFlowers.length}.

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

