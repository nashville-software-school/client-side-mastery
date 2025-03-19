# Understanding Promises and .then()

## Introduction to Promises

In the previous chapter, we used the `fetch()` function to make requests to an API and observed these requests in the browser's Network tab. You might have noticed that while we could see the data arriving in the Network tab, we didn't actually do anything with that data in our JavaScript code.

This is because working with data from APIs involves dealing with **timing issues**. When you request data from an API, your code doesn't get that data immediately—it takes time for the request to travel across the internet, for the server to process it, and for the response to travel back.

This is where Promises come in.

## What is a Promise?

A Promise in JavaScript is exactly what it sounds like: it's a promise that something will happen in the future. More specifically, a Promise is an object that represents the eventual completion (or failure) of an asynchronous operation and its resulting value.

Think of a Promise like ordering pizza at a restaurant:
1. You place your order (make a request)
2. The waiter gives you a number for your table (a Promise)
3. The number doesn't contain your food, but it's a promise that food will arrive
4. When your food is ready, the waiter brings it to you (Promise resolved)
5. If the kitchen can't make your order, the waiter tells you why (Promise rejected)

### The Three States of a Promise

A Promise can be in one of three states:
1. **Pending**: The initial state—the operation hasn't completed yet
2. **Fulfilled**: The operation completed successfully, and the Promise has a resulting value
3. **Rejected**: The operation failed, and the Promise has a reason for the failure. This is not the same as when we made a request to a nonexistent endpoint. That promises still fulfilled. It is unlikely that you will run into a rejected promise until you get to server side, so we will only talk about pending and fulfilled promises from here on out.

## Fetch Returns a Promise

Let's think back on what we did in the last chapter. We called the `fetch()` function and passed it the endpoint (url) for the api where we wanted to receive some data. `fetch()` is a function, and all functions return *something*, so what does `fetch()` return? If you said it returns the data from our endpoint you are incorrect. `fetch()` immediately returns a promise. This Promise will eventually *resolve* with the *response* from the server-our random fox object.

Let's take a look at this with our own eyes. In `main.js` where you are fetching a random fox, assign that function call to a variable and console log that variable. 

```javascript
let responsePromise = fetch('https://randomfox.ca/floof/');
console.log(responsePromise); // Promise object (in pending state)
```

Run the code and open your devtools to the console. Click on the **Get Fox** button to run that code and see the output. 

You should see `Promise {<pending>}` in the console. 

Since `fetch()` returns a Promise, we need a way to tell our code to wait for the Promise to be fulfilled before trying to use the response data. This is where the `.then()` method comes in.

## Using .then() with Promises

The `.then()` method tells JavaScript what to do after a Promise is fulfilled (when the data has successfully arrived). Think of `.then()` as saying "when you've got the data, *then* do this next."
The `.then()` method takes one argument: a function that contains the code you want to run once the Promise is complete. This function will automatically receive the result of the Promise (in this case, the response from the API). 

Make the following changes to your fox fetch call:
```javascript
fetch('https://randomfox.ca/floof/')
  .then((response) => {
    // This code runs when the Promise is fulfilled
    console.log('Response received!');
    console.log(response);
  });

console.log('This code runs immediately!');
```

If you click the **Get Fox** button, you'll notice that "This code runs immediately!" is logged to the console before "Response received!". This is because the `.then()` callback only executes after the Promise is fulfilled, which happens when the server responds to our request. 

### Accessing the Response Data

The response object we get from a fetch request contains the server's response, but it doesn't give us direct access to the JSON data. To access the data, we need to call the `.json()` method on the response object.

Importantly, the `.json()` method ***also*** returns a Promise, because parsing the JSON data can take time for large responses. This means we need to use *another* `.then()` to access the actual data. 

Make the following adjustments to your code:

```javascript
fetch('https://randomfox.ca/floof/')
  .then((response) => {
    console.log('Response received!');
    // Parse the JSON in the response
    return response.json();
  })
  .then((foxData) => {
    // This code runs when the JSON parsing is complete
    console.log('Data parsed!');
    console.log(foxData);
  });

console.log('This code runs immediately!');
```

This is called "chaining Promises" because we're connecting multiple asynchronous operations together.

## Displaying Fox Images Using Promises and .then()

Now let's put it all together to display the random fox image on the webpage. 

1. Use `document.querySelector` to get the fox `img` element. 
    ```javascript
    const foxImage = document.querySelector("#fox")
    ```
2. Set the image `src` to our foxData image
    ```javascript
    foxImage.src = foxData.image
    ```
3. Run the code and see what happens!


## 📓 Key Concepts to Remember

>1. **Asynchronous Operations**: Operations like API calls don't complete immediately—they take time.
>2. **Promises**: Objects that represent the eventual completion or failure of an asynchronous operation.
>3. **States of a Promise**: Pending (initial), Fulfilled (success), or Rejected (failed).
>4. **`.then()`**: A method to specify what to do when a Promise is fulfilled.
>5. **Chaining**: You can chain multiple `.then()` calls to create a sequence of asynchronous operations.

## 🎓 Practice Exercise: Displaying a random dog

Now it's your turn to practice! Use what you've learned to to display the random dog image you get back from the Random Dog api. 

>💡 Make sure you look at the response in the network tab so that you know what property to target to get the dog image.

## What We've Learned

In this chapter, we've:
- Learned what Promises are and why they're important in JavaScript
- Understood how `fetch()` returns a Promise
- Used `.then()` to work with the data when a Promise is fulfilled
- Built a working application that fetches and displays a fox image

## Next Steps

In the next chapter, we'll explore a more modern way to work with Promises: the `async` and `await` keywords. These provide a cleaner, more readable syntax for working with asynchronous operations.
