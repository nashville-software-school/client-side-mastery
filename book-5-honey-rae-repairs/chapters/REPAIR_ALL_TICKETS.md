# List all the tickets
In this chapter you will begin modularizing your code by creating a `services` directory for interacting with the API and you will learn how to use the `useEffect` hook.

## 📺 Watch The Video
Watch the [All Tickets](https://youtu.be/hoaH8RQjQBo) video and implement the code yourself. Then read the rest of the chapter summarizing what you've learned.

### 🔸🔻🔹 CSS for this chapter
<details>
  <summary>App.css</summary>

  ```css
    .tickets {
      display: flex;
      flex-direction: column;
    }

    .tickets-container {
      margin: 1rem 5rem 0rem 5rem;
    }

    .tickets-container > h2 {
      margin-top: 0;
    }

    .ticket {
      background-color: var(--white);
      border: 1px solid var(--outline);
      margin: 0.5rem 0;
      border-radius: 0.5rem;
      padding: 0.5rem;
    }

    /* This targets all the child elements of the element with the .ticket class */
    .ticket > * {
      padding: 0.5rem;
    }

    .ticket-info {
      color: var(--outline);
      font-family: "Roboto", sans-serif;
    }

    /* This targets any footer element that is a child of an element with the .ticket class */
    .ticket > footer {
      display: flex;
      border-top: 1px solid var(--outline);
      align-items: center;
      justify-content: space-between;
    }

    /* This targets any element that is a child of a footer that is a child of an element with the .ticket class */
    .ticket > footer > * {
      flex-basis: 22%;
    }

    .filter-btn {
      margin-right: 2rem;
    }
  ```
</details>

## The services module
There are many ways to structure your code, and React leaves the choice of file organization to you. However, it's important to keep your code organized and maintainable. For this project, we'll adopt a practice of centralizing our `fetch` call functions within a services module. These functions will be divided into separate files for each resource. As we continue to build this application, you'll see why this choice was necessary to maintain a clean, organized codebase.

## useState Initial Value
In the video we saw what happens when we _don't_ set an initial value for our state variable. 

```javascript
export const App = () => {
  const [allTickets, setAllTickets] = useState()
  
  // useEffect to fetch tickets and set to allTickets on initial render

  return (
    <article className="tickets">
      {allTickets.map(ticket => {
        return // JSX for a ticket
      })}
    </article>
  )
}
```

During the initial render of a component, the state is assigned its initial value. In our example, since no initial value is provided for `allTickets`, our code breaks with this error: 

```sh
Uncaught TypeError: Cannot read properties of undefined (reading 'map')
```

Since we did not give an initial value for `allTickets`, the initial value is `undefined`. Therefore, on the initial render of this component, `.map()` is called on `undefined`, which is a big no-no. To fix this, we give the `allTickets` state an initial value of an empty array. This is necessary because, in our JSX, we assume that `allTickets` will always be an array when displaying it.

## The `Key` Prop
Another issue we encountered was this warning message:

```sh
Warning: Each child in a list should have a unique "key" prop.
```

When mapping an array in JSX, React wants some way to uniquely identify each element. It asks you to provide a `key` prop to each item returned within your `map`.

```javascript
return (
  return (
    <article className="tickets">
      {allTickets.map(ticket => {
        return (
          <section className="ticket" key={ticket.id}>
            // ticket details
          </section>
        )
      })}
    </article>
  )
)
```

The `key` prop value for each ticket should be its unique identifier, in this case, its id. _Be sure to add the `key` prop to the parent element._ 
## useEffect
### The Anatomy of useEffect
It's easy to be intimidated by `useEffect`, but it's just more Javascript! Remember that `useEffect` is a hook, which is a function provided by the React library enabling us to harness the state and lifecycle capabilities of components.

Let's dive into useEffect once more:
```javascript
useEffect(() => {}, [])
```

Looking at this we can see that `useEffect` is a function that takes two arguments: A function and an array.

The function is _what_ we want to happen, and the array is _when_ we want it to happen. This function is referred to as a _callback function_, where it's passed as an argument to another function and invoked within it to perform a specific task. You've used callback functions before with `addEventListener()`. The array is known as the dependency array, dictating when the function runs based on changes in the values within the array. With one exception:

### Initial Rendering
In Chapter 2, you learned that invoking the state's setter function triggers a component rerender. However, when calling this function at the component level, it gets triggered during each render leading to excessive rerenders and an infinite loop. You saw this happen in the video with the code below: 

```javascript
export const App = () => {
  const [allTickets, setAllTickets] = useState([])

  getAllTickets().then(ticketsArr => {
    setAllTickets(ticketsArr)
  })

  return // JSX to display allTickets
}
```

In order to prevent this from happening, we can use `useEffect` to run this code _**only** on the initial render_ of the component. To do this, we pass an **empty** dependency array to the `useEffect`. This tells the `useEffect`, "Only run this function on the **initial render** of this component."

```javascript
export const App = () => {
  const [allTickets, setAllTickets] = useState([])

  useEffect(() => {
    getAllTickets().then(ticketsArr => {
      setAllTickets(ticketsArr)
    })
  }, []) // When the dependency array is empty, the useEffect is only watching for the initial render of this component.

  return // JSX to display allTickets
}
```

### Watching for State Change
Now, when we include a state variable in the dependency array, the `useEffect` callback function gets executed on **two occasions**. First, on the initial render of the component, and second, whenever the state variable is updated.

```javascript
export const App = () => {
  const [allTickets, setAllTickets] = useState([])
  const [showEmergency, setShowEmergency] = useState(false)
  const [filteredTickets, setFilteredTickets] = useState([])

  // useEffect to fetch tickets and set to allTickets on initial render

  useEffect(() => {
    if (showEmergency) {
      const emergencyTickets = allTickets.filter(
        (ticket) => ticket.emergency === true
      )
      setFilteredTickets(emergencyTickets)
    } else {
      setFilteredTickets(allTickets)
    }
  }, [showEmergency]) // When the dependency contains a state variable, the useEffect is watching for any time the value of that variable changes.

  return // JSX to display emergency toggle buttons and filteredTickets
}
```

Here we added a useEffect to watch for any time the value of `showEmergency` changes. If the value of `showEmergency` changes, the callback function executes. That being said, take a closer look at the code. There's a potential bug here that we witnessed and fixed in the video. Considering this callback function runs on **two** occasions, the first being on the initial render of the component, what issue does this pose for our `filteredTickets` on the initial render? **Hint:** The _initial_ value for `allTickets` is an empty array.

<details>
  <summary>See Answer Below</summary>

  During the initial render of our component, the state variables contain the initial value passed to the `useState` hook. Therefore, the first time the above `useEffect` runs _(during the initial render of the component)_, the value of `allTickets` is an empty array. So when we use `setFilteredTickets` to assign the value of `allTickets`, it's set to an empty array.
</details>

### Watching for multiple state changes
The solution to this problem is to listen for both `showEmergency` _and_ `allTickets` in our `useEffect`. 

```javascript
export const App = () => {
  const [allTickets, setAllTickets] = useState([])
  const [showEmergency, setShowEmergency] = useState(false)
  const [filteredTickets, setFilteredTickets] = useState([])

  // useEffect to fetch tickets and set to allTickets on initial render

  useEffect(() => {
    if (showEmergency) {
      const emergencyTickets = allTickets.filter(
        (ticket) => ticket.emergency === true
      )
      setFilteredTickets(emergencyTickets)
    } else {
      setFilteredTickets(allTickets)
    }
  }, [showEmergency, allTickets]) // When the dependency contains multiple state variables, the useEffect is watching for any time any of the values change.

  return // JSX to display emergency toggle buttons and filteredTickets
```

Now, with allTickets included in the dependency array, if the value of `showEmergency` ***or*** `allTickets` changes, the callback function gets executed. Once `allTickets` receives it's value from the api, this useEffect will execute the callback function, setting `filteredTickets` with the populated array from `allTickets`.

That's a lot, I know. But the more you practice, the more sense it will make. Continue progressing through the course and and feel free to revisit this chapter if you need a refresher on how `useEffect` operates.
## 📓 Vocabulary
> **Initial Render:**
The _first_ time a React component renders. On the initial render of a component, the component's state variables contain the initial values passed to useState.

> **useEffect:**
The hook that manages the side-effects in functional components.
It accepts two arguments, a callback function and a dependency array. It can watch for the initial render of the component or for any changes in state.

> **Dependency Array:** 
The second argument passed to the useEffect hook. If the array is empty, the callback function passed to useEffect executes only on the initial render of the component. If the array contains state variables, the callback function will execute anytime the value of the passed state variables change.

> **Callback Function:**
A function passed as an argument to another function to be later executed.

Up Next: [Introducing Chuckle Checklist](./CHUCKLE_SETUP.md)