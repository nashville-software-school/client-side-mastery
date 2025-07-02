# Array Method Introduction

Up to this point, you've been iterating arrays with `for..of` loops, which are very efficient. In this Explorer chapter, you will explore how to do the same with array methods.

Array methods are complex abstractions for beginners because the syntax is not as straightforward and easy to read. You need to understand that iteration happens even though you don't see a `for..of` loop.

## Converting Objectes to HTML

Currently, you have `for..of` loop that looks like the code provided below. It's purpose is to covert the raw data into corresponding HTML strings that will eventually end up in a web browser for people to view.

```js
for (const item of todaysIngredients) {
    html += `<h2>${item.species}</h2>
        <section class="menu__item">${item.species} Soup</section>
        <section class="menu__item">${item.species} Sandwich</section>
        <section class="menu__item">Grilled ${item.species}</section>
    `
}
```

Watch a short video that shows the syntax and operation of the `.map()` method on an array and see if you can replace your `for..of` loop in your code.

[<img src="../../../../book-1-queen-bee/chapters/images/video-play-icon.gif" height="75rem" />](https://www.youtube.com/watch?v=G3BS3sh3D8Q)
