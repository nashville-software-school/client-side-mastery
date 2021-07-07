# Posts Details as HTML Representation

In this chapter, you are going to display the details of a post in a meaningful way. 

## Learning Objectives
You should be able to:
* explain how to create a new date object in JavaScript
* explain the benefit of appending the `id` property of objects into the string template.


## Setup

Right-click each of these images and save them to the `giffygram/src/scripts/post` directory.

<img src="./images/block.svg" width="50px" />
<img src="./images/favorite-star-blank.svg" width="50px" />
<img src="./images/favorite-star-yellow.svg" width="50px" />

## Updated HTML Representation

Up to this point, you might only be showing the title and image for each post. Perhaps in an earlier chapter, you decided to add description or timestamp properties. If you did not, don't fret!

Update the code in the **`PostList`** component to have the following HTML representation generated for each post object in application state.

The sections below will discuss the new code in further detail.

```js
const htmlRepresentationOfThisPost = `
    <section class="post">
        <header>
            <h2 class="post__title">${postObject.title}</h2>
        </header>
        <img class="post__image" src="${postObject.imageURL}" />
        <div class="post__description">
            ${postObject.description}
        </div>
        <div class="post__tagline">
            Posted by
            <a href="#" class="profileLink" id="profile--${postObject.userId}">
                User #${postObject.userId}
            </a>
            on ${new Date(postObject.timestamp).toLocaleDateString('en-US')}
        </div>
        <div class="post__actions">
            <div>
                <img id="favoritePost--${postObject.id}"
                    class="actionIcon"
                    src="./favorite-star-blank.svg"
                />
            </div>
            <div>
                <img id="blockPost--${postObject.id}" class="actionIcon" src="./block.svg" />
            </div>
        </div>
    </section>
`
```

## User's Id in the HTML

The `id` attribute of HTML elements needs to be unique. It's just like the `id` property that you created on each one of your application state objects. It uniquely identifies that thing.

By interpolating the `id` property of each individual post into the `id` of the image, you are setting up the ability _(in a later chapter)_ to the exact post when the user clicks on a star to favorite the post.

```html
<img id="favoritePost--${postObject.id}"
    class="actionIcon"
    src="./favorite-star-blank.svg"
/>
```

## React to a User Being Selected

For now, detect when the user clicks on a favorite icon or any post, and display the `id` of the corresponding post.

```js
applicationElement.addEventListener("change", event => {
    if (event.target.id.startsWith("favoritePost")) {
        const targetSplit = event.target.id.split("--")
        const postId = targetSplit[1]

        window.alert(`User wants to favorite post ${postId}`)
    }
})
```

### Splitting a String

When you split a string, you specify the delimiter, or character(s), where the split should happen. The result of invoking the `.split()` method on a string is an array filled with what's left.

```js
const amountString = "1,5,2,1,7"
const amounts = amountString.split(",")

console.log(amounts)
> [1, 5, 2, 1, 7]
```

Watch the [How To Split a String In JavaScript](https://www.youtube.com/watch?v=u2ZocmM93yU) and [Split a String in JavaScript](https://www.youtube.com/watch?v=Upf6H4klZcw) videos for more ideas.

### Destructuring an Array

While `split()` creates an array, you can pull out the values from an array and assign each one to a variable.

```js
const [bird, mammal] = ["Flamingo", "Mouse"]

console.log(bird)    // "Flamingo"
console.log(mammal)  // "Mouse"
```


Watch the [JS Destructuring in 100 Seconds](https://www.youtube.com/watch?v=UgEaJBz3bjY) and [Array Destructuring in Javascript](https://www.youtube.com/watch?v=fsybVOVcNg0) for more examples.

## Displaying Timestamps for Humans

The timestamp format that you are using in your posts is called the epoch timestamp. It's the number of milliseconds since 1970.

If you take the number and pass it as an argument when creating new date object, you get a somewhat more human readable format.

```js
const timestamp = 1560695022812
const better = new Date(ts)

console.log(better)   // "Sun Jun 16 2019 09:23:42 GMT-0500 (Central Daylight Time)"
```

To convert it into a concise format of `month/day/year`, you can invoke the `toLocaleDateString()` method on that result.

```js
const best = better.toLocaleDateString('en-US')

console.log(best)   // "6/16/2019"
```


