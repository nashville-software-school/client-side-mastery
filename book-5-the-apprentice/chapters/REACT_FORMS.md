# Adding Animals with Forms in React

In this chapter, you are going to learn how to use use a form to express the state of a component, and then use a function passed from a parent component to add the animal to the API.

**_Quick Note_:** All of the code you will see from here to the end of this chapter needs to be in place before the feature will work.


## Route for Showing Animal Form

Below is a new route that renders a form for boarding a new animal. The `employees` collection needs to be passed to the form component so that a dropdown list can be populated for the user to choose a caretaker. You also need to update the route for `/animals` so that the `props` argument is passed down to the child component. This sets up the ability to use the very helpful `history.push()` mechanism in the components themselves to change the URL in the browser.

First, update your route with this code.

```jsx
<Route exact path="/animals" render={(props) => {
    return <AnimalList {...props}
                       deleteAnimal={this.deleteAnimal}
                       animals={this.state.animals} />
}} />

// Our shiny new route. We pass employees to the AnimalForm so a dropdown can be populated
<Route path="/animals/new" render={(props) => {
    return <AnimalForm {...props}
                       addAnimal={this.addAnimal}
                       employees={this.state.employees} />
}} />
```

## Button for Admitting a New Animal

Now, update **`AnimalList`** with a button at the top that uses the `history.push()` mechanism to change the URL of the browser. This will only work if you updated your routes correctly from the previous section, because you will need access to the `history` property that exists on the `props` object.

So, what's going on here? Think of the current location as the last item in an array of locations, and we manipulate that array through the `history.push()` method. Most importantly, pushing a location to the array triggers a page transition to that location.

```js
export default class AnimalList extends Component {
    render () {
        return (
            <React.Fragment>
                <div className="animalButton">
                    <button type="button"
                            className="btn btn-success"
                            onClick={() => {
                                this.props.history.push("/animals/new")}
                            }>
                        Admit Animal
                    </button>
                </div>
                <section className="animals">
                {
        ...
```

Update `Animal.css` to center the button.

> Animal.css

```css
.animalButton {
    display: flex;
    justify-content: space-evenly;
    margin: 0 0 10px 0;
}
```

![add animal button](./images/add-animal.png)

## AnimalManager Method for POSTing Animal

Refactor your **`AnimalManager`** module with a `post` method that implements a `fetch()` for adding a new animal object to your API.

```js
post(newAnimal) {
    return fetch(`${remoteURL}/animals`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(newAnimal)
    }).then(data => data.json())
  }
```

## ApplicationViews Method

Since you can't pass the `post()` method from the manager module to a component, you must write a method in **`ApplicationViews`** that implements it. You can then pass this method down to the **`AnimalForm`** component.

```js
addAnimal = (animal) => AnimalManager.post(animal)
  .then(() => AnimalManager.getAll())
  .then(animals => this.setState({
      animals: animals
    })
  )
}
```

## AnimalForm Component

Now it's time to make your **`AnimalForm`** component. Note that the `handleFieldChange()` method will update state every time the user types a character into any field. This is made possible by having each input field's `id` property named exactly as each state property.

It's vital to note that what this creates is a process that allows us to create new data ( the new animal ) based on the current state of the component. We are not pulling data directly from the form imputs and saving that to the database. The React way is to make sure that all data changes flow through state like this, so the UI and state stay in sync.

In state, you see three properties:

1. `animalName`
1. `breed`
1. `employee`

There are three, directly corresponding input fields:

1. `<input id="animalName" ... />`
1. `<input id="breed" ... />`
1. `<select id="employee" ...>`

> components/animal/AnimalForm.js

```js
import React, { Component } from "react"
import "./Animal.css"

class AnimalForm extends Component {
    // Set initial state
    state = {
        animalName: "",
        breed: "",
        employee: ""
    }

    // Update state whenever an input field is edited
    handleFieldChange = evt => {
        const stateToChange = {}
        stateToChange[evt.target.id] = evt.target.value
        this.setState(stateToChange)
    }

    /*
        Local method for validation, creating animal object, and
        invoking the function reference passed from parent component
     */
    constructNewAnimal = evt => {
        evt.preventDefault()
        if (this.state.employee === "") {
            window.alert("Please select a caretaker")
        } else {
            const animal = {
                name: this.state.animalName,
                breed: this.state.breed,
                employeeId: this.props.employees.find(e => e.name === this.state.employee).id
            }

            // Create the animal and redirect user to animal list
            this.props.addAnimal(animal).then(() => this.props.history.push("/animals"))
        }
    }

    render() {
        return (
            <React.Fragment>
                <form className="animalForm">
                    <div className="form-group">
                        <label htmlFor="animalName">Animal name</label>
                        <input type="text" required="true"
                               className="form-control"
                               onChange={this.handleFieldChange}
                               id="animalName"
                               placeholder="Animal name" />
                    </div>
                    <div className="form-group">
                        <label htmlFor="breed">Breed</label>
                        <input type="text" required="true"
                               className="form-control"
                               onChange={this.handleFieldChange}
                               id="breed" placeholder="Breed" />
                    </div>
                    <div className="form-group">
                        <label htmlFor="employee">Assign to caretaker</label>
                        <select defaultValue="" name="employee" id="employee"
                                onChange={this.handleFieldChange}>
                            <option value="">Select an employee</option>
                        {
                            this.props.employees.map(e => <option key={e.id} id={e.id}>{e.name}</option>)
                        }
                        </select>
                    </div>
                    <button type="submit" onClick={this.constructNewAnimal} className="btn btn-primary">Submit</button>
                </form>
            </React.Fragment>
        )
    }
}

export default new AnimalForm()
```

## Using the Form

Once you've got all these pieces in place, click on the _Admit Animal_ button, fill out the form, and submit it. You should immediately see your new animal in the list.

![animation showing animal form working](./images/yeFJQKGtiU.gif)

## Practice: Adding Employees and Owners

1. Create forms for employees and owners.
1. Update **`EmployeeManager`** and **`OwnerManager`** with methods to POST new objects to the API.
1. Create methods in **`ApplicationViews`** to invoke the manager methods, and pass those functions to the appropriate child components.

## Advanced Challenge: Editing Animals

> As always, advanced challenges are completely optional and should only be attempted when you are comfortable with all of the basic concepts that you have learned so far.

In the **`AnimalDetails`** component, add an _Edit Animal Info_ button. When the button is clicked, a form should be presented to the user with the details of the animal pre-loaded into each input field.

When the user clicks the submit button on the editing form, then the values in the input fields should be used to update the information about the animal in the API.

Use the PUT method on your `fetch` calls.
