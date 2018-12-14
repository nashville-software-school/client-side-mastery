# jQuery

[jQuery](https://jquery.com/) is, arguably, the most popular JavaScript library ever created. You will find it in use everywhere on the Web, because it was the first tool written to allow developers to write interactive JavaScript code that would work across all browsers. Before jQuery came along, development teams had to spend hours upon hours of time during a project to ensure that their code worked in Internet Explorer, Chrome, Firefox, and Safari.

## Why am I Learning This?

Most any application that wasn't built in the last 6 months is pretty much guaranteed to be using jQuery. For more than a decade, it was, by far, the most popular JavaScript library on Earth.

Even though the JavaScript that you've been using so far does most of what jQuery was useful for, we need to show you the syntax, and have you practice it, so that you will know what you're looking at when you get a job and have to work on a JavaScript application.

## Selecting Elements

The vanilla way.

```js
// Select a DOM component
const sourceComponent = document.querySelector("#fishgut")

// Get its contents
console.log(sourceComponent.textContent)
```

The jQuery way.

```js
// Select a DOM component
const sourceComponent = $("#fishgut")

// Get its contents
console.log(sourceComponent.text())
```

## Adding to the DOM

The vanilla way

```js
document.querySelector("#studentInfo").innerHTML = `
    <div>
        Michael Tambornino
    </div>
`
```

The jQuery way.

```js
$("#studentInfo").html(`
    <div>
        Michael Tambornino
    </div>
`)
```

## Creating Event Handlers

The vanilla way.

```js
const sourceComponent = document.getElementById("#fishgut")

sourceComponent.addEventListener("click", function (evt) {
    console.log(evt.target.id)
})
```

The jQuery way.

```js
const sourceComponent = $("#fishgut")

sourceComponent.click(function (evt) {
    console.log(evt.target.id)
})
```

## Videos

1. [jQuery Crash Course: Intro & Selectors](https://www.youtube.com/watch?v=3nrLc_JOF7k)
1. [jQuery Events](https://www.youtube.com/watch?v=VlWsJHsVb-E)
1. [jQuery AJAX](https://www.youtube.com/watch?v=Wl-VvvNCk2A)

## Practice - The Song List

> index.html

```html
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>NSS Starter Kit - AJAX</title>
  <link rel="stylesheet" type="text/css" href="songs.css">
</head>

<body>

  <button id="load-songs"></button>

  <article id="song-list"></article>

  <script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="songs.js"></script>

</body>
</html>
```

> songs.js

```js
$(document).ready(function() {

    // Use jQuery to get a reference to `load-songs`

    // Use jQuery to get a reference to `song-list`


    /*
        Attach a click handler to the button with jQuery. When
        the button is clicked, use $.ajax() to load `songs.json`
        from the file system
    */


    /*
        Chain a `.then()` method to the ajax call, and when
        it is complete build a DOM component for each song with
        the following structure. Use the jQuery append() method
        to put an HTML representation of each song the DOM as a
        child component of the .

            <section class="song">
                <h1 class="song__title">{Title of song}</h1>
                <section class="song__description">
                    Performed by {artist} on the album {album}
                </section>
            </section>
    */
})
```

> songs.json

```json
{
  "songs": [
    {
      "title": "The Walk",
      "artist": "Mayer Hawthorne",
      "album": "How Do You Do"
    },
    {
      "title": "YYZ",
      "artist": "Rush",
      "album": "Moving Pictures"
    },
    {
      "title": "Medicine",
      "artist": "Grace Potter",
      "album": "Grace Potter and the Nocturnals"
    },
    {
      "title": "Legs",
      "artist": "ZZ Top",
      "album": "Eliminator"
    }
  ]
}
```
