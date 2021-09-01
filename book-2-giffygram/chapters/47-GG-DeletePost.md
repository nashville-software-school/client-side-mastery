# Delete A GiffyGram Post

One of the database verbs is `DELETE`. With json-server, we need to pass the id of the item in the URL along with the fetch method set to `DELETE`.

Create the method that will delete an item from the database. Keep in mind, just like the `POST`, once the data is updated in the API we need to update the state of the data in our app. 

**NOTE** Our posts has a userId. JSON-SERVER is looking to match that with the users resource in the database. If your post's userId is not found, errors will occur. Make sure the user for the post exists.

> scripts/data/DataManager.js

```js
export const deletePost = postId => {
  return fetch(`http://localhost:8088/posts/${postId}`, {
      method: "DELETE",
      headers: {
          "Content-Type": "application/json"
      }

  })
      .then(response => response.json())
      .then(getPosts)
}
```

Within the `Post` add a button for delete. This button should have a unique id allowing us to know which button was selected.

> scripts/feed/Post.js
```js
<button id="delete__${postObject.id}">Delete</button>

```

Next add an eventListener to handle when the delete button is clicked. We can use the string method `startsWith` to target the id of the delete button.

We can get the id of the item using the string method `split` which splits a string into an array of substrings, and returns the new array. 

```js
string.split(separator, limit)
```

Just like the newPost function, once an item has been deleted, we need to invoke `showPostList` to rebuild the list with updated date.

Be sure to import the `deletePost` method from the DataManager.

> scripts/main.js

```js
applicationElement.addEventListener("click", event => {
  event.preventDefault();
  if (event.target.id.startsWith("delete")) {
    const postId = event.target.id.split("__")[1];
    deletePost(postId)
      .then(response => {
        showPostList();
      })
  }
})
```

## <h3 id="DJ-Practice">Practice Journal</h3>
Add the ability to delete an entry from your journal.