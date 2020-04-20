#!/bin/bash
set -u

mkdir -p $HOME/workspace/modern-farm/scripts/seeds
mkdir -p $HOME/workspace/modern-farm/styles
cd $HOME/workspace/modern-farm

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
' >> index.html

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
' >> ./styles/main.css

echo 'console.log("Welcome to the main module")
' >> ./scripts/main.js

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
' >> ./scripts/plan.js

