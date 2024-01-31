# Ticket Assignee
In this chapter you will learn how to render a React component, pass props, use optional chaining, and write ternary statements.

## 📺 Watch The Video

### ⚠️ Note on the video: 
This video instructs you to make the files `components/Ticket.js` and `components/TicketList.js`. Make sure your files end in `.jsx` instead of `.js`.

Watch the [Ticket Assignee](https://youtu.be/8s4TQdJ3EBk) video and implement the code yourself. Then read the rest of the chapter summarizing what you've learned.

## Rendering the TicketList component
Breaking our code into components to later be rendered as part of one large whole is nothing new to us. Take this code from DeShawn's Dog Walking: 

```javascript 
const applicationHTML = `
  <h1>DeShawn's Dog Walking</h1>
  <article class="details">
      <section class="detail--column list details__cities">
          <h2>Cities with Service</h2>
          ${CityList()}
      </section>
      <section class="detail--column list details__cities">
          <h2>Walkers</h2>
          ${Walkers()}
      </section>
      <section class="detail--column list details__cities">
          <h2>Pets</h2>
          ${RegisteredPets()}
      </section>
  </article>

  <article class="assignments">
      <h2>Current Assignments</h2>
      ${Assignments()}
  </article>
`
```

Here we have four functions that return some html. We're invoking those functions in our main.js module to build the entire html for our application. 

Here's how this code might look in React:

```jsx
export const App = () => {
  
  return (
    <h1>DeShawn's Dog Walking</h1>
    <article class="details">
      <section class="detail--column list details__cities">
          <h2>Cities with Service</h2>
          <CityList />
      </section>
      <section class="detail--column list details__cities">
          <h2>Walkers</h2>
          <Walkers />
      </section>
      <section class="detail--column list details__cities">
          <h2>Pets</h2>
          <RegisteredPets />
      </section>
    </article>

    <article class="assignments">
        <h2>Current Assignments</h2>
        <Assignments />
    </article>
) 
}
```

Just like our components in earlier books of the course, React components are functions that return html markup. The syntax to render them is just a little different. 

```javascript
${CityList()}
```
_vs_
```jsx
<CityList />
```

## Props
Props are arguments passed into a React component. When we have a child component that needs access to state managed in the parent component, we can pass that state as props. 

>_Props_ stands for _properties_ which refers to the properties of an object. 

When we pass props to a component, we are passing key/value pairs on an object. In the video, you saw this with the `Ticket` component. 

```jsx
  <Ticket ticket={ticketObj} />
```

Here we are passing the prop, `ticket`, to our component. This is just adding a key value pair to our props object that we can access in our component, 
the key being `ticket` and the value being whatever the value of `ticketObj` is. Now we can destructure that props object in the `Ticket` component to have access to the `ticket` property.

```jsx
export const Ticket = ({ ticket }) => {
  return (
    <div>{ticket.description}</div>
  )
```

 We could easily access the `ticket` prop by using dot notation.

```jsx
export const Ticket = (props) => {
  return (
    <div>{props.ticket.description}</div>
  )
}
```

But why would we do that when destructuring is _so much_ cooler? 

Destructuring is not new with React, though we do use it with destructuring our props object and useState. You can do this in vanilla js, and it's likely you have! Just another example of how React is _just_ Javascript!

## 🧭 📺 Explorer Video _(optional)_
If you're feeling comfortable with what we've learned so far and would like to see an alternative solution to what we did in this chapter, watch [this video](https://youtu.be/Sq4CzHMLXTk?si=_PKOdYncLfGx-hHa)! 
>_This is optional and the solution in this video will not be used in the rest of this walkthrough of Honey Rae Repairs._

## 📓 Vocabulary
>**Render a component:** To invoke a React component in JSX, like calling a function, resulting in its display within the rendered user interface.

>**Props:** Arguments passed to a React component in the form of an object.

>**Optional Chaining:** An operator that accesses an object's property. If the object accessed using this operator is `undefined` or `null`, the expression stops and evaluates to undefined instead of throwing an error.

>**Ternary Operator:** An operator that provides a way to shorten a _simple_ if else block. The `if` condition is on the left of the `?`. If the condition evaluates to `true`, the statement after the `?` is executed. If the condition evaluates to false, the statement after the `:` is executed.

Up Next: [Searching the tickets](./REPAIR_SEARCH_TICKETS.md)