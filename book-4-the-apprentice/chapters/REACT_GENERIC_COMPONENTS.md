# Making Generic, Reusable Components

In your Kennel application, you have two types of very similar components.

The list components.

1. LocationList
1. EmployeeList
1. AnimalList

The presentation components.

1. AnimalCard
1. LocationCard
1. EmployeeCard

Each components in these sets are largely identical. This is an opportunity to make your components for generic. You will start with the presentation components. You will be making sure that each object, regardless of its type will be presented in the same way, and reuse the same code. This reduces your application's file count, and ensures consistency as your application grows.

Let's start with animals and employees.

This is how your **`AnimalCard`** component looks now.

```js
import React, { Component } from "react";
import { Link } from "react-router-dom";

class AnimalCard extends Component {
  render() {
    return (
      <div className="card">
        <div className="card-content">
          <picture>
            <img src={require("./dog.svg")} alt="My Dog" />
          </picture>
          <h3>
            Name:
            <span className="card-petname">{this.props.animal.name}</span>
          </h3>
          <p>Breed: {this.props.animal.breed}</p>
          <Link to={`/animals/${this.props.animal.id}`}><button>Details</button></Link>
        </div>
      </div>
    );
  }
}

export default AnimalCard;

```

And this is how your **`EmployeeCard`** component looks right now: 

```js
import React, { Component } from "react";
import { Link } from "react-router-dom";

class EmployeeCard extends Component {
  render() {

    return (
      <div className="card">
        <div className="card-content">
          <h3>
            Name:
            <span className="card-petname">{this.props.employee.name}</span>
          </h3>
          <Link to={`/employees/${this.props.employee.id}`}><button>Details</button></Link>
        </div>
      </div>
    );
  }
}

export default EmployeeCard;
```

Notice the similarities:
1. Both `AnimalCard` and `EmployeeCard` are using a div with a `className` of `"card"` and a nested div with a `className` of `"card-content"`
2. Both components use an `h3` to display the resource's name. We can get to both names via a `.name` property. For example, `this.props.animal.name` might get us Doodles, while `this.props.employee.name` might get us Mike.
3. Both components contain a link to the details view for that resource. The path to get to the details view is very similar-- `animals/1` is pretty similar to `employees/1`-- in both cases you need to knwo the name of the collection ("animals" and "employees") adn the primary key of the individual resource you want to route them to.

But! There are also some differences:
1. `AnimalCard` has a picture!
2. `AnimalCard` also displays breed.
3. In `AnimalCard`, we reference `this.props.animal` and in `EmployeeCard` we reference `this.props.employee`.

For now, we're going to lose the picture in `AnimalCard` and only display it in the details view, since in most cases our images would be coming from persistent storage anyway. Because we have all of these similarites, we can make a _single_ generic component to be used with both employee objects and animal lists since the HTML representations are identical, and the only difference is the property being used.

 **`reusables/ResourceCard.js`**

```js
import React, { Component } from "react";
import { Link } from "react-router-dom";

class ResourceCard extends Component {
  render() {
    return (
      <div className="card">
        <div className="card-content">
          <h3>
            Name:
            <span className="card-petname">{this.props.resource.name}</span>
          </h3>
          {/* This is a ternary operator! If the resource has a breed, we'll display it. If not, we'll print an empty string (and display nothing) */}
          {this.props.resource.breed ? (
            <p>Breed: {this.props.resource.breed}</p>
          ) : (
            ""
          )}

          <Link to={`/${this.props.resourceName}/${this.props.resource.id}`}>
            <button>Details</button>
          </Link>
        </div>
      </div>
    );
  }
}

export default ResourceCard;

```

Now all of the list components can use the new **`ResourceCard`** component. Now your development team has one component that can be reused to display the details of any resource, instead of having three separate components to maintain.

Here are what your `EmployeeList` and `AnimalList` components would look like rewritten to use the new `<ResourceCard>` component.

> LocationList.js

```js
import React, { Component } from "react"
import DetailCard from "./DetailCard";


export default class LocationList extends Component {
    state = { locations: [] }

    componentDidMount () {
        fetch("http://localhost:5002/locations")
        .then(e => e.json())
        .then(locations => this.setState({ locations: locations }))
    }

    render() {
        return (
            <React.Fragment>
                <ul>
                {
                    this.state.locations.map(location =>
                        <DetailCard id={location.id}
                            name={location.name}
                            resource="locations" />
                    )
                }
                </ul>
            </React.Fragment>
        )
    }
}
```

> EmployeeList.js

```js
import React, { Component } from "react";
//import the components we will need
import EmployeeManager from "../../modules/EmployeeManager";
import ResourceCard from "../reusables/ResourceCard"

class EmployeeList extends Component {
  //define what this component needs to render
  state = {
    employeesInState: [],
  };

  componentDidMount() {
  // When the page loads, get all the employees from the database and put them in state
  // Putting them in state causes the render method to run again, and the employees will print to the DOM
    EmployeeManager.getAll().then((employeesFromAPI) => {
      console.log(employeesFromAPI);
      this.setState({
        employeesInState: employeesFromAPI,
      });
    });
  }

  render() {
    return (
      <>
        <div className="container-cards">
          {this.state.employeesInState.map((currentEmployeeInLoop) => {
            return <ResourceCard key={currentEmployeeInLoop.id} resource={currentEmployeeInLoop} resourceName="employees"/>;
          })}
        </div>
      </>
    );
  }
}

export default EmployeeList;

```

> AnimalList.js

```js
import React, { Component } from "react";
//import the components we will need
// import AnimalCard from "./SingleAnimalCard";
import ResourceCard from "../reusables/ResourceCard"
import AnimalManager from "../../modules/AnimalManager";

class AnimalList extends Component {
  //define what this component needs to render
  state = {
    animalsInState: [],
  };

  componentDidMount() {
    // console.log("ANIMAL LIST: ComponentDidMount");
    //getAll from AnimalManager and hang on to that data; put it in state
    AnimalManager.getAll().then((animalsFromAPI) => {
      console.log(animalsFromAPI);
      this.setState({
        animalsInState: animalsFromAPI,
      });
    });
  }

  render() {

    return (
      <>
        <section className="section-content">
          <button
            type="button"
            className="btn"
            onClick={() => {
              this.props.history.push("/animals/new");
            }}
          >
            Admit Animal
          </button>
        </section>

        <div className="container-cards">
          {this.state.animalsInState.map((currentAnimalInLoop) => {
            console.log(
              "this is a current animal in the loop",
              currentAnimalInLoop
            );
            return (
              <ResourceCard
                key={currentAnimalInLoop.id}
                resource={currentAnimalInLoop}
                resourceName="animals"
              />
            );
          })}
        </div>
      </>
    );
  }
}

export default AnimalList;

```

## Practice: Location List & Owners List
Refactor your location list and owners list to use your new `ResourceCard` component.

## Advanced Challenge: Reusable List Component
If you examine your list components now, you might notice that they're nearly identical. This is another opportunity for you to write a general, reusable component named **`ResourceList`**.

See if you can make a single component that replaces **`AnimalList`**, **`EmployeeList`**, **`OwnerList`** and **`LocationList`**.
