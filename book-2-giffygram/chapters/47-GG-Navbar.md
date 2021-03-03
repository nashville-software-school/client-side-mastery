# Navigation Bar Component


## Learning Objectives
You should be able to:
* demonstrate how to import a function from one module to another
* explain what data type a function returns
* identify where a string is injected


## Setup

1. Be in the `giffygram/src/scripts` directory and run these commands
    ```sh
    mkdir nav
    touch NavBar.js
    mkdir images
    ```

1. Right-click the image below and save it in `src/images` directory.

    <img src="./images/pb.png" height="100px">

1. Right-click the image below and save it in `src/images` directory.

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

The return statement usually returns only one thing. Since the return of GiffyGram will now contain multiple components, we need to wrap the components within a `string template`.

1. Change the following line of code...
    ```js
   export const GiffyGram = () => {
    //if user
    return `
      ${NavBar()}
      ${PostList()}
    `
}
    ```
1. Refresh your browser.

You just imported a function from another module, invoked it, and interpolated its return value into a string.


## Practice Footer

Create a footer component for your application that contains copywrite information. Render it below the `PostList` component.

Look in the `styles/footer.css` file to see a style that you can apply to your footer element.