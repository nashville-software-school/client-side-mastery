# :pushpin: Exercises

1. [ACME Explosives](../exercises/MJ_PROMISES_ACME_EXPLOSIVES.md)

# Promises and deferred actions

We'll be using Promises to control the order of execution in our asynchronous code. Up to this point, we've been using callbacks to handle when the status of an asynchronous operation is updated.

```js
function get_some_api_data(successCallback, failedCallback) {
$.ajax(...)
  .done(function(api_data) {
    successCallback(api_data); // Execute the success function reference passed to us
  })
  .fail(function(xhr, status, error) {
    failedCallback(error); // Execute the failure function reference passed to us
  });
}
```

With Promises, we can let any other code that is listening to the operation know when it either succeeded or failed. Let's look at an example of loading songs for Music History.

```js
function getSongs() {
  return new Promise((resolve, reject) => {
    // There will be an asynchronous operation here (e.g. XHR or AJAX)
  });
}
```

This function will now return a Promise. When the function gets invoked, it **will be** a Promise.

```js
var iAmAPromise = getSongs();
console.log("iAmAPromise", iAmAPromise); // You will see a promise definition in the console
```

Using Promises, any other code can now invoke a function that performs some ansynchronous operation, and then write handler functions that will be invoked when that operation is successful, or failed.

 - Resolve is used to broadcast that the action succeeded.
 - Reject is used to broadcast that the action failed.

```js
function getSongs() {
  return new Promise((resolve, reject) => {
    // Create an XHR to load songs
    var loader = new XMLHttpRequest();

    // Listen for when the load event is broadcast
    // and execute an anonymous callback
    loader.addEventListener("load", function () {
      var songList = JSON.parse(this.responseText).songs;
      resolve(songList);
    });

    // If an error occurs, reject the promise
    loader.addEventListener("error", function () {
      reject();
    });

    loader.open("GET", "songs.json");
    loader.send();

  });
}
```

Now you can invoke the function, and use the `then()` method on the Promise to specify code to be executed on success and failure. You will write a callback function for each case.

```js
/*
  asyncFunction().then(resolveFunctionReference, rejectFunctionReference)
 */


//Original call site of the promise
getSongs()
  // Then gets executed when promise is resolved or rejected
  .then(
    // The first callback function will be invoked when you resolve
    function(json_data) {
      console.log("API call successful and responded with", json_data);
    },
    // The second callback function will be invoked when you reject
    function(json_data) {
      console.log("API call not successful");
    }
  );
```

This code is easier to follow because we don't have a callback function reference that we're passing around anymore. We handle the success, or failure, of the asynchronous logic with `then()` at the original call site.

Where Promises come in particularly handy is when dependent XHR calls start creating a **Pyramid of Doom**.

```js
$.ajax(...).done(function(first_data) {
  
  // This XHR depends on the data that was returned from the first XHR
  $.ajax({ data: first_data }).done(function(second_data) {
  
  // This XHR depends on the data that was returned from the second XHR  
    $.ajax({ data: second_data }).done(function(third_data) {
      var response_3 = third_data;
    }
  }
}
```

By separating each of the XHR calls into their own functions that return a promise, that code becomes much more readable.

```js
// This function does one thing, and returns a promise
var firstAJAX = function() {
  return new Promise((resolve, reject) => {
    $.ajax({
      url: "https://nss-demo-instructor.firebaseio.com/songs.json"
    }).done(function(data) {
      resolve(data);
    }).fail(function(xhr, status, error) {
      reject(error);
    });
  }
};

// This function does one thing, and returns a promise
var secondAJAX = function(result_of_firstXHR) {
  return new Promise((resolve, reject) => {
    $.ajax({
      url: "https://nss-demo-instructor.firebaseio.com/more-songs-info.json",
      data: result_of_firstXHR
    }).done(function(data) {
      resolve(data);
    }).fail(function(xhr, status, error) {
      reject(error);
    });
  }
};

// This function does one thing, and returns a promise
var thirdAJAX = function(result_of_secondXHR) {
  return new Promise((resolve, reject) => {
    $.ajax({
      url: "https://nss-demo-instructor.firebaseio.com/song-details.json",
      data: result_of_secondXHR
    }).done(function(data) {
      resolve(data);
    }).fail(function(xhr, status, error) {
      reject(error);
    });
  }
};

/*
  Now we use those Promises to describe the order of execution, 
  and how data flows between each one.

  Note how the resolve callback function, itself, returns another
  promise. This is how you can chain promises, and dictate the
  order of execution of multiple aynschronous operations.
 */
firstAJAX()
  .then(function(data1) {
    return secondAJAX(data1);
  })
  .then(function(data2) {
    return thirdAJAX(data2);
  }).then(function(data3){
    console.log(data3);
  });
```

Promises also maintain their state. If you store a Promise object in a variable, you can then check the state of that Promise at any other time in your code. Think of a banking application where you use an XHR to get the current balance of an account, and all transactions in the last 30 days.

By using a promise to broadcast, and maintain, the state of that operation, you can then check it later 

```js
// This stores the Promise object
var promiseStorage = promise();

// You can then handle success/failure of the promise
promiseStorage.then(
  function(results) {
    console.log("results",results);
  },
  function(error) {
    console.log("error", error);
  }
);

 $("#clearFilter").click(function() {
  // This does not execute the XHR function again, but simply
  // checks the state of the Promise and acts accordingly
  promiseStorage.then(
    function(results) {
      console.log("results",results);
    },
    function(error) {
      console.log("error", error);
    }
  );
 });
```
