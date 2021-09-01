# String Methods

Just like arrays, JavaScript has methods built in to handle manipulating strings.

## Learning Objectives
You should be able to:

* identify a string datatype
* apply methods to a string (#split #toUpperCase #startsWith)
* add eventListeners that target unique elements

### Add a unique identifier to a post

Add an edit button to the post component. While building the html, we can add the post id to the button. 

```js
export const Post = (postObject) => {
    return `
      <section class="post">
        <header>
            <h2 class="post__title">${postObject.title}</h2>
        </header>
        <img class="post__image" src="${postObject.imageURL}" />
        <div><button id="edit--${postObject.id}">Edit</button></div>
      </section>
    `
}

```

### Add an eventListener targeting each post
Using event bubbling, add an eventListener for the edit button. We can target the button specifically with `startsWith()` method. Using the `split()` method we can determine the post id.

> main.js
```js
applicationElement.addEventListener("click", (event) => {
	
	if (event.target.id.startsWith("edit")){
		console.log("post clicked", event.target.id.split("--"))
		console.log("the id is", event.target.id.split("--")[1])
	}
})

```


## <h3 id="Giffy-Practice">Practice String Methods</h3>
[W3 Schools String Methods Tutorial](https://www.w3schools.com/js/js_string_methods.asp)

At the bottom of the page is an opportunity to test yourself with exercises. Give a shot.

## <h3 id="DJ-Practice">Practice: Journal Targeted EventListeners</h3>
Give each entry in your journal a unique identifier. Add a click eventListener that produces a message notifying you which entry item was selected. 