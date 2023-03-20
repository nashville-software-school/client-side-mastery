# Fish Fusion Project Setup

Run the following commands to create the directory structure and files for the project.

```sh
cd ~/workspace
mkdir fish-fusion
cd fish-fusion
touch main.js fishingBoat.js fishMonger.js restaurant.js
```

Then open the project directory in Visual Studio Code.

## Main Module

Add the following code to `main.js`

```js
const { fishMenu } = require("./restaurant.js")

/* Uncomment this code block when you're ready to test your logic

const menu = fishMenu()
console.log(menu)

*/
```