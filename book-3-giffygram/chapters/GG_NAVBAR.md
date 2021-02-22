# Navigation Bar Component


## Learning Objectives

* You should be able to demonstrate how to import a function from one module to another.
* You should be able to explain what data type a function returns.
* You should be able to identify where a string is injected
* You should be able to
* You should be able to
* You should be able to

## Setup

1. Be in the `giffygram/src` directory and run these commands
    ```sh
    mkdir nav
    touch NavBar.js
    ```

1. Right-click the image below and save it in the `nav` directory.

    <img src="./images/pb.png" height="100px">

1. Right-click the image below and save it in the `nav` directory.

    <img src="./images/fountain-pen.svg" height="100px">

1. Copy and paste the following code into the `NavBar.js` file.
    ```js
    export const NavBar = () => {
        return `
            <nav class="navigation">
                <div class="navigation__item navigation__icon">
                    <img src="./pb.png" alt="Giffygram icon" />
                </div>
                <div class="navigation__item navigation__name">
                    Giffygram
                </div>
                <div class="navigation__item navigation__search">
                    <input type="text" id="postSearch" placeholder="Search posts..." />
                </div>
                <div class="navigation__item navigation__message">
                    <img id="directMessageIcon" src="./fountain-pen.svg" alt="Direct message" />
                </div>
                <div class="navigation__item navigation__logout">
                    <button id="logout" class="fakeLink">Logout</button>
                </div>
            </nav>
        `
    }
    ```
## Including a Component in Another One

1. Open the `GiffyGram.js` file
1. Import the `NavBar.js` file
1. Change the following line of code...
    ```js
    let giffyGramHTML = ""
    ```
    with this string interpolation code
    ```js
    let giffyGramHTML = NavBar()
    ```
1. Refresh your browser.

You just imported a function from another module, invoked it, and interpolated its return value into a string.

The more explicit version of the code would look like this.

```js
const navBarHTML = NavBar()
let htmlStringOfAllPosts = navBarHTML
```

## You Can Try...

You'll be shown how to do it in a future chapter, but see if you can make a footer component for your application.

Write a function in a `nav/Footer.js` file. That function should return a string filled with HTML elements. For now, just display your name and the current year in it.

Import that function into the **`Giffygram`** module and append its return value to the `giffyGramHTML` variable before it is returned.

Look in the `styles/footer.css` file to see a style that you can apply to your footer element.
