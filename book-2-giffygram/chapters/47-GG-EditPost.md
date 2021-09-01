# Edit a GiffyGram Post

The flow to edit a post:
1. Click edit button.
1. Ensure the post data is the latest and greatest from the database.
1. Show the post details in input fields.
1. Make changes in the input fields.
1. Click save button.
1. Collect inputs into an object.
1. Send updated object to the database.
1. Get updated list (state).
1. Show list with updated posts.


## Update DataManger
We will add two methods to the DataManager. The first method will retrieve a single post. This ensures we have the latest and greatest information from the database.

> scripts/data/DataManager.js

```js
export const getSinglePost = (postId) => {
  return fetch(`http://localhost:8088/posts/${postId}`)
    .then(response => response.json())
}
```

The second method will update a post in the database. We will use the database verb `PUT` in the fetch call. This does not create a new item. This replaces the data with the matching id.

```js
export const updatePost = postObj => {
  return fetch(`http://localhost:8088/posts/${postObj.id}`, {
      method: "PUT",
      headers: {
          "Content-Type": "application/json"
      },
      body: JSON.stringify(postObj)

  })
      .then(response => response.json())
      .then(getPosts)
}
```

Within the `Post` add a button for edit. This button should have a unique id allowing us to know which button was selected.

> scripts/feed/Post.js
```js
<button id="edit__${postObject.id}">Edit</button>

```

## Edit button eventListener
Next add an eventListener to handle when the edit button is clicked. We can use the string method `startsWith` to target the id of the edit button.

We can get the id of the item using the string method `split` which splits a string into an array of substrings, and returns the new array. 

Once the post is returned, we can invoke a function to display a single post. 

> scripts/main.js
```js
applicationElement.addEventListener("click", event => {
  event.preventDefault();
  if (event.target.id.startsWith("edit")) {
    const postId = event.target.id.split("__")[1];
    getSinglePost(postId)
      .then(response => {
        showEdit(response);
      })
  }
})
```

```js
const showEdit = (postObj) => {
  const entryElement = document.querySelector(".entryForm");
  entryElement.innerHTML = PostEdit(postObj);
}
```

## Edit Form
We need to create an edit form. This component will look just like the `PostEntry` except the function will accept a post object. We can use the properties of the object to populate the input values. We can also hold on to values in `hidden` fields.

> scripts/feed/PostEdit.js
```js
export const PostEdit = (postObj) => {
	return `
	<div class="newPost">
	<h3>Edit This Post</h3>
		<div>
			<input value="${postObj.title}"
				   name="postTitle"
				   class="newPost__input"
				   type="text"
				   placeholder="Title" />
		</div>
		<div>
			<input value="${postObj.imageURL}"
				   name="postURL"
				   class="newPost__input"
				   type="text"
				   placeholder="URL of gif" />
		</div>

    	<textarea name="postDescription"
    	class="newPost__input newPost__description"
    	placeholder="Story behind your gif...">${postObj.description}</textarea>
		
		<input type="hidden" value="${postObj.id}" name="postId">
		<input type="hidden" value="${postObj.timestamp}" name="postTime">	
		<button id="updatePost__${postObj.id}">Update</button>
		<button id="newPost__cancel">Cancel</button>
	</div>
	`
}
```

## Update Button
Add the eventListener for when the update button is clicked. This combines MANY of the concepts we have covered.
* Target the DOM with querySelector
* Create an object with properties and values
* Return the user stored in DataManager and
* Target the users id property
* Parse number strings into numbers
* Update data and then request and display new data
* Import modules

> scripts/main.js

```js
applicationElement.addEventListener("click", event => {
  event.preventDefault();
  if (event.target.id.startsWith("updatePost")) {
    const postId = event.target.id.split("__")[1];
    //collect all the details into an object
    const title = document.querySelector("input[name='postTitle']").value
    const url = document.querySelector("input[name='postURL']").value
    const description = document.querySelector("textarea[name='postDescription']").value
    const timestamp = document.querySelector("input[name='postTime']").value
    
    const postObject = {
      title: title,
      imageURL: url,
      description: description,
      userId: getLoggedInUser().id,
      timestamp: parseInt(timestamp),
      id: parseInt(postId)
    }
    
    updatePost(postObject)
      .then(response => {
        showPostList();
      })
  }
})
```

Once a post has been updated, how can you display the `PostEntry` module again?

### <h3 id="DJ-Practice">Practice - Journal Edit</h3>
Add edit abilities to your journal entries. One of the challenges will be to have the option select display the current mood. There are a few ways you can accomplish this including: dynamically create option menu or setAttribute. 

### Bonus Challenge #1
When a user clicks on the cancel button, have the edit form go away and replace it with the new post form.

### Bonus Challenge #2
Refactor the PostEntry component to be used for both a new post and to edit a post. Consider: What are the differences between the two? How can you determine which state the form should display?