## New Post Form

In order to create a post, you will need a form component. This component will render above the list of posts. Refer back to how the `Nav` and `Footer` are included in the app.


>src/scripts/feed/PostEntry.js
```js
export const PostEntry = () => {
        return `
        <div class="newPost">
            <div>
                <input value=""
                       name="postTitle"
                       class="newPost__input"
                       type="text"
                       placeholder="Title" />
            </div>
            <div>
                <input value=""
                       name="postURL"
                       class="newPost__input"
                       type="text"
                       placeholder="URL of gif" />
            </div>

            <textarea name="postDescription"
                class="newPost__input newPost__description"
                placeholder="Story behind your gif..."></textarea>

            <button id="newPost__submit">Save</button>
            <button id="newPost__cancel">Cancel</button>
        </div>
        `
}
```
## Update Data Manager
Create the `createPost` method. This method will accept an argument of datatype obj with a new post values.

> src/scripts/data/DataManager
```js
export const createPost = postObj => {
  return fetch("http://localhost:8088/posts", {
      method: "POST",
      headers: {
          "Content-Type": "application/json"
      },
      body: JSON.stringify(postObj)

  })
      .then(response => response.json())
}
```

## Add EventListeners

We will need to add eventListeners to handle the cancel and submit buttons.
> src/scripts/main.js
```js
applicationElement.addEventListener("click", event => {
  if (event.target.id === "newPost__cancel") {
      //clear the input fields
  }
})

applicationElement.addEventListener("click", event => {
  event.preventDefault();
  if (event.target.id === "newPost__submit") {
  //collect the input values into an object to post to the DB
    const title = document.querySelector("input[name='postTitle']").value
    const url = document.querySelector("input[name='postURL']").value
    const description = document.querySelector("textarea[name='postDescription']").value
    //we have not created a user yet - for now, we will hard code `1`.
    //we can add the current time as well
    const postObject = {
        title: title,
        imageURL: url,
        description: description,
        userId: 1,
        timestamp: Date.now()
    }

  // be sure to import from the DataManager
      createPost(postObject)
  }
})
```

Create and invoke `showPostEntry` to display the form.
```js
const showPostEntry = () => { 
  //Get a reference to the location on the DOM where the nav will display
  const entryElement = document.querySelector(".entryForm");
  entryElement.innerHTML = PostEntry();
}
```

Using the form, create a new post. Check the database and confirm an item was added. A new post has been added, however the list does not reflect the additional content. How do you get the list to display the new post?

Work with your classmates to come up with a solution to show the updated list. Share your ideas with the instruction team.

## <h3 id="DJ-Practice">Practice Add Journal Entries with a form</h3>
Using the form you created for your journal, create the functions needed to add new entries to the database.

**Bonus** Consider the display order of the entries. What array method could you use to sort the entry display.
