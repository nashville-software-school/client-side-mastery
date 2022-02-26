#!/bin/bash
set -u

mkdir -p $HOME/workspace/hairy-potter-project/src/scripts
mkdir -p $HOME/workspace/hairy-potter-project/src/styles
mkdir -p $HOME/workspace/hairy-potter-project/test

cd $HOME/workspace/hairy-potter-project
git init

echo '{
    "env": {
        "test": {
            "plugins": [
                "@babel/plugin-transform-modules-commonjs"
            ]
        }
    }
}' >> .babelrc

echo '.DS_Store
node_modules
.vscode
package-lock.json
dist
' >> .gitignore

echo '{
  "name": "the-hairy-potter",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "directories": {
    "test": "test"
  },
  "scripts": {
    "test": "jest --watchAll --verbose"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/nashville-software-school/the-hairy-potter.git"
  },
  "author": "",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/nashville-software-school/the-hairy-potter/issues"
  },
  "homepage": "https://github.com/nashville-software-school/the-hairy-potter#readme",
  "devDependencies": {
    "@babel/core": "^7.9.0",
    "@babel/plugin-transform-modules-commonjs": "^7.9.0",
    "babel-jest": "^25.3.0",
    "jest": "^25.3.0",
    "puppeteer": "^3.0.0"
  }
}
' > package.json

cd $HOME/workspace/hairy-potter-project/test

echo 'import { PotteryList } from "../src/scripts/PotteryList.js"
import { makePottery } from "../src/scripts/PotteryWheel.js"
import { firePottery } from "../src/scripts/Kiln.js"
import { toSellOrNotToSell } from "../src/scripts/PotteryCatalog.js"

describe("HTML representation", () => {
    let html

    beforeAll(() => {
        const mug = toSellOrNotToSell(firePottery(makePottery("Mug", 10, 8), 3000))
        const ornament = toSellOrNotToSell(firePottery(makePottery("Ornament", 2, 5), 2000))
        const platter = toSellOrNotToSell(firePottery(makePottery("Platter", 7, 2), 2000))

        html = PotteryList()
        html = html.replace(/\n/g, "")
        html = html.replace(/\s{2,}/g, "")
    })

    test("Pottery are converted to HTML correctly", () => {
        expect(html).toBe("<section class=\"pottery\" id=\"pottery--2\"><h2 class=\"pottery__shape\">Ornament</h2><div class=\"pottery__properties\">Item weighs 2 grams and is 5 cm in height</div><div class=\"pottery__price\">Price is $20</div></section><section class=\"pottery\" id=\"pottery--3\"><h2 class=\"pottery__shape\">Platter</h2><div class=\"pottery__properties\">Item weighs 7 grams and is 2 cm in height</div><div class=\"pottery__price\">Price is $40</div></section>");
    })
})
' > dom.test.js

echo 'import { makePottery } from "../src/scripts/PotteryWheel.js"

describe("Creating pottery", () => {
    const piece = makePottery("Mug", 10, 8)

    test("Pottery object is created with correct properties", () => {
        expect(piece)
            .toMatchObject(
                { shape: "Mug", weight: 10, height: 8, id: 1 }
            )
    })
})
' > pottery.create.test.js


echo 'import { makePottery } from "../src/scripts/PotteryWheel.js"
import { firePottery } from "../src/scripts/Kiln.js"
import { usePottery, toSellOrNotToSell } from "../src/scripts/PotteryCatalog.js"


describe("Sell uncracked pottery", () => {
    let piece = makePottery("Snowflake", 10, 8)
    piece = toSellOrNotToSell(firePottery(piece, 2000))
    const catalog = usePottery()

    test("Piece is priced when not cracked", () => {
        expect("price" in piece).toBe(true)
        expect(piece.price).toBe(40)
    })

    test("In array of items to sell when uncracked", () => {
        expect(catalog.find(p => p.shape === "Snowflake")).not.toBeUndefined()
    })

    test("Piece has correct price", () => {
        expect(piece.price).toBe(40.00)
    })
})

describe("Do not sell cracked pottery", () => {
    let vase = makePottery("Vase", 4, 9)
    vase = toSellOrNotToSell(firePottery(vase, 3000))
    const catalog = usePottery()

    test("Piece is not priced when cracked", () => {
        expect("price" in vase).toBe(false)
    })

    test("Not in array of items to sell when cracked", () => {
        expect(catalog.find(p => p.shape === "Vase")).toBeUndefined()
    })
})
' > pottery.pricing.test.js

echo 'import { makePottery } from "../src/scripts/PotteryWheel.js"
import { firePottery } from "../src/scripts/Kiln.js"

describe("Firing the pottery in the kiln that is too hot", () => {
    let piece = makePottery("Mug", 10, 8)
    piece = firePottery(piece, 2300)

    test("Pottery object is cracked when temperature is above 2200", () => {
        expect(piece.cracked).toBe(true)
    })

    test("Pottery marked as fired after going in the kiln", () => {
        expect(piece.fired).toBe(true)
    })
})


describe("Firing the pottery in the kiln with the correct temperate", () => {
    let piece = makePottery("Mug", 10, 8)
    piece = firePottery(piece, 1300)

    test("Pottery object is uncracked when temperature is below 2200", () => {
        expect(piece.cracked).toBe(false)
    })

    test("Pottery marked as fired after going in the kiln", () => {
        expect(piece.fired).toBe(true)
    })
})
' > pottery.firing.test.js

cd $HOME/workspace/hairy-potter-project/src

echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./styles/main.css">
</head>
<body>
    <!--- CREATE YOUR ARTICLE (SEE INSTSRUCTIONS) BELOW THIS LINE --->
    <script src="./scripts/main.js" type="module"></script>
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

echo '// Imports go first



// Make 5 pieces of pottery at the wheel
let mug = makePottery()


// Fire each piece of pottery in the kiln


// Determine which ones should be sold, and their price


// Invoke the component function that renders the HTML list


' > ./scripts/main.js
