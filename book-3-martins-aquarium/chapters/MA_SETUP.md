# Setting Up the Project

In this chapter, we will set up the project structure and create the necessary files for Martin's Aquarium.

## Step 1: Create Project Directory and Files

Create a new directory for the project and navigate into it to create the HTML file.

```bash
cd ~/workspace
mkdir martins-aquarium
cd martins-aquarium
touch index.html
```

Create the JavaScript modules

```bash
mkdir scripts
touch scripts/main.js scripts/aquariumData.js scripts/fishList.js scripts/tipList.js scripts/locationList.js
```

```bash
mkdir styles
touch styles/main.css
touch styles/layout.css
```

```bash

```

Create the following files and directories inside the project directory:

- `index.html`: The main HTML file for the aquarium showcase.
- `styles`: Directory to store CSS files.
  - `main.css`: The main CSS file for styling the aquarium showcase.
- `scripts`: Directory to store JavaScript files.
  - `main.js`: The main JavaScript file for handling the aquarium functionality.
  - `fishData.js`: File to store the fish data.
  - `fishList.js`: File to handle the rendering of the fish list.
  - `tipList.js`: File to handle the rendering of the care tips.
  - `locationList.js`: File to handle the rendering of the location list.

## Step 2: Set Up HTML Structure

Open the `index.html` file and add the following basic HTML structure:

```html
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Martin's Aquarium</title>
   <link rel="stylesheet" href="./styles/main.css">
   <link rel="stylesheet" href="./styles/layout.css">
</head>
<body>
   <header>
       <h1>Martin's Aquarium</h1>
   </header>

   <main>
       <section id="fishList">
           <!-- Fish grid will be dynamically generated here -->
       </section>

       <aside id="tipList">
           <!-- Care tips will be dynamically generated here -->
       </aside>

       <section id="locationList">
           <!-- Location grid will be dynamically generated here -->
       </section>
   </main>

   <script type="module" src="./scripts/main.js"></script>
</body>
</html>
```

This HTML structure sets up the basic layout for Martin's Aquarium. We have a `<header>` to display the title, a `<main>` section that contains the `fishList`, `tipList`, and `locationList` sections where the respective content will be dynamically generated.

We link the necessary CSS file (`main.css`) and the main JavaScript file (`main.js`) at the end of the `<body>` section.

## Step 3: Set Up Main JavaScript Module

Open the `main.js` file in the `scripts` directory and add the following code:

```javascript
import { fishList } from './fishList.js'
import { tipList } from './tipList.js'
import { locationList } from './locationList.js'

// Generate the fish list
const fishHTML = fishList()

// Generate the care tips
const tipHTML = tipList()

// Generate the location list
const locationHTML = locationList()

// Render each HTML string to the correct DOM element
```

In this `main.js` file, we import the necessary modules (`fishList`, `tipList`, and `locationList`) that will handle the rendering of the respective sections.

We then call the imported functions to render the fish list, care tips, and location list in the appropriate order.

## Step 4: Test the Setup

Open the `index.html` file in a web browser to ensure that the basic structure is displayed correctly. You should see the title "Martin's Aquarium" in the header.

At this point, the aquarium showcase page is still empty, but we have set up the necessary files and structure to build upon in the upcoming chapters.

In the next chapter, we will focus on creating the fish data and rendering the fish list in the aquarium showcase.

Next chapter: [Database >](./MA_DATABASE.md)
