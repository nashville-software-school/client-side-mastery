# React Router with History
So far we have been using `exact` and `path` of react-router routes. In order to change the URL and redirect, we need to incorporate `history`.

In order for **`<AnimalDetail>`** to have access to the router history, we need to pass those props to the component. We do this with the spread operator. Refactor the route to include `{...props}`. Take a look at your Chrome React tools before and after the change.

```js
 <Route path="/animals/:animalId(\d+)" render={(props) => {
    // Pass the animalId to the AnimalDetailComponent
    return <AnimalDetail animalId={parseInt(props.match.params.animalId)} {...props}/>
}} />
```
With the spread operator all of the properties (props) are copied onto the component's props.

## Dynamically Changing the User's View

Once an animal is discharged(deleted) we want to automatically redirect the user back to the animal list. We can do this with the routing package object called [history](https://github.com/ReactTraining/react-router/blob/master/packages/react-router/docs/api/history.md). On the history object, there is a method named `push()`.

If you push something on to the browser _history stack_, it will change the view.

For example, the following code will change the URL in your browser to `http://localhost:3000/animals`, which triggers the routing package to find the matching **`<Route>`** definition in **`ApplicationViews`**. That route returns **`<AnimalList>`**, so we see a list of animals.

```js
this.props.history.push("/animals")
```

You are going to invoke `push()` after an animal has been deleted and then redirect to the animal list.


## Add a 'loadingStatus" to the component
Consider the flow of code for the **`<AnimalDetails>`** component

1. Component loads
1. Render invoked displaying empty values for name and breed.
1. ComponentDidMount invoked, getting data for one animal.
1. Data for one animal loaded, setState is invoked with the details.
1. Render invoked again and displays the details.

When there are empty values, what happens if the user clicks on discharge? Best practice would be to disable functionality until the data has loaded. We can do that by setting a value in state `loadingStatus: false` and then use the value to turn things on or off. We can also use this during the delete process.

Refactor the **`<AnimalDetail>`** to include `loadingStatus`. Notice that our button is disabled based on the state of `loadingStatus`.

> AnimalDetail.js


```js
import React, { Component } from 'react';
import AnimalManager from '../../modules/AnimalManager';
import './AnimalDetail.css'

class AnimalDetail extends Component {

    state = {
        name: "",
        breed: "",
        loadingStatus: true,
    }

    componentDidMount(){
        console.log("AnimalDetail: ComponentDidMount");
        //get(id) from AnimalManager and hang on to that data; put it into state
        AnimalManager.get(this.props.animalId)
        .then((animal) => {
            this.setState({
                name: animal.name,
                breed: animal.breed,
                loadingStatus: false
            });
        });
    }

    render() {
      return (
        <div className="card">
          <div className="card-content">
            <picture>
              <img src={require('./dog.svg')} alt="My Dog" />
            </picture>
            <h3>Name: <span style={{ color: 'darkslategrey' }}>{this.state.name}</span></h3>
            <p>Breed: {this.state.breed}</p>
            <button type="button" disabled={this.state.loadingStatus} onClick={this.handleDelete}>Discharge</button>
          </div>
        </div>
      );
    }
}

export default AnimalDetail;

```

## Add Delete Functionality
Consider the flow of code for delete.
1. User clicks on `Discharge`
1. We don't want the user to be able to click hundreds of times on the button, so we can `setState( {loadingStatus: true} )` which disables the button.
1. Perform the DELETE operation to change your API data. Once complete,
1. switch the view from AnimalDetail 👉🏼 AnimalList.
1. AnimalList: `componentDidMount()` will get all animals data.
1. AnimalList: `render()`

Add the handleDelete function to **`AnimalDetail`** component.

```js
handleDelete = () => {
    //invoke the delete function in AnimalManger and re-direct to the animal list.
    this.setState({loadingStatus: true})
    AnimalManager.delete(this.props.animalId)
    .then(() => this.props.history.push("/animals"))
}

```

## Practice: Close a location
Refactor the **`<LocationDetail>`** component to allow closing(deleting). You will need to incorporate a `loadingStatus`. Once a location has been closed, automatically redirect the user back to the location list.


