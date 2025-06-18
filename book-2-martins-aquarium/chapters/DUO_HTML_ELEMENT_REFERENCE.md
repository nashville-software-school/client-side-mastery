# Targeting DOM With JavaScript

When you hear a developer use the acronym DOM, they are talking about the HTML. Even though DOM is something much more complex and subtle, for now, just consider it the HTML that is being rendered to be visible to your users.

The end goal is to take all of that HTML that is being generated in the **VillainList**, and **HeroList** functions and get it into the DOM.

Remember that your HTML file that gets loaded initially doesn't have any content other than your `<h1>` tag that you created in the first chapter. You will use your JavaScript logic to add more HTML to it later.

## Setting Up the Main Module

Open your `main.js` and add the following code to it.

```js
const theExistingMainElement = document.querySelector("#container")
```

This is how JavaScript can target the existing DOM element. The `#container` is your way of specifying that you want an HTML element whose `id` attribute equals "container". That just so happens to be this element.

Look in your `index.html` file again to see it.

```html
<main id="container">
    <h1>The Dynamite Duo</h1>
</main>
```

## Debugger Breakpoints

On the line after the query selector code, type the 'debugger' keyword. Then, refresh the page and inspect the value of `theExistingMainElement` in the **Sources** tab when it appears.

The `debugger` keyword works just like your breakpoints did in Book 1. It pauses the execution of code on that line. Then you can inspect the values of all of your variables in the **Scope** panel that exists to the right.

Watch the animation below to see what happens when the browser hits the `debugger` keyword in your JavaScript. Then the value of the `theExistingMainElement` variable can be viewed on the right.

![](./images/intro-to-sources-dev-panel.gif)

Once you have seen how the debugger works and evaluated the variable, go back and remove the `debugger` keyword and head to the next chapter.
