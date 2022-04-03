# Fish Fusion

In this project, you are going to build a purchasing pipeline for a bargain fish restaurant in your city.

There are 3 different actors in this system, and you will write functions in multiple modules of code to have them share data, and in the end, the restaurant will make its final purchases.

1. **Fishing Boat** - This is the source of the fish. The boat catches the fish and makes the fresh catch available to purchasers.
1. **Fishmonger** - The fishmonger purchases fresh fish off the boat, and head chefs around the city visit every morning to get fish for their daily menus.
1. **Fish Restaurant** - The chef at fish restaurant purchases fresh fish from the fishmonger every day. To keep her prices low, she purchases lower cost food and combines them in tasty ways that people might not expect.

## Project Setup

Run the following commands to create the directory structure and files for the project.

```sh
cd ~/workspace
mkdir fish-fusion
cd fish-fusion
touch main.js fishingBoat.js fishMonger.js restaurant.js
```

Then initialize your Git repository and make your first commit.

```sh
git init
git add main.js fishingBoat.js fishMonger.js restaurant.js
git commit -m "Initial commit"
```

Then open the project directory in Visual Studio Code.

## Main Module

Add the following code to `main.js`

```js
import { fishMenu } from "./restaurant.js"

const menu = fishMenu()

console.log(menu)
```