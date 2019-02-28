# Editing an Animal in React

In this chapter, you are going to learn how to edit an animal. We will use a form very similar to the form we used to add an animal. Except this time, the form will be pre-filled with the current information of the animal we want to edit.

**_Quick Note_:** All of the code you will see from here to the end of this chapter needs to be in place before the feature will work.

## Button for Routing to the Edit Form

In your `AnimalCard` component, we are going to add a new button. When a user clicks on the button, the route changes to `/animals/:animalId/edit`. We will be using the route parameter to do a fetch call to get the data needed to prefill the form.

```jsx
<button
  type="button"
  className="btn btn-success"
  onClick={() => {
    this.props.history.push(`/animals/${this.props.animal.id}/edit`);
  }}
>
  Edit
</button>
```

![edit animal button](./images/animals-with-edit-button.png)

## Route for Showing Animal Edit Form

Below is a new route that renders the edit form for editing information about an animal. The `employees` collection is passed to the component because just like the form we used to board an animal, this one will also have the dropdown for employees. You will also pass an additonal prop called `upAnimal` which we will defined in `ApplicationViews`. You will also need to update the route for `/animals/:animalId` so that the the `AnimalDetail` component is only rendered when the path is an exact match.

First, update your routes with this code.

```jsx
<Route
  exact path="/animals/:animalId(\d+)"
  render={props => {
    return (
      <AnimalDetail
        {...props}
        deleteAnimal={this.deleteAnimal}
        animals={this.state.animals}
      />
    );
  }}
/>
<Route
  path="/animals/:animalId(\d+)/edit" render={props => {
    return <AnimalEditForm {...props} employees={this.state.employees} updateAnimal={this.updateAnimal}/>
  }}
/>
```

## Update method in ApplicationViews

When an animal's information is edited, the HTTP request will be a PUT. Define a method in your `AnimalManager` for the fetch call. This method will take two arguments: the id of the animal that will be updating as well as the an object that contains the new information for the animal that we want to save to the database.

```jsx
put(animalId, editedAnimal) {
    return fetch(`${remoteURL}/animals/${animalId}`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(editedAnimal)
    }).then(data => data.json());
  }
```

In your `ApplicationViews`, you are going to add a method that uses our newly defined `put` method in our `AnimalManger`. Just like with our CREATE and DELETE, any time the data is changed, another fetch to get the new data is made and we update state.

```jsx
updateAnimal = (animalId, editedAnimalObject) => {
        return AnimalManager.put(animalId, editedAnimalObject)
        .then(() => AnimalManager.getAll())
        .then(animals => {
          this.setState({
            animals: animals
          })
        });
      };
```

## Create AnimalEditForm Component

You can see from the code above that we are going to render a new component called `AnimalEditForm`. Create the new file and add the following code:

> components/animal/AnimalEditForm.js

```jsx
import React, { Component } from "react"
import AnimalManager from "../../modules/AnimalManager"

export default class AnimalEditForm extends Component {
    // Set initial state
    state = {
      animalName: "",
      breed: "",
      employeeId: ""
    }


    handleFieldChange = evt => {
        const stateToChange = {}
        stateToChange[evt.target.id] = evt.target.value
        this.setState(stateToChange)
    }

    updateExistingAnimal = evt => {
      evt.preventDefault()

      if (this.state.employee === "") {
        window.alert("Please select a caretaker");
      } else {
        const editedAnimal = {
          name: this.state.animalName,
          breed: this.state.breed,
          employeeId: parseInt(this.state.employeeId)
        };

    this.props.updateAnimal(this.props.match.params.animalId, editedAnimal)
    .then(() => this.props.history.push("/animals"))      
    }
  }

    componentDidMount() {
      AnimalManager.get(this.props.match.params.animalId)
      .then(animal => {
        this.setState({
          animalName: animal.name,
          breed: animal.breed,
          employeeId: animal.employeeId
        });
      });
    }


    render() {
      return (
        <React.Fragment>
          <form className="animalForm">
            <div className="form-group">
              <label htmlFor="animalName">Animal name</label>
              <input
                type="text"
                required
                className="form-control"
                onChange={this.handleFieldChange}
                id="animalName"
                value = {this.state.animalName}
              />
            </div>
            <div className="form-group">
              <label htmlFor="breed">Breed</label>
              <input
                type="text"
                required
                className="form-control"
                onChange={this.handleFieldChange}
                id="breed"
                value = {this.state.breed}
              />
            </div>
            <div className="form-group">
              <label htmlFor="employee">Assign to caretaker</label>
              <select
                name="employee"
                id="employeeId"
                onChange={this.handleFieldChange}
                value = {this.state.employeeId}
              >
                <option value="">Select an employee</option>
                {this.props.employees.map(e => (
                  <option key={e.id} id={e.id} value={e.id}>
                    {e.name}
                  </option>
                ))}
              </select>
            </div>
            <button
              type="submit"
              onClick={this.updateExistingAnimal}
              className="btn btn-primary"
            >
              Submit
            </button>
          </form>
        </React.Fragment>
      );
    }
}
```

This component looks very similar to the form component used to add a new animal. The only difference is that we populate the input fields with the current values from the API. The current values of the animal we are editing are obtained via a fetch call in `componentDidMount`. Because this data already exists in the API (meaning there is no change in state after this fetch call) and this data is simply used to show the user the current values, we make the fetch call from the `AnimalEditForm` instead of `ApplicationViews`.

```jsx
    componentDidMount() {
      AnimalManager.get(this.props.match.params.animalId)
      .then(animal => {
        this.setState({
          animalName: animal.name,
          breed: animal.breed,
          employeeId: animal.employeeId
        });
      });
    }
```

For each `input` field in our JSX, the attribute `value` is used to populate the field with the data from the fetch call.

The `get` method defined in the `AnimalManager` is the same one we use to get data for the animals details view. The fetch call returns data for a single animal object identified by the `id` in the URL.


![animation showing animal edit working](./images/p13zLpAnWm.gif)

## Practice: Kennels: Editing Employees and Owners

1. Add a button to each employee and owner card to be able to edit them.
1. Create new components for the edit forms for employees and owners.
1. Add the appropriate routes to `ApplicationViews` to render the edit form when the user clicks the edit button.
1. Update **`EmployeeManager`** and **`OwnerManager`** with a PUT method to update existing objects in the API.
1. Create methods in **`ApplicationViews`** to invoke the manager methods, and pass those functions to the appropriate child components.
1. In the edit form components, fetch the data of the employee or owner the user wants to edit in the `componentDidMount` and pre-fill the edit form.
1. When the user submits the edit form, use the method passed as props from `ApplicationViews` to update the data in your API.

## Practice: Kandy Korner: Editing Employees

1. Create a form for editing an employee.
1. Update **`EmployeeManager`** with a PUT method to update an existing employee
1. Create a method in **`ApplicationViews`** to invoke the manager methods, and pass those functions to the appropriate child components.
1. In the edit form component, fetch the data of the employee the user wants to edit in the `componentDidMount` and pre-fill the edit form.

## Practice: Kandy Korner: Editing Candies

1. Create a form for editing a candy.
1. Update **`CandyManager`** with a PUT method to update an existing candy
1. Create a method in **`ApplicationViews`** to invoke the manager methods, and pass those functions to the appropriate child components.
1. In the edit form component, fetch the data of the employee the user wants to edit in the `componentDidMount` and pre-fill the edit form.
