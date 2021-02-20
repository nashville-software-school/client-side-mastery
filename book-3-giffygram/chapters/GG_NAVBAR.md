# Navigation Bar Component


## Learning Objectives


## Setup

1. Be in the `giffygram/src` directory and run these commands
    ```sh
    mkdir nav
    touch NavBar.js
    ```

1. Right-click the image below and save it in the `nav` directory.
    ![](./images/pb.png)
1. Copy and paste the following code into the `NavBar.js` file.
    ```js
    export const NavBar = () => {
        return `
            <nav class="navigation">
                <div class="navigation__item navigation__icon">
                    <img src="./images/pb.png" alt="Giffygram icon" />
                </div>
                <div class="navigation__item navigation__name">
                    Giffygram
                </div>
                <div class="navigation__item navigation__message">
                    <img id="directMessageIcon" src="/images/fountain-pen.svg" alt="Direct message" />
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
    let htmlStringOfAllPosts = ""
    ```
    with this
    ```js
    let htmlStringOfAllPosts = `${NavBar()}`
    ```
1. Refresh your browser.


You just imported a function from another module, invoked it, and interpolated its return value into a string.


## You Can Try...

You'll be shown how to do it in a future chapter, but see if you can make a footer component for your application in a `nav/Footer.js` file. For now, just display your name and the current year in it.

Use the following CSS to make sure the component shows up at the bottom of the screen.

```css
.footer {
    display: flex;
    flex-wrap: nowrap;
    justify-content: start;
    border-bottom: 1px solid lightblue;
    padding: 0.5em 0 0.5em 1em;
    margin-bottom: 2em;
    position: fixed;
    z-index: 11;
    bottom: 0;
    width: 100%;
    background-color: whitesmoke;
    margin: auto;
}
```
