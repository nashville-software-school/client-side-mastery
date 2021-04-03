# React Props and State

Inside of components, make another file `PropsAndState.js`.


## Props
Pass your name into a component and display it.

> components/PropsAndState.js
```
import React, from "react"

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
```
//--------
 <PropsAndState yourName={"Brenda"} />
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

Within the **StateAndProps** component, we will define state and a function to update state with the `useState` hook. We will also create a function `to handleClick`.

> PropsAndState.js - updated
```
import React, { useState } from "react"

export const PropsAndState = ({ yourName }) => {
  let [countClicks, setCountClicks] = useState(0)

  const handleClick = () => {
    //good practice:
    //make a copy of state, modifiy it, and then setState to the copy
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




