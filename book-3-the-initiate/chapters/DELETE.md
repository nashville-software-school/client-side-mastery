# Deleting Your Data

So far, we've learned how to POST new data to our json-server database and GET data from our json-server database. Today we're going to talk about DELETE functionality.

Let's revisit our application for registering lego creations. At this point, we can add new lego creations to our database and print them all to the DOM. Imagine we have the following lego creation in our database:
```json
{
  "id": "1",
  "creator": "Emily Lemmon",
  "shape": "Boat",
  "creation": "Evil Ghost Pirate Ship"
}
```
We might represent it to our users with a DOM component that looks like this:

```html
<section>
  <h3> Evil Ghost Pirate Ship </h3>
  <p>Boat</p>
  <p>Emily Lemmon</p>
  <button class="edit-btn" id="edit-1">Edit</button>
  <buton class="delete-btn" id="delete-1">Delete</button>
</section>

```
There are two important things to keep in mind here:
1. The DOM component above is generated with JavaScript. It's not hard coded into our HTML file.
1. We gave each button a unique id that corresponds to the entry's id in the database. This is going to come in handy later.

## Deleting Data
First, let's add an event listener to our delete button. Because this DOM component was generated with JavaScript, we'll have to add our event listener to one of its parent elements that *wasn't* dynamically generated with JavaScript. In other words, find the closest parent element that's hard coded into your HTML file.

```js
// Add the event listener to the entire body element
document.querySelector("body").addEventListener("click", () => {

  // Check to see if the user clicked on something with a class of delete-btn
  if(event.target.classList.contains("delete-btn")){
    console.log(event.target.id); // in our example, this will be "delete-1"
    console.log(event.target.id.split("-")); // ["delete", "1"]
    console.log(event.target.id.split("-")[1]) // "1"

    // Hooray! We've used event.target to figure out which button we clicked on, and we used the .split() method to get the id of our lego creation that matches its id in the database
  }
})
```

Now we can use fetch to delete just that item in the database.

```js
  fetch(`http://localhost:8088/legos/${idToDelete}`,{
        method: "DELETE"
  }).then(() => {
    // get all the legos again to "refresh" the list
  })

```

## Practice: Delete
1. Revisit your HR application from the User Input chapter.
1. Add a delete button to your employee DOM component.
1. When the user clicks the delete button beside an employee's DOM component, that employee should be deleted from the database and the DOM

## Challenge: Are You Sure?
*Remember that challenges require Googling and should only be attempted if you're comfortable with everything we've done so far.*
1. Refactor your application so that, when the user clicks the delete button, a modal appears that asks the user if they're sure they want to delete that employee. If the user clicks yes, the employee should be deleted from the database. If they click no, they should be taken back to the main page.
