# Array Method Introduction

Up to this point, you've been iterating arrays with `for..of` loops, which are very efficient. In this Explorer chapter, you will explore how to do the same with array methods.

Array methods are complex abstractions for beginners because the syntax is not as straightforward and easy to read. You need to understand that iteration happens even though you don't see a `for..of` loop.

## Finding River and Trail Adventures

Currently, you have `for..of` loops to find information like the cheapest trails or the expensive trails.

```js
const inexpensive = []

for (const trail of trails) {
    if(trail.price.length === 1) {
        inexpensive.push(trail)
    }
}
```

Watch a short video that shows the syntax and operation of the `.filter()` method on an array and see if you can replace your `for..of` loops in your code where appropriate.

[<img src="../../book-1-queen-bee/chapters/images/video-play-icon.gif" height="75rem" />](https://www.youtube.com/watch?v=3LOEGS4qcRM)
