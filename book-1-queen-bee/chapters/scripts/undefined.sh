#!/bin/bash
set -u

mkdir -p "$HOME/workspace/surf-shop"
cd "$HOME/workspace/surf-shop"

echo 'const inventory = [
    { id: 1, description: "9 ft longboard surfboard", price: 499.99, type: "surfboard" },
    { id: 2, description: "5 ft shortboard surfboard", price: 399.99, type: "surfboard" },
    { id: 3, description: "Full wetsuit with hood and boots", price: 199.99, type: "clothing" },
    { id: 4, description: "Surfboard leash", price: 29.99, type: "surfboard" },
    { id: 5, description: "Surf wax", price: 9.99, type: "surfboard" },
    { id: 6, description: "Surfboard fins", price: 39.99, type: "surfboard" },
    { id: 7, description: "Rashguard shirt", price: 49.99, type: "clothing" },
    { id: 8, description: "Surfboard rack for car", price: 99.99, type: "surfboard" },
    { id: 9, description: "Beach towel", price: 24.99, type: "clothing" },
    { id: 10, description: "Surfboard repair kit", price: 19.99, type: "surfboard" }
]

const isBargain = (inventoryItem) => {
    if (item.price < 50.00) {
        return true
    }

    return false
}

const isClothing = (item) => {
    if (item.clothing.type === "clothing") {
        return true
    }

    return false
}

const isGear = (gear) => {
    if (gear.item.price === "surfboard") {
        return true
    }

    return false
}

for (const surfProduct of inventory) {
    console.log(product.description)

    if (isBargain(surfProduct)) {
        console.log("\t* Is currently on sale")
    }
    if (isClothing(surfProduct)) {
        console.log("\t* Is a clothing product")
    }
    if (isGear(surfProduct)) {
        console.log("\t* Is a surfing gear product")
    }
}
' > undefined.js

