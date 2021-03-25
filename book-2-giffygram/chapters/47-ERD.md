# Many to Many

There are times where two sets of data have a more complex relationship than a simple 1 -> &infin;. Let's look at an example where the two entities operate independently of each other, but one can contain many of the other.

Imagine you are defining a database for a family's chore list. Here's a list of chores.

1. Paint the garage
1. Take out the trash
1. Do the laundry
1. Clean the bedrooms
1. Family game night
1. Feed the dog

There are also many family members.

1. Dad
1. Mom
1. Sarah
1. Blake
1. Sophia
1. Michael

> #### `database.json`

```json
{
    "familyMembers": [
        { "id": 1, "name": "Mom" },
        { "id": 2, "name": "Dad" },
        { "id": 3, "name": "Sarah" },
        { "id": 4, "name": "Blake" },
        { "id": 5, "name": "Sophia" },
        { "id": 6, "name": "Michael" }
    ],
    "chores": [
        { "id": 1, "task": "Paint Garage" },
        { "id": 2, "task": "Take out the trash" },
        { "id": 3, "task": "Do the laundry" },
        { "id": 4, "task": "Clean the bedrooms" },
        { "id": 5, "task": "Family game night" },
        { "id": 6, "task": "Feed the dog" }
    ]
}
```


Now, some of the tasks are 1-person jobs, like taking out the trash. Other tasks require more than one person, such as family game night, or painting the garage.

Also, each family member will be assigned more than one task. Dad is responsible for doing the laundry, but also for taking part in family game night.

1. A family member can have many chores
1. Each chore can be assigned to many family members

This is a many-to-many relationship. This will require us to have a data set whose purpose is simply to store those relationships. This allows us maximum flexibility because we can assign any number of family members to a task, and assign any number of tasks to a family member.

The next step is to define an intersection or join table to store the relationships between family members and chores. In this join table below, you can see that mom is assigned to two tasks, and dad is also assigned to two tasks.

You can see that mom and dad are both assigned to the same `taskId` of 5 - which is game night.

You would add the following `familyChores` property to your JSON file.

> #### `database.json`

```json
{
    "familyMembers": [...],
    "chores": [...],
    "familyChores": [
        {
            "id": 1,
            "familyMemberId": 1,
            "choreId": 4
        },
        {
            "id": 2,
            "familyMemberId": 1,
            "choreId": 5
        },
        {
            "id": 3,
            "familyMemberId": 2,
            "choreId": 5
        },
        {
            "id": 4,
            "familyMemberId": 2,
            "choreId": 3
        }
    ]
}
```

The first relationship stores the fact that Mom is going to clean the bedrooms.

The second relationship stores the fact that Mom is going to join family game night.

The third relationship stores the fact that Dad is going to join family game night.

The fourth relationship stores the fact that Dad is going to do the laundry.

## Displaying Likes for GiffyGram Posts

First we need to add a table to the DB for `userLikes`. Each entry in this table will store a `userId` and a `postId`.

```json
"userLikes": [
    {
      "postId": "6",
      "userId": 1,
      "id": 1
    }
]
```

## Like Button
Add a `Like` button to the `Post`. With the button, we will need to keep track of the post `id`.

> scripts/feed/Post.js

```js
<button id="like__${postObject.id}">Like</button>
```


## Like EventListener
Add an eventListener that will collect the postId and userId into an object and then `Post` it to the userLikes table.

> scripts/main.js
```js
applicationElement.addEventListener("click", event => {
	event.preventDefault();
	if (event.target.id.startsWith("like")) {
	  const likeObject = {
		 postId: parseInt(event.target.id.split("__")[1]),
		 userId: getLoggedInUser().id
	  }
	  postLike(likeObject)
		.then(response => {
		  showPostList();
		})
	}
  })
```

Once the data has been updated, we will need to invoke `getPosts` to update the state of our Posts and render an updated content.

> scripts/data/DataManager.js

```js
export const postLike = likeObject => {
	return fetch(`http://localhost:8088/userLikes/`, {
		method: "POST",
		headers: {
			"Content-Type": "application/json"
		},
		body: JSON.stringify(likeObject)
	})
		.then(response => response.json())
		.then(getPosts)
}
```

## Get Likes
We can query this table and request all items with a specific postID to find out the number of likes. Remember, json-server will return an array. 
> scripts/data/DataManager.js
```js
export const getLikes = (postId) => {
  return fetch(`http://localhost:8088/userLikes?postId=${postId}`)
    .then(response => response.json())
}
```

Within each `Post` component, we can invoke the `getLikes` and display the value.

> scripts/posts/Post.js
```js
/// in the return add a place for the likes
 <p id="likes__${postObject.id}">👍 ${getNumberOfLikes(postObject.id)}</p>

```
Since we know the HTML element for `likes` is on the DOM, we can target it in the `getNumberOfLikes` method. 

scripts/posts/Post.js

```js
//this needs to be located above the Post declaration
//this could also be imported to this module
const getNumberOfLikes = (postId) => {
  getLikes(postId)
  .then(response => {
    document.querySelector(`#likes__${postId}`).innerHTML = `👍 ${response.length}`;
  })
}
```


> **ERD Tips:**
>
> **int** = Integer value  (e.g. 2, 81, 2054)
>
> **double** - Double precision floating point number (e.g. 1.414, 3.14159)
>
> **varchar** = Variable length character value
>
> **pk** = Primary key field