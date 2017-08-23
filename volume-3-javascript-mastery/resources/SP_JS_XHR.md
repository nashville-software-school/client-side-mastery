# :pushpin: Exercises

1. [Mind Melting](../exercises/SP_JS_XHR/MIND_MELTING.md)
1. [Pet Food](../exercises/SP_JS_XHR_FOOD.md)
1. [Seasonal Sales](../exercises/SP_JS_XHR_SEASONAL_SALES.md)
1. [Music History 4](../exercises/SP_JS_XHR_MUSIC_HISTORY_4.md)

# XHR (XmlHttpRequest)

## History

Talk about the history of XHR, from the browser-based Outlook client for which it was originally created, the outbreak of AJAX in 2005, and the revolution of how to use it as shown by Google Maps.

## Asynchronous Development

Use the whiteboard and discuss with the students the idea that they will be writing code in a way that isn't straightforward and procedural anymore.

## Callbacks

Talk about how they've been using callbacks with the array methods of forEach, filter, map, and reduce. Explain how it is a way to register some logic that will be executed at a future point in time, after a I/O process is complete.

## JSON

Talk about how JSON has become the data format for the Web. Discuss its strict rules and show JSONLint.

## First Example

##### xhr.js

```js
function executeThisCodeAfterFileIsLoaded () {
  // A bit more about what `this` is here. What is the execution context?
  console.log(this.responseText);

  // Show usage of JSON.parse() here to get a POJO
}

// Create an XHR object
var myRequest = new XMLHttpRequest();

// XHR objects emit events when their operation is complete, or an error occurs
myRequest.addEventListener("load", executeThisCodeAfterFileIsLoaded);
myRequest.addEventListener("error", executeThisCodeIfXHRFails);

// Then tell the XHR object exactly what to do
myRequest.open("GET", "songs.json");

// Tell the XHR object to start
myRequest.send();
```

##### songs.json

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

# Resources

[MDN: Using XHRs](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/Using_XMLHttpRequest)