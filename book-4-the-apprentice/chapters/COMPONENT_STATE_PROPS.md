# React Component State and Props

In this chapter, you are going to make your application dynamic. In React, data can be passed to components. This is similar to passing arguments to functions, yet different.

## State in React Applications

State is the current values of the properties used to render a component. Your brain will try to make it more complex than that, so remember this statement.

> State is the current values of the properties used to render a component.

Think of a component as a template waiting for data to be passed in and then displayed. A single component can be made up of several smaller components.

State is initialized by defining `state` at the top of a class definition and then it is automatically included in the construction of the component. Currently, our **`<AnimalList />`** has the state of animals defined as an empty array. Once we get the data from the API we invoke `setState()` with the animal data. This will change the state and **Each time `state` changes, the `render()` method of that component runs.**

### A Few Rules for state and props
* State is passed to children components as props (properties).
* Props are read only.
* State can only be changed via the `setState()` function in the component that owns state.
* `setState()` automatically invokes the render method.


Now we want to use the new data to populate our animal cards. We pass the data to the **`<AnimalCard />`** with **props**.

Change the render method of the **`AnimalList`** component:

> AnimalList.js
```js
render(){
  console.log("AnimalList: Render");

  return(
    <div className="container-cards">
      {this.state.animals.map(animal =>
        <AnimalCard key={animal.id} animal={animal} />
      )}
    </div>
  )
}
```

**What is the key?** Each child in a list should have a unique "key" prop. This is how React keeps track of re-rendering only the things that have changed.

**What is happening?** Using the array method `map`, for each item/animal in the array animals, return an **`<AnimalCard />`** with a reference to the single item/animal. This reference is now a property on the **`<AnimalCard />`** and is referred to as `props`.

Because **`<AnimalCard />`** is included in the render method of **`<AnimalList />`**, it is a  _child component_ of the **`<AnimalList />`** component.

* Use the Chrome React Developer tool and inspect the **`<AnimalCard />`** component. You will notice that each card has `props` for one animal.

Modify the **`<AnimalCard />`** render method to display the props using dot notation.

```js
render() {
  return (
    <div className="card">
        <div className="card-content">
          <picture>
            <img src={require('./dog.svg')} alt="My Dog" />
          </picture>
          <h2>Name: <span className="card-petname">{this.props.animal.name}</span></h2>
          <p>Breed: {this.props.animal.breed}</p>
        </div>
    </div>
  );
}

```

Create a CSS file for Animal:

```sh
touch components/animal/Animal.css
```

> components/animal/Animal.css

```css
.card {
  /* Add shadows to create the "card" effect */
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  border-radius: 5px; /* 5px rounded corners */
  background: aliceblue;
  margin-bottom: 2em;
  flex: 0 1 24%;
}

.card-content {
  padding: .5em;
}

.card-content h3 {
  margin-top: 0;
  margin-bottom: .5em;
  font-weight: bold;
  color: rgb(43, 112, 241);
}

.card-content p {
  font-size: 80%;
  color: darkslategrey;
}

.content-petname {
  color: darkslategrey;
}

.card button {
  background-color: cornflowerblue;
  border: none;
  color: cornsilk;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  padding: .5em;
  border-radius: 2px;
  margin: .1em;
  width: 100%;
}

.card button:hover {
  background-color: darkblue;
}
```

Note: you will import this CSS file directly into the AnimalCard component. Good practice would be to only import CSS that applies to the JSX elements of this component.

## Passing State to a Child Component

![](./images/state-propagation-visual.png)



## Expressing State as HTML

An important aspect of understanding why React works the way it does is to realize that its core mechanism is to **_express state as HTML_**.

Gone are the days of using Vanilla JavaScript or jQuery to directly manipulate your DOM. You should never write an `appendChild()`, or `document.querySelector("#foo").innerHTML = ""` in your code.

State is at the core of React. It drives everything, including the HTML representation of that state via JSX. If you want to change the DOM that is displayed to your customer, you **change the state of the component**.

To change `state`, you _must_ use `this.setState()`, and that method, in turn, invokes the `render()` method. **Changing state is the only way to modify the DOM.**

* If you remove an item from a collection(array) in state, then that element will not be rendered.
* If you add an item to a collection in state, then it will be rendered.
* If you modify an object that is used in your JSX, then it will change when the component is re-rendered.


---

## Practice Exercise - Displaying Data

Update your application so that each section (locations, employees, owners) displays a list of cards with the API data.
