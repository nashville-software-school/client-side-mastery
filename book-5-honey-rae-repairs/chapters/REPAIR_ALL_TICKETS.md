# List all the tickets
In this chapter you will begin modularizing your code by creating a `services` directory for interacting with the API and you will learn how to use the `useEffect` hook.

## Watch Video
Watch the video and implement the code yourself. Then read the rest of the chapter summarizing what you've learned.
> VF-TODO: Record video and paste link here

## The services module
There are many ways to structure your code, and React leaves the choice of file organization to you. However, it's important to keep your code organized and maintainable. For this project, we'll adopt a practice of centralizing our `fetch` call functions within a services module. These functions will be divided into separate files for each resource. As we continue to build this application, you'll see why this choice was necessary to maintain a clean, organized codebase.

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

  return // JSX for the tickets
}
```


### Watching for State Change

## useState Initial Value
## The `Key` Prop


## Vocabulary
> **useEffect:**

> **Dependency Array:** 

> **Initial Render:**