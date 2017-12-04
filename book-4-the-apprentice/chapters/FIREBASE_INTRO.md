# Firebase

Now that you've seen a little bit about APIs, you're going to start using a SaaS called Firebase. It allows you to upload data to a remote server and then use an API to perform CRUD actions on that data.

Add the JSON below into a `songs.json` file on your system. Then import that JSON file into your Firebase application. You'll notice that the format is slightly different from how you were storing them on your local computer. This representation is no longer a key of songs that holds an array. It's now an object that contains other objects. This is because Firebase hates, absolutely, hates arrays, and is also schizophrenic about them, so it's best to avoid then altogether.

```json
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

## Firebase via XHR calls

### GET

Since we've imported data into Firebase, we can request that collection of songs using the GET verb in an XHR.

```js
const firebaseURL = "https://{your Firebase URL}/songs"

$.ajax({
    "url": `${firebaseURL}/.json`,
    "method": "GET"
}).then(response => {
    console.log(response.data)
})
```

### POST

To create a new song, we use the POST verb in the XHR. You also need a stringified JSON representation of a song in the `data` property of the XHR.

```js
const firebaseURL = "https://{your Firebase URL}/songs"

$.ajax({
    "url": `${firebaseURL}/.json`,
    "method": "POST",
    "data": JSON.stringify({
        "name": "Bad Company",
        "album": "Bad Company",
        "artist": "Bad Company"
    })
}).then(response => {
    console.log(response)
})
```

### DELETE

Now it's time to delete a song.

```js
const firebaseURL = "https://{your Firebase URL}/songs"

$.ajax({
    "url": `${firebaseURL}/{any song id}/.json`,
    "method": "DELETE"
}).then(response => {
    console.log(response)
})
```
