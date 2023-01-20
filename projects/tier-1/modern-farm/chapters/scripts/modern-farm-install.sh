#!/bin/bash
set -u

mkdir -p "$HOME/workspace/modern-farm/src/scripts/seeds"
mkdir -p "$HOME/workspace/modern-farm/src/styles"
mkdir -p "$HOME/workspace/modern-farm/test"

cd "$HOME/workspace/modern-farm"
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
__pycache__
*.pyc
bin
obj
*.db
*.sqlite3
.vscode
dist
' >> .gitignore

echo '{
  "name": "modern-farm",
  "version": "1.0.0",
  "description": "## Setup",
  "main": "index.js",
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
}
' > package.json

cd "$HOME/workspace/modern-farm/test"

echo 'import { createPlan } from "../src/scripts/plan.js"
import { plantSeeds } from "../src/scripts/tractor.js";
import { usePlants } from "../src/scripts/field.js";
import { createCorn } from "../src/scripts/seeds/corn.js";
import { createPotato } from "../src/scripts/seeds/potato.js";
import { createWheat } from "../src/scripts/seeds/wheat.js";
import { createSunflower } from "../src/scripts/seeds/sunflower.js";
import { createSoybean } from "../src/scripts/seeds/soybean.js";
import { createAsparagus } from "../src/scripts/seeds/asparagus.js";
import { harvestPlants } from "../src/scripts/harvester.js";

const plan = [
    ["Corn", "Potato"],
    ["Asparagus", "Soybean"],
    ["Sunflower", "Wheat"],
]

let plantedSeeds

beforeAll(() => {
    plantSeeds(plan)
    plantedSeeds = usePlants()
})

describe("Seed objects have correct properties", () => {

    test("Corn has correct properties", () => {
        expect(createCorn())
            .toMatchObject([
                { type: "Corn", height: 180, output: 6 },
                { type: "Corn", height: 180, output: 6 }
            ])
    })

    test("Potato has correct properties", () => {
        expect(createPotato())
            .toMatchObject({ type: "Potato", height: 32, output: 2 })
    })

    test("Asparagus has correct properties", () => {
        expect(createAsparagus())
            .toMatchObject({ type: "Asparagus", height: 24, output: 4 })
    })

    test("Soybean has correct properties", () => {
        expect(createSoybean())
            .toMatchObject({ type: "Soybean", height: 20, output: 4 })
    })

    test("Sunflower has correct properties", () => {
        expect(createSunflower())
            .toMatchObject({ type: "Sunflower", height: 380, output: 3 })
    })

    test("Wheat has correct properties", () => {
        expect(createWheat())
            .toMatchObject({ type: "Wheat", height: 230, output: 6 })
    })

})

describe("Sowing the fields with seeds", () => {
    test("Correct type and number of seeds sown", () => {
        expect(plantedSeeds)
            .toMatchObject(
                [
                    { type: "Corn", height: 180, output: 6 },
                    { type: "Corn", height: 180, output: 6 },
                    { type: "Potato", height: 32, output: 2 },
                    { type: "Asparagus", height: 24, output: 4 },
                    { type: "Soybean", height: 20, output: 4 },
                    { type: "Sunflower", height: 380, output: 3 },
                    { type: "Wheat", height: 230, output: 6 }
                ]
            )
    })
})

describe("Harvesting the grown plants", () => {
    let harvestedPlants

    beforeAll(() => {
        harvestedPlants = harvestPlants(plantedSeeds)
    })

    test("Harvested correct total number of plants", () => {
        expect(harvestedPlants.length).toEqual(25)
    })

    test("Harvested correct number of asparagus plants", () => {
        expect(
            harvestedPlants.filter(p => p.type === "Asparagus").length
        )
            .toEqual(4)
    })

    test("Harvested correct number of corn plants", () => {
        expect(
            harvestedPlants.filter(p => p.type === "Corn").length
        )
            .toEqual(6)
    })

    test("Harvested correct number of potato plants", () => {
        expect(
            harvestedPlants.filter(p => p.type === "Potato").length
        )
            .toEqual(2)
    })

    test("Harvested correct number of soybean plants", () => {
        expect(
            harvestedPlants.filter(p => p.type === "Soybean").length
        )
            .toEqual(4)
    })

    test("Harvested correct number of sunflower plants", () => {
        expect(
            harvestedPlants.filter(p => p.type === "Sunflower").length
        )
            .toEqual(3)
    })

    test("Harvested correct number of wheat plants", () => {
        expect(
            harvestedPlants.filter(p => p.type === "Wheat").length
        )
            .toEqual(6)
    })
})
' > farm.test.js

cd "$HOME/workspace/modern-farm/src"

echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Nashville Software School</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>
        <main class="container">
            <div class="messages"></div>
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

.blue {
    background-color: aliceblue;
}

.green {
    background-color: darkseagreen;
}

.purple {
    background-color: mediumorchid;
}

.red {
    background-color: darksalmon;
}
' > ./styles/main.css

echo 'console.log("Welcome to the main module")
' > ./scripts/main.js

echo 'const types = ["Soybean", "Corn", "Asparagus", "Wheat", "Potato", "Sunflower"]

export const createPlan = () => {
    const plan = []

    for (let index = 0; index < 3; index++) {
        const row = []
        for (let j = 0; j < 6; j++) {
            row.push(crop.next().value)
        }
        plan.push(row)
    }

    return plan
}




/*
    This is a generator function used to randomly
    generate crop types to plants in each plot. It
    is not relevant for you implementing your code
    for this project.
*/
const crop = function* () {
    while (true) {
        const typeIdx = Math.floor(Math.random() * types.length)
        yield types[typeIdx]
    }
}()
' > ./scripts/plan.js

