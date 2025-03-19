# Fox y Dog Project Setup

In your workspace directory, create a new project directory.

```sh
mkdir fox-y-dog
cd fox-y-dog
```

Then create your HTML file, a main CSS file, and a main JavaScript file.

```sh
touch index.html
mkdir styles
touch styles/main.css
mkdir scripts
touch scripts/main.js
```

### HTML

Copy pasta the following code into your HTML file. As you can see, there is just a header, and a main element that contains two image elements with no URL for a source yet. You will be updating those dynamically after you fetch some URLs from

```html
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Fox y Dog</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>
        <h1>Fox y Dog</h1>
        <main id="container">
            <button id="fox-button">Get Fox</button>
            <img id="fox" class="animal" src="" />
            <button id="dog-button">Get Dog</button>
            <img id="dog" class="animal" src="" />
        </main>

        <script type="module" src="./scripts/main.js"></script>
    </body>
</html>
```

### CSS

Copy pasta the following code into your CSS file for a little bit of added fun.

<details>
    <summary>Expand to get the code</summary>

```css
/* Cute Fox y dog Styles */

/* Import a playful font */
@import url("https://fonts.googleapis.com/css2?family=Fredoka+One&family=Nunito:wght@400;700&display=swap");

/* Base styles and reset */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: "Nunito", sans-serif;
  background-color: #fef6ff;
  color: #5a4364;
  text-align: center;
  padding: 2rem;
  min-height: 100vh;
  background-image: radial-gradient(#fcc2ff 1px, transparent 1px);
  background-size: 20px 20px;
}

h1 {
  font-family: "Fredoka One", cursive;
  font-size: 3.5rem;
  color: #ff6b99;
  text-shadow: 3px 3px 0px #c2e7ff;
  margin-bottom: 2rem;
  letter-spacing: 2px;
}

/* Main container styling */
#container {
  background-color: #ffffff;
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem;
  border-radius: 24px;
  box-shadow: 0 10px 25px rgba(205, 141, 255, 0.2);
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2rem;
  position: relative;
  border: 3px dashed #a5d7ff;
}

#container::before {
  content: "";
  position: absolute;
  top: -15px;
  left: 50%;
  transform: translateX(-50%);
  width: 90%;
  height: 30px;
  background-color: #ffd6e0;
  border-radius: 50%;
  z-index: -1;
}

/* Button styling */
button {
  font-family: "Fredoka One", cursive;
  font-size: 1.2rem;
  padding: 0.8rem 1.5rem;
  background-color: #a5d7ff;
  color: #5a4364;
  border: none;
  border-radius: 50px;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 5px 0 #79b8ff;
  position: relative;
  margin-bottom: 1.5rem;
}

button:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 0 #79b8ff;
  background-color: #c2e7ff;
}

button:active {
  transform: translateY(2px);
  box-shadow: 0 3px 0 #79b8ff;
}

#fox-button {
  background-color: #ffb347;
  box-shadow: 0 5px 0 #e69420;
}

#fox-button:hover {
  background-color: #ffc47e;
  box-shadow: 0 8px 0 #e69420;
}

#fox-button:active {
  box-shadow: 0 3px 0 #e69420;
}

#dog-button {
  background-color: #c2a6fc;
  box-shadow: 0 5px 0 #a788e0;
}

#dog-button:hover {
  background-color: #d4c2ff;
  box-shadow: 0 8px 0 #a788e0;
}

#dog-button:active {
  box-shadow: 0 3px 0 #a788e0;
}

/* Image styling */
.animal {
  width: 100%;
  height: 250px;
  object-fit: cover;
  border-radius: 16px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  border: 4px solid #ffffff;
  outline: 2px dashed #ffd6e0;
  outline-offset: 3px;
}

#fox {
  background-color: #ffe8d1;
}

#dog {
  background-color: #f1e8ff;
}

.animal:hover {
  transform: scale(1.03);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

/* Responsive adjustments */
@media (max-width: 768px) {
  h1 {
    font-size: 2.5rem;
  }

  #container {
    grid-template-columns: 1fr;
    padding: 1.5rem;
  }

  button {
    font-size: 1rem;
    padding: 0.7rem 1.2rem;
  }
}

/* Fun animations for when images load */
@keyframes pop {
  0% {
    transform: scale(0.8);
    opacity: 0;
  }
  70% {
    transform: scale(1.1);
  }
  100% {
    transform: scale(1);
    opacity: 1;
  }
}

.animal:not([src=""]) {
  animation: pop 0.5s ease-out;
}
```
</details>

### JS

Finally, add the following lines of code to the `main.js` file.

```js
const foxButton = document.querySelector("#fox-button")
foxButton.addEventListener("click", () => {
  
})

const dogButton = document.querySelector("#dog-button")
dogButton.addEventListener("click", () => {
  
})
```

Then run the `serve` command in your terminal and open the URL in your browser. You should see something that looks like your 12 year old niece's art project. The buttons don't work yet, that's our job for the next few chapters.

On to the next chapter to write your first `fetch()` function to get remote data from the Web.

Up Next: [First Fox Fetch](./FD_INTRO_TO_FETCH.md)