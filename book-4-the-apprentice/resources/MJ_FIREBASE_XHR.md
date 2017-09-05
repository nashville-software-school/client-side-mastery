## Firebase

Now that you've seen a little bit about APIs, you're going to start using a SaaS called Firebase. It allows you to upload data to a remote server and then use an API to perform CRUD actions on that data.

> **Instructor Suggestion:**
> Have students sign up for a Firebase account, and discourage the usage of the interface for building large JSON documents. Have students build and verify JSON locally and import it.

First, you need to combine your two JSON files that you've been using to populate your UI into a single JSON file. In addition, you'll be changing the format of the JSON object (see below).

Import a JSON file into your Firebase. You'll notice that the format is slightly different from how you were storing them on your local computer. This representation is no longer a key of songs that holds an array. It's now an object that contains other objects. This is because Firebase hates, absolutely, hates arrays, and is also schizophrenic about them, so it's best to avoid then altogether.

```
{
  "songs": {
    "sharp": {
      "name": "Sharp Dressed Man",
      "artist": "ZZ Top",
      "album": "Eliminator"
    },
    "breakfast": {
      "name": "Breakfast in America",
      "artist": "Supertramp",
      "album": "Breakfast in America"
    },
    "goodbyemary": {
      "name": "Goodbye Mary",
      "artist": "Supertramp",
      "album": "Breakfast in America"
    },
    "carryon": {
      "name": "Carry on My Wayward Son",
      "artist": "Kansas",
      "album": "Overture"
    },
    "gimme": {
      "name":"Gimme All Your Lovin",
      "album": "Eliminator",
      "artist": "ZZ Top"
    },
    "welcome": {
      "name":"Welcome To The Jungle",
      "album": "Appetite For Destruction",
      "artist": "Guns & Roses"
    },
    "ratherbe": {
      "name":"Rather Be",
      "album": "Rather Be",
      "artist": "Silent Bandit"
    },
    "thewalk": {
      "name":"The Walk",
      "album": "How Do You Do",
      "artist": "Mayer Hawthorne"
    }
  }
}
```

### Firebase via XHR calls

#### GET

To start off, all we're going to do is change how we get our data. Since we've imported it all into Firebase, all you need to do is open your `populate-data.js` file and change the URL. Right now, it's pointing to a local `songs.json` file, but you're going to change it.

1. Go to your Firebase console in Chrome and copy the URL.
2. Update the `url` property in your XHR to `{{url you just copied}}/.json`.
3. Refresh your page.

Since your existing Handlebars template is already set up to handle a data object with a `songs` key on it, everything should just work normally. You've simply changed the location of where the data lives... nothing else changes.

#### POST

Next, we get to use the real power of databases, XHRs and APIs. Up until now, your Add Song form didn't really do anything. Once you refreshed the page, your new song disappeared. Not any more.

Create a new module in your application - let's name it `save-song.js` - and we're going to use the POST method to add a song. In a POST, you need to actually send the data to the server, and with a jQuery AJAX call, we specify a `data` key in the config object.

```js
define(["jquery"], function($) {

  // Define your event listener for the add song button
  $("#add-song").click(function() {
    // Extract all the form field values and create a new song object with them
    var newSong = {
      artist: "",
      album: "",
      title: ""
    };

    // POST the data to Firebase
    $.ajax({
      url: "{{your firebase url}}/songs/.json",
      method: "POST",
      data: JSON.stringify(newSong)
    })
    .done(function(response) {
      console.log("response from Firebase:", response);
      // You'll likely want to execute the code that you're using
      // on page load here to run the GET XHR and bind to Handlebars
    });
  });
});
```

#### DELETE

Now it's time to delete a song. In your Handlebars file, add a `<button>` element for each song, labeled "Delete". Add a class of `delete-button` to each one. Remember that dynamically added DOM elements have to have events handled at the document level.

Create a new module in your application named `delete-song.js`.

```js
define(["jquery"], function($) {

  $(document).on("click", ".delete-button", function() {
    var songKey = $(this).attr("id");

    // DELETE the song from Firebase by specifying the URL to
    // the exact song you are targeting.
    $.ajax({
      url: "{{your firebase url}}/songs"+ songKey +"/.json",
      method: "DELETE"
    })
    .done(function(response) {
      console.log("response from Firebase:", response);
      // You'll likely want to execute the code that you're using
      // on page load here to run the GET XHR and bind to Handlebars
    });
  });

});
```

Now all you have to do is use the special `{{@key}}` decorator in your Handlebar file to set the song's key as the delete button's `id` attribute.


> **Pro tip:** Ever need to convert an object collection into an array of objects, and maintain the original key names for each object?
>
> ```js
> var arr = Object.keys( x.songs ).map( function( key ){
>   var newArrItem = x.songs[ key ];
>   newArrItem.key = key;
>   return newArrItem;
> });
> ```
