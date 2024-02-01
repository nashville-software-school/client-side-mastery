# Listing The Customers
In this chapter you will create a new component for listing the customers.

## 📺 Watch The Video

### ⚠️ Note on the video: 
This video instructs you to make the file `components/customers/CustomerList.js`. Make sure your file ends in `.jsx` instead of `.js`.

Watch the [Customer List](https://youtu.be/JijX33KjDP4?si=Rj_Pp6-twBP4weVf) video and implement the code yourself. Then read the rest of the chapter summarizing what you've learned.

### 🔸🔻🔹 CSS for this chapter
<details>
  <summary>Customers.css</summary>

  ```css
    .customers {
      display: flex;
      flex-direction: row;
      flex-wrap: wrap;
      justify-content: space-between;
      margin: 3rem;
    }

    .customers > * {
      flex-basis: 31%;
      margin: 0.5rem;
    }
  ```
</details>

<details>
  <summary>User.css</summary>

  ```css
    .user {
      background-color: var(--white);
      border: 1px solid var(--outline);
      border-radius: 0.5rem;
      padding: 1rem;
    }

    .user-info {
      color: var(--info);
      font-family: "Roboto", sans-serif;
    }
  ```
</details>

## 🎓 Recap Time!
We've reached the end of our learning objectives for parts _one_ and _two_ of this book. In the next chapter, you will implement the `EmployeesList` component on your own. Take some time to review what you've learned so far. Go back and reread the chapters and dig into the code for any of the concepts below if you need more practice. ***Don't be afraid to break something!***

### JSX
JSX allows us to write HTML elements in JavaScript and place them in the DOM without any `Document.querySelector` and appending to the `innerHTML` property.

>For more information on JSX, revisit the [Your First Component](./REPAIR_FIRST_COMPONENT.md#component-structure-and-jsx) chapter.

### useState
The `useState` hook allows you to add and manage state in a functional component. It takes one argument: the initial value for our state. It returns an array with two values: the current value of the state and a function to update it.

>For more information on how `useState` works, revisit the [Your First Component](./REPAIR_FIRST_COMPONENT.md#state-changed) chapter.

### Destructuring
The destructuring assignment syntax is a JavaScript expression that makes it possible to unpack values from arrays, or properties from objects, into distinct variables.

>For more information on how destructuring works, revisit the [mdn web docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment). _That "Try it" box is interactive and a great way to learn._

### useEffect
The `useEffect` hook will run a function when, and _only_ when we tell it to. It takes two arguments: the function we want to run and an array. 

>For more information on how `useEffect` works, revisit the [List All Tickets](./REPAIR_ALL_TICKETS.md#useeffect) chapter.

### Event Handling
Listening for events in React is easy peasy. You can just add the event right on the element you want to listen to!
The two events we've written so far are `onClick` for a button and `onChange` for a text input.

>For more information on event handling, revisit the [Your First Component](./REPAIR_FIRST_COMPONENT.md#event-listener) chapter.

### Optional Chaining
The `?.` operator is like the `.` chaining operator, except that instead of causing an error if a reference is `null` or `undefined`, the expression short-circuits with a return value of `undefined.` This is very helpful if our state that were displaying in our JSX contains nested objects but the initial value is an empty object. 

```javascript
export const SomeComponent = () => {
  const [book, setBook] = useState({}) // on the initial render the value of book will be {}

  // fetch book from some database

  return (
    <div>
      <div>Title: {book.title}</div> {/* Doesn't cause problems */}
      <div>Author: {book.author?.name}</div> {/* Would cause problems if not for ?. */}
    </>
  )
}
```

### Ternary Statements
A ternary statement is syntactical shorthand for a simple `if/else` block. 

```javascript
  let answer

  if (condition) {
    answer = 'yes'
  } else {
    answer = 'no'
  }
```
turns to 
```javascript
  let answer = condition ? 'yes' : 'no'
```

It is possible to write nested ternaries. Don't do it. It's like taking the muffler off your vehicle and driving through a neighborhood at 11pm. No one is impressed and they're all just mad that you've woken up their kids. 

### Rendering Components
Rendering a component is like invoking a function. Components return HTML, therefore we render our components where we want that html to go. The syntax for rendering a component is:

```jsx
export const ParentComponent = () => {
  return (
    <>
      <h1>Some Header</h2>
      <ChildComponent />
      <footer>Some Footer</footer>
    <>
  )
}
```

>For more information about rendering components, revisit the [Ticket Assignee](./REPAIR_TICKET_ASSIGNEE.md#rendering-the-ticketlist-component) chapter

### Props
Props are arguments passed into a React component. When a child component needs access to state from a parent component, you can pass props to the child component.

```jsx
export const ParentComponent = () => {
  const [state, setState] = useState({})

  return (
    <>
      <h1>Some Header</h2>
      <ChildComponent state={state}/>
      <footer>Some Footer</footer>
    <>
  )
}
```

>For more information for how props work, revisit the [Ticket Assignee](./REPAIR_TICKET_ASSIGNEE.md#props) chapter.

Up Next: [Listing the Employees](./REPAIR_EMPLOYEE_LIST.md)