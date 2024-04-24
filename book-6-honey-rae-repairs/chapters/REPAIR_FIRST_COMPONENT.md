# Writing Your First React Component
In this chapter you will learn how to write a basic React functional component, write with the `JSX` syntax, and utilize the `useState` hook. 

## 📺 Watch The Video
### ⚠️ Important note on the videos: 
These videos were recorded before a change to the course. There will be a few differences between your project and the one in the video: 
1. Your javascript files will end in `.jsx` instead of `.js`. 
2. Your `index.html` is in the root of the project instead of in a `public` folder.
3. You have `main.jsx` instead of `index.jsx`
4. Lastly you have two more files in your root that are not in the video: `.eslintrc.cjs` and `vite.config.js`. You will not need to modify or do anything with these.

Keep these differences in mind as you follow along in this course.

Watch the [First Component](https://youtu.be/-WMvlULvBeU) video and implement the code yourself. Then read the rest of the chapter summarizing what you've learned.
 
## Component Structure and JSX
You've been writing React-like components in vanilla JS, you just didn't know it! Take this code from _Tour Some Sugar On Me_ for example:
```javascript
export const VenuesList = () => {
    const venues = getVenues()

    let html = `
      <ul>
        ${
          venues.map(venue => {
            return `
              <li data-type="venue" 
                data-id="${venue.id}" 
                data-name="${venue.name}" 
                class="venue">${venue.name}
              </li>`
          }).join("")
        }
      </ul>`
    return html
}
```

Here we've written a function that takes some data, `venues`, and converts it into an html string and then returns that html string. Later we invoke this function and render the returned html string in the DOM.

Here's how this code might look as a React functional component:
```jsx
export const VenuesList = () => {
    const [venues, setVenues] = useState([])
    
    /*
      Get the venues and set them using setState
      (We'll cover this in a later chapter)
    */

    return (
      <ul>
        {venues.map(venue => {
          return (
            <li className="venue" key={venue.id}>
              {venue.name}
            </li>
          )
        })}
      </ul>
    )
}
```

See? React is just Javascript. Just some new, slightly different syntax and much faster to implement! Notice how we don't have to add the `.join("")` to the end our `.map()` method. That's because with JSX we don't have to convert that returned array to a string!

> Don't worry about trying to understand every bit of the code above, we'll continue to draw comparisons between what we already know and what we're learning in later chapters. 
> 
## Event listener
React makes it easy to listen to user-triggered events.
In the video, you saw an event listener added right on the element!
In vanilla JS we would have had to write something like this:
```javascript
document.addEventListener('click', (event) => {
  const itemClicked = event.target

  if (itemClicked.dataset.type === "button") {
    console.log("Clicked!")
  }
})

export const App = () => {
  return `<button data-type="button">Click me!</button>
}
```

But in React, we can add the `onClick` right on the element. All we need to do is give the `onClick` the function we want to run.
```jsx
export const App = () => {

  const handleBtnClick = () => {
    console.log("Clicked!")
  };

  return (
      <button onClick={handleBtnClick}>Click me!</button>
  );
}
```

_Goodbye addEventListener!_

Instead of predefining a function, we could just give our `onClick` an anonymous function like so:

```javascript
export const App = () => {

  return (
      <button onClick={() => { console.log("Clicked!") })}>Click me!</button>
  );
}
``` 

For functions that are single, small operations such as only setting state, an anonymous function works fine. But if your function is multiple lines of code, it's much cleaner to define a function instead in order to keep our JSX readable and tidy.

## State Changed
Remember back in Book 4 when the state changed? Think about the times when the user placed a new order or saved a submission, and you had to dispatch a custom event to notify your application about it. Afterward, you had to write an event listener for that custom event, allowing you to update your HTML with the new state. 

That's where the magic of the `useState` hook comes in. When it comes to defining and managing state within our components, `useState` streamlines the process.

```javascript
const [count, setCount] = useState(0) // returns [value, setValueFunction]
```

With `useState`, all we need to do is declare our state using the hook. The `useState` function takes a single argument: the initial value we want for our state variable. It then returns an array that we destructure into two parts: our state variable and a function to update that state variable.

When we want to display our state within the JSX, we simply wrap it with curly braces:
```javascript
return (
  <div>Count: {count}</div>
)
```

Now, here's the exciting part. In vanilla JavaScript, whenever we changed the value of state, we'd have to dispatch an event to signal the state change, set up an event listener to catch that event, and then pass a function to update our HTML. However, the `useState` hook provides us with a more elegant solution. When we use the function provided by `useState` to update our state, React automatically detects the state change behind the scenes. As a result, React takes care of re-rendering our component for us!

In essence, `useState` simplifies and streamlines the way we handle state changes, making our components more efficient and our code more readable.


## 📓 Vocabulary
> **React Components:**  Independent and reusable blocks of code. They serve the same purpose as JavaScript functions, but work in isolation and return HTML.

> **JSX:** A JavaScript syntax extension that enables you to write HTML-like markup within a JavaScript file.

> **Fragment:** Used via `<>...</>` syntax, lets you group elements without a wrapper node. It has no effect on the resulting DOM; it is the same as if the elements were not grouped. 

> **React Hooks:** Functions provided by the React library (prefixed with "use") that allow you to "hook" into state and lifecycle features of components.

> **useState:** A crucial React Hook that empowers you to introduce state to a component. It takes an initial value as its argument and returns an array. This array contains the state value (index 0) and a function (index 1) to modify that state.

Up Next: [Setting up the API](./REPAIR_API.md)