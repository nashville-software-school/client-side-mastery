# IIFE, XHRs and Callbacks, Oh My

## Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/spa/iife-xhr && cd $_
touch index.html
touch iife-xhr.js
touch Predator.js
```

## Requirements

1. Create two JSON files. One should contain an array of carnivores, and the other should contain an array of herbivores.
1. Create an IIFE with the name of `Predator`.
1. Predator should have two private arrays to store carnivores and herbivores.
1. Predator should expose two public functions to load each JSON file and store the array of animals in the appropriate private array. Each of those functions should accept one argument that will store the callback function to be executed.
1. In the `iife-xhr.js` file, define two functions that will be executed after each type of animal is loaded then display those animals in your DOM. (Example given below)
1. In the Predator IIFE, invoke the callback function, passed in from `iife-xhr.js`, after each file is loaded.

Here's some code to get you started.

##### iife-xhr.js

```js
function showCarnivores (carnivores) {
  
}

function showHerbivores () {

}

Predator.loadCarnivores(showCarnivores);
```

##### Predator.js

```js
var Predator = (function () {
  var carnivores = [];

  return {
    loadCarnivores: function (callbackToInvoke) {
      var loader = new XMLHttpRequest();

      loader.addEventListener("load", function () {
        // Set the value of the private array
        carnivores = JSON.parse(this.responseText);

        // Invoke the callback function so that the caller knows
        // that the process is complete. Make sure to pass the 
        // carnivore array as an argument.

      });
    }
  }
})();
```


