# :pushpin: Exercises

1. [Slideshow](../exercises/MJ_JQUERY_SLIDESHOW.md)

# jQuery: AJAX

1. What is asynchronous execution vs. synchronous execution?
1. What is XHR (history and usage)?
1. What is JSON, and why are we using it?

### Your first XHR call

Add the following HTML to your jQuery DOM. Feel free to comment out all the other DOM elements we used during the live coding.

```html
<div id="list-of-songs"></div>
```

Now create a new directory named `data`, and then create a new file named `songs.json`.

```bash
cd ~/workspace/jquery
mkdir data
touch data/songs.json
```

Paste the following JSON into that file.

```json
{
  "songs": [
    {
      "title": "The Walk",
      "artist": "Mayer Hawthorne",
      "album": "How Do You Do"
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

Create a new JavaScript file named `ajax.js` and add a `<script>` tag for it. Add the following content.

```js
$(document).ready(function() {

  $.ajax({
    url: "data/songs.json"
  }).done(function(contentsOfTheFile) {
    // When you tell jQuery to read a file via the ajax method
    // it reads the contents, and then executes whatever function
    // that you specify here in the done() method, and passes in
    // the contents of the file as the first argument.
    console.log("the contents of songs.json");
    console.log(contentsOfTheFile);
  });

});
```

Now that you know the basics of using the `ajax()` method to make XHR calls, it's time to move on to the Music History 5 module where your job will be to use JSON and XHR to load your songs from separate files and then convert the raw JSON data to HTML for display in your page.
