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
Set up a new project. You should use Grunt to run your json-server and your http-server from one terminal window.

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
        the button is clicked, use fetch to load the song data from your json-server
    */


    /*
        Chain a `.then()` method to the fetch call, and when
        it is complete build a DOM component for each song with
        the following structure. Use the jQuery append() method
        to put an HTML representation of each song the DOM as a
        child component of the "song-list" article.

            <section class="song">
                <h1 class="song__title">{Title of song}</h1>
                <section class="song__description">
                    Performed by {artist} on the album {album}
                </section>
            </section>
    */
})
```

> db.json

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

## Challenge: Search for Songs
- Add a search bar beside the "load-songs" button. The user should be able to enter a song title. artist, or album title into the search bar. When they click the "load-songs", button, they should see the matching albums.

## Challenge: CRUD with songs
Use jQuery to implement CRUD functionality in your song list app:
- Add a form with three inputs below the search bar. Users should be able to enter song title, artist, and album title into the inputs. When they click on a "save" button, send a POST request to add your new song to the json-server database and reprint the list of songs on the DOM.
- Add a delete button to every song component in your "song-list" container. When the user clicks the delete button beside a song, that song should be deleted (both from the DOM and from the database).
- Add an edit butotn to every song component in your "song-list" container. When the user clicks the delete button beside a song, an edit form should appear in the DOM. It should be auto-populated with that song's information. When the user clicks "save" on the edit form, the new information should be saved to the json-server database and updated on the DOM.