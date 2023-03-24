#!/bin/bash
set -u

mkdir -p "$HOME/workspace/fish-fusion/test"
cd "$HOME/workspace/fish-fusion"
touch fishingBoat.js fishMonger.js restaurant.js

echo 'const { fishMenu } = require("./restaurant.js")


const dailyPriceLimit = 3.99
const menu = fishMenu(dailyPriceLimit)
console.log(menu)
' > main.js

echo '{
    "env": {
        "test": {
            "plugins": [
                "@babel/plugin-transform-modules-commonjs"
            ]
        }
    }
}' > .babelrc

echo '{
  "name": "fish-fusion",
  "version": "1.0.0",
  "description": "",
  "main": "main.js",
  "directories": {
    "test": "test"
  },
  "scripts": {
    "test": "jest --watchAll --verbose"
  },
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "@babel/core": "^7.9.0",
    "@babel/plugin-transform-modules-commonjs": "^7.9.0",
    "babel-jest": "^25.3.0",
    "jest": "^25.3.0"
  },
  "dependencies": {}
}' > package.json

echo 'import { boatInventory } from "../fishingBoat.js";

describe("Fishing boat", () => {
    test("Can view all inventory", () => {
        expect(boatInventory())
            .toMatchObject([
                { id: 1, species: "Halibut", weight: 6, price: 3.55, amount: 30 },
                { id: 2, species: "Mackerel", weight: 3, price: 4.10, amount: 48 },
                { id: 3, species: "Salmon", weight: 5, price: 3.05, amount: 25 },
                { id: 4, species: "Walleye", weight: 2, price: 9.45, amount: 19 },
                { id: 5, species: "Sunfish", weight: 25, price: 5.18, amount: 1 },
                { id: 6, species: "Orange Roughy", weight: 4, price: 6.95, amount: 37 },
                { id: 7, species: "Tuna", weight: 18, price: 8.66, amount: 5 },
                { id: 8, species: "Puffer", weight: 2, price: 9.84, amount: 52 }
            ])
    })
})' > ./test/boat.test.js

echo 'import { mongerInventory } from "../fishMonger.js";

describe("Fishmonger", () => {
    test("Can view all inventory", () => {
        expect(mongerInventory(10.00))
            .toMatchObject([
                { id: 1, species: "Halibut", weight: 6, price: 3.55, amount: 5 },
                { id: 2, species: "Mackerel", weight: 3, price: 4.1, amount: 5 },
                { id: 3, species: "Salmon", weight: 5, price: 3.05, amount: 5 },
                { id: 6, species: "Orange Roughy", weight: 4, price: 6.95, amount: 5 }
            ])
    })

    test("Can view inventory that cost less than $6 per fish", () => {
        expect(mongerInventory(6))
            .toMatchObject([
                { id: 1, species: "Halibut", weight: 6, price: 3.55, amount: 5 },
                { id: 2, species: "Mackerel", weight: 3, price: 4.1, amount: 5 },
                { id: 3, species: "Salmon", weight: 5, price: 3.05, amount: 5 }
            ])
    })

    test("Can view inventory that cost less than $4 per fish", () => {
        expect(mongerInventory(4))
            .toMatchObject([
                { id: 1, species: "Halibut", weight: 6, price: 3.55, amount: 5 },
                { id: 3, species: "Salmon", weight: 5, price: 3.05, amount: 5 }
            ])
    })

})' > ./test/monger.test.js

echo 'import { fishMenu } from "../restaurant.js";

describe("Restaurant", () => {

    test("Producing the menu", () => {
        expect(fishMenu(3.49).length)
            .toBe(`<h1>Menu</h1>
<article class="menu">
<h2>Salmon</h2>
    <section class="menu__item">Salmon Soup</section>
    <section class="menu__item">Salmon Sandwich</section>
    <section class="menu__item">Grilled Salmon</section>
</article>`.length)
    })

})' > ./test/restaurant.test.js