## New Post Form

In order to create a post, you will need a form component. This component will render above the list of posts. Refer back to how the `Nav` and `Footer` are included in the app.


>src/scripts/feed/PostEntry.js
```js
export const PostEntry = () => {
        return `
        <div class="newPost">
            <div>
                <input value="Learning JavaScript"
                       name="postTitle"
                       class="newPost__input"
                       type="text"
                       placeholder="Title" />
            </div>
            <div>
                <input value="https://media.giphy.com/media/S9dN7OWFj8GoRhTIuL/giphy-downsized.gif"
                       name="postURL"
                       class="newPost__input"
                       type="text"
                       placeholder="URL of gif" />
            </div>

            <textarea name="postDescription"
                class="newPost__input newPost__description"
                placeholder="Story behind your gif...">Ethical chillwave jianbing ramps plaid subway tile.</textarea>

            <button id="newPost__submit">Save</button>
            <button id="newPost__cancel">Cancel</button>
        </div>
        `
}
```

This component will need eventListeners for when the buttons are clicked. 

```js
document.addEventListener("click", clickEvent => {
    if (clickEvent.target.id === "newPost__cancel") {
        //clear the input fields
    }
})

document.addEventListener("click", clickEvent => {
    if (clickEvent.target.id === "newPost__submit") {
		//colllect the input values into an object to post to the DB

        const title = document.querySelector("input[name='postTitle']").value
        const url = document.querySelector("input[name='postURL']").value
        const description = document.querySelector("textarea[name='postDescription']").value
		//we have not created a user yet - so we will hard code `1` for now.
        const postObject = {
            title: title,
            imageURL: url,
            description: description,
			userId: 1,
            timestamp: Date.now()
        }

		// be sure to import from the store
        createPost(postObject)
    }
})
```


## Post Data To API

>src/scripts/store/index.js

```js
export const createPost = post => {

    return fetch("http://localhost:3000/posts", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(post)

    })
        .then(response => response.json())
        .then(getPosts)
}
```

## Synching the API state with the App 
Your database state has changed. And, thanks to the custom event, your application state has been updated to match that new API state. 

```js
.then(dispatchStateChangeEvent) // tell any component listening that the notes state has been updated
```


But, is anyone out there listeneing? Which component needs to know about this important update? Bet you can figure it out. 

Once you do, notice what happens when you add a new note when the note list isn't being shown already. Does the list now display? If so, how might you keep that from happening? 

Discuss with your classmates and try a couple of different solutions to the problem. Which solution is most satisfying. Why? We'd love to hear what you come up with!