# Understanding async/await with Promises

## Introduction to async/await

In the previous chapter, we learned about Promises and how to handle them using the `.then()` method. While `.then()` works well, JavaScript offers a more modern and easier-to-read way to work with Promises: the `async` and `await` keywords.

Think of `async/await` as syntactic sugar - it's a nicer way to write the same Promise-based code we've already learned, but in a style that looks more like regular synchronous code.

## What is async/await?

The `async` and `await` keywords provide a cleaner syntax for working with Promises:

- `async` is used to declare that a function returns a Promise and enables the use of `await` inside it
- `await` is used to pause execution until a Promise is resolved, and then return its result

## How async/await Works

Let's break down how `async/await` works:

### 1. The `async` Keyword

When you add the `async` keyword before a function declaration, two things happen:
- The function automatically returns a Promise
- You can use the `await` keyword inside the function

```javascript
const myFunction = async () => {
    // Function body
}
```

### 2. The `await` Keyword

The `await` keyword can only be used inside an `async` function. When you put `await` before a Promise:
- It pauses the execution of the function until the Promise resolves
- It then returns the resolved value of the Promise

```javascript
const myFunction = async () => {
    const result = await somePromise();
    // Code here waits until somePromise() resolves
    console.log(result);
}
```

## Using async/await with the Random Dog API

Now let's use `async/await` to fetch and display random dog images from the Dog API. This will help you see the difference between the `.then()` approach we used with the Fox API and the `async/await` approach:

Let's define a new function who's responsibility will be to fetch and display a dog image. We'll begin by having our function fetch a random dog image from the random dog api.

```javascript
const displayDogImage = () => {
    fetch("https://random.dog/woof.json")
}
```

Remember that `fetch()` returns a Promise. We'll use the `await` keyword here to *await* the Promise and store the response in a variable once it has resolved. 

```javascript
const displayDogImage = () => {
    const response = await fetch("https://random.dog/woof.json")
} 
```

Since we are using the `await` keyword here, we *must* define this function as `async`

```javascript
const displayDogImage = async () => {
    const response = await fetch("https://random.dog/woof.json")
}
```

We have the response object, but we don't have direct access to the data. We need to use the `.json()` method on the response object to get the data. Remember, the `.json()` method also returns a Promise so we will have to await it as well before we can get the converted data. 

```javascript
const displayDogImage = async () => {
    const response = await fetch("https://random.dog/woof.json")
    const dogData = await response.json()
}
```

Now that we have the dog data, let's add functionality to display the image in the browser.

```javascript
const displayDogImage = async () => {
    const response = await fetch("https://random.dog/woof.json")
    const dogData = await response.json()
    const dogImage = document.querySelector("#dog")
    dogImage.src = dogData.url
}
```

Finally, for our dog button click event, lets pass this function as the function we want to run when the button is clicked.

```javascript
dogButton.addEventListener("click", displayDogImage)
```

## Comparing .then() and async/await

Let's compare how we handle the same task using both approaches:

### Fox API using .then()

```javascript
foxButton.addEventListener("click", () => {
    fetch("https://randomfox.ca/floof/")
        .then((response) => {
            return response.json()
        })
        .then((foxData) => {
            const foxImage = document.querySelector("#fox")
            foxImage.src = foxData.image
        })
})
```

### Dog API using async/await

```javascript
const displayDogImage = async () => {
    const response = await fetch("https://random.dog/woof.json")
    const dogData = await response.json()
    const dogImage = document.querySelector("#dog")
    dogImage.src = dogData.url
}

dogButton.addEventListener("click", displayDogImage)
```

Key differences:
1. With `async/await`, we mark the function as `async`
2. Instead of chaining `.then()` calls, we use `await` and assign the result directly to variables
4. The code reads more like synchronous code, which is more familiar and easier to understand

## Common Mistakes and Rules to Remember

When working with `async/await`, keep these important rules in mind:

### 1. You can only use `await` inside an `async` function

This won't work:
```javascript
// ❌ Incorrect - await outside of async function
const displayDogImage () => {
    const response = await fetch('https://random.dog/woof.json');
    // ...
}
```

You must make the function async:
```javascript
// ✅ Correct - await inside async function
const displayDogImage = async () => {
    const response = await fetch('https://random.dog/woof.json');
    // ...
}
```

### 2. Forgetting to await a Promise

If you forget the `await` keyword, you'll be working with the Promise object itself, not its resolved value:

```javascript
// ❌ Incorrect - forgetting to await
const displayDogImage = async () => {
    const response = fetch('https://random.dog/woof.json'); // response is a Promise, not the actual response
    console.log(response); // Promise {<pending>}
}
```

## 📓 Key Concepts to Remember

1. **async**: A keyword that makes a function return a Promise and allows the use of await inside it
2. **await**: A keyword that pauses execution until a Promise resolves and returns its value
4. **Function requirement**: Any function that uses `await` must be declared with the `async` keyword
5. **Promises underneath**: `async/await` is just a different way to write Promise-based code - Promises are still working behind the scenes

## What We've Learned

In this chapter, we've:
- Learned what `async/await` is and why it's useful
- Understood how to make functions asynchronous with the `async` keyword
- Used the `await` keyword to pause execution until Promises resolve
- Compared the `.then()` approach with the `async/await` approach
- Built a working application that fetches and displays a dog image using `async/await`
- Learned common mistakes to avoid when using `async/await`

## Next Steps

In modern JavaScript, `async/await` is generally preferred for its readability and ease of use, but understanding both approaches will help you read and work with all kinds of JavaScript code. As we continue in this book we will use the `async/await` approach for the projects. However, you will encounter `.then()` again once you get to the React coursework as certain React functions don't allow the `async/await` approach. 