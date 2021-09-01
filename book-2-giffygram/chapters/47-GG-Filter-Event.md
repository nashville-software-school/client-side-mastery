# Filtering Posts

## Learning Objectives
You should be able to:

* identify where a function parameter is defined
* identify where a value is passed as an argument when a function is invoked
* explain the flow of the array method filter

## Filtering Posts

When we filter data, we don't necessarily need to get a new copy from the database. We could use the current `state` of the data.

Everytime new data is requested from the database, we will set a variable equal to the data. This becomes the current `state` of our app. We will also need to provide a way to get the data from the DataManager.

Refactor the `getPosts` method and include the `postCollection` variable and the method to return the postCollection.

> scripts/data/DataManager.js
```js
let postCollection = [];

export const usePostCollection = () => {
  //Best practice: we don't want to alter the original state, so
  //make a copy of it and then return it
  //The spread operator makes this quick work
  return [...postCollection];
}
export const getPosts = () => {
  return fetch("http://localhost:8088/posts")
    .then(response => response.json())
    .then(parsedResponse => {
      postCollection = parsedResponse
      return parsedResponse;
    })
}
```

Within main.js, include an eventListener for the `yearSelection` option. Once the year has been defined, we can invoke a function that filters the data.

> main.js
```js
applicationElement.addEventListener("change", event => {
  if (event.target.id === "yearSelection") {
    const yearAsNumber = parseInt(event.target.value)
    console.log(`User wants to see posts since ${yearAsNumber}`)
    //invoke a filter function passing the year as an argument
    showFilteredPosts(yearAsNumber);
  }
})

const showFilteredPosts = (year) => {
  //get a copy of the post collection
  const epoch = Date.parse(`01/01/${year}`);
  //filter the data
  const filteredData = usePostCollection().filter(singlePost => {
    if (singlePost.timestamp >= epoch) {
      return singlePost
    }
  })
  const postElement = document.querySelector(".postList");
  postElement.innerHTML = PostList(filteredData);
}

```
## Practice Array Methods
There are many array methods designed to assist with manipulation of data. Some methods we will be using include: filter, find, isArray, push, forEach, length, and map. Take a look at the documentation found at [W3Schools](https://www.w3schools.com/jsref/jsref_obj_array.asp) and become familiar with what is available.

## Practice Destructure

Watch the [JS Destructuring in 100 Seconds](https://www.youtube.com/watch?v=UgEaJBz3bjY) and [Array Destructuring in Javascript](https://www.youtube.com/watch?v=fsybVOVcNg0) for destructering values.

## <h3 id="DJ-Practice">Practice Filter Journal Entries </h3>
You journal has a couple of options for filtering the entries. You could filter by date or by mood. Create an option for the user to select how to filter and implement code to display the filtered list.

##
**Bonus**: How you can refactor the `showPostList` and `showFilteredPosts` methods eliminating duplicate code. Removing duplicate code makes it `dry`.

**Bonus 2.0**: How can you display the number of post in the footer? You may need a variable in `main` to hold the value of the year selected. This would become another `state` of the app.

