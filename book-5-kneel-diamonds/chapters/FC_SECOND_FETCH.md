# Second Fetch

In this chapter, you are going to request an image of a dog from the URL provided below, and then update the `src` attribute of the image element once you get the data back.

Instead of using a `fetch().then()` chain, you will use the syntactical sugar of `async/await`.

```txt
https://random.dog/woof.json
```

Here's what the same operation looks like with async/await.

```js
// Define an asynchronous function
const getTheDog = async () => {
    // Request the data and wait for the data to come back over the Web
    const response = await fetch("https://random.dog/woof.json")

    // Parse the received JSON string into an Object
    const dogJSONConvertedToObject = await response.json()

    // Target the HTML image element
    const dogImgElement = document.querySelector("#dog")

    // Update the `src` with a URL. The browser will request that image.
    dogImgElement.src = dogJSONConvertedToObject.url
}
```

## Helpful Resources

- Video: [JavaScript Async Await](https://www.youtube.com/watch?v=V_Kr9OSfDeU)
- Video: [Async/Await in JavaScript Tutorial for Beginners](https://www.youtube.com/watch?v=7l2-ds_U2Lc)
- LLM Prompt
    > I am a beginner learning JavaScript concepts. I am starting to learn about the `async` and `await` features of making asynchrionous requests for data. Take on the role of a development coach and comprehensively explain what these keywords do.
    >
    > - Show me two basic examples of using async/await with the fetch() method
    > - Provide a detailed explanation of each example
    > - Explain what happens if I perform an asynchronous operation and don't use async/await
    > - List important vocabulary terms that I need to know with the correct definitions