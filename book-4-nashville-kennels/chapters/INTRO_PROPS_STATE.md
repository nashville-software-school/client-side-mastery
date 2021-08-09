# React Props and State

### Voacabulary to learn
* React props
* React state

Inside of the `components` directory, make another file `PropsAndState.js`.


## Props
Pass your name into a component and display it.

> PropsAndState.js
```jsx
import React from "react"

export const PropsAndState = ({ yourName }) => {

  return (
    <>
      <h3>Welcome, {yourName} </h3>
    </>
  )
}
```
Display this component from the *Kennel* component and pass in your name. Don't forget to import.

> Kennel.js
```jsx
//--------
 <PropsAndState yourName="Brenda" />
  <h2>Animals</h2>
  <article className="animals">
    <AnimalCard />
    <AnimalCard />
    <AnimalCard />
  </article>
//-------
```



## React State
> **Definition:** `useState()` is what the React team calls a hook. It is used to store data about the component. You can translate its usage into English with the following statement.
>
> "My component has its own state to maintain. Therefore, I will use the State hook to store it."

**Every time state is updated, the component will re-render.** (Say that one more time)

#### Goal: Display how many times a button has been clicked.

Within the **PropsAndState** component, we will define state and a function to update state with the `useState` hook. We will also create a function to `handleClick`.

> PropsAndState.js - updated
```jsx
import React, { useState } from "react"

export const PropsAndState = ({ yourName }) => {
  let [countClicks, setCountClicks] = useState(0)

  const handleClick = () => {
    //good practice:
    //make a copy of state, modify it, and then setState to the copy
    const newCountClicks = ++countClicks
    setCountClicks(newCountClicks)
  }

  return (
    <>
      <h3>Welcome, {yourName} </h3>
      <p>{countClicks}</p>
      <button onClick={(handleClick)}>Click Me</button>
    </>
  )
}
```
