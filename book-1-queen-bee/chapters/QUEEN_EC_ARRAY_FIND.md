# Array Method Introduction

Up to this point, you've been iterating arrays with `for..of` loops, which are very efficient. In this Explorer chapter, you will explore how to do the same with array methods.

Array methods are complex abstractions for beginners because the syntax is not as straightforward and easy to read. You need to understand that iteration happens even though you don't see a `for..of` loop.

## Finding Tribute

Currently, you have a loop to see if a particular tribute item is assigned to a queen.

```js
    // Each queen will look at every item to see if it is hers
    for (const tribute of tributeChest) {
        if (tribute.queenId === queen.id) {
            console.log(`${queen.name} has tribute ${tribute.description}`)
        }
    }
```

Watch a short video that shows the syntax and operation of the `.find()` method on an array and see if you can replace the `for..of` loop above with an array method operation instead.

[<img src="../../book-1-queen-bee/chapters/images/video-play-icon.gif" height="75rem" />](https://www.youtube.com/watch?v=N1QcR8F3xFY)
