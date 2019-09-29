# The Power of Components

Now that you've seen the core mechanisms of a React application, it's time to consider the purpose of React, or any other component-based tool like Polymer, Vue, and Angular - reusability.

## Reusability Scenario

Right now, the only place that you're rendering an animal is when you select the Animal link in the navbar. What if you want to display the animals an employee is responsible for? You can refactor your application and use the **`AnimalCard`** to display animals along with an employee's information.

First, you will need to update your database to include an employees collection and include an employeeId on each animal.

> kennel.json
```json
  {
  "animals": [
    {
      "id": 2,
      "name": "Doodles",
      "breed": "German Sheperd",
      "employeeId": 3
    },
    {
      "id": 3,
      "name": "Esme",
      "breed": "Pitbull",
      "employeeId": 1
    },
    {
      "name": "Jack",
      "breed": "Big cat",
      "id": 4,
      "employeeId": 1
    },
    {
      "name": "Angus",
      "breed": "Gerbil",
      "id": 5,
      "employeeId": 2
    }
  ],
  "employees": [
    {
        "id": 1,
        "name": "Jessica Younker"
    },
    {
        "id": 2,
        "name": "Jordan Nelson"
    },
    {
        "id": 3,
        "name": "Zoe LeBlanc"
    }
  ]
}
```

**From the practice exercises, you should already have an `<EmployeeList>` and `<EmployeeCard>` components. Those need to be in place before working on this chapter.**

Next, we will include an API call that will get all employees with animals. We can use json-server relationships to include related child information with one call. This is done with `embed`.

> src/modules/EmployeeManager.js

```js
const remoteURL = "http://localhost:5002";

export default {
  getAll() {
        return fetch(`${remoteURL}/employees/`).then(result => result.json())
    },
   getWithAnimals(id) {
        return fetch(`${remoteURL}/employees/${id}?_embed=animals`)
                .then(result => result.json())
    }
}

```

**Note** for best results, you should name your json-server collections with a *plural* and join them together with a *singular*. For example: `employees` collection and join the employee on the animal with `employeeId`.

We need to add a button to the **`<EmployeeCard>`** for details using `history.push` of react-router-dom.

> EmployeeCard.js
```jsx
<button type="button"
        onClick={() => { this.props.history.push(`/employees/${this.props.employee.id}`) }}>Details</button>
```

We also need to add a route to **`<ApplicationViews>`** to handle displaying details of a single employee. This route will return a new component: **`<EmployeeWithAnimals>`** which we will build next. Notice that we are passing `{...props}` to enable access to react-router-dom properties.

> ApplicationViews.js

```js
 <Route path="/employees/:employeeId(\d+)" render={(props) => {
    return <EmployeeWithAnimals {...props} />
}} />

```
Be sure to import **`EmployeesWithAnimals`** into `ApplicationViews`.

## New Component - EmployeeWithAnimals
This component will display a single employee and include an **`<AnimalCard>`** for each animal. We can re-use the previously created AnimalCard component. This component will accept `props` and `return` the employee name and then `map` over the animals returning **`<AnimalCard>`** for only the pets the employee is responsible for.

> src/components/employee/EmployeeWithAnimals.js

```jsx
import React, { Component } from 'react'
import EmployeeManager from '../../modules/EmployeeManager'
import AnimalCard from '../animal/AnimalCard'

class EmployeeWithAnimals extends Component {
    state = {
      employee: {},
      animals: []
    }

    componentDidMount(){
        //got here now make call to get employee with animal
        EmployeeManager.getWithAnimals(this.props.match.params.employeeId)
            .then((APIResult) => {
            this.setState({
              employee: APIResult,
              animals: APIResult.animals,
            })
        })
    }

    render(){
        return (
          <div className="card">
            <p>Employee: {this.state.employee.name}</p>
            {this.state.animals.map(animal =>
              <AnimalCard
                key={animal.id}
                animal={animal}
                {...this.props}
              />
            )}
          </div>
        )
      }
    }

export default EmployeeWithAnimals;

```

## Refactor the NavBar
If you haven't already done so, be sure to add the link to employees in the **`<NavBar>`** component

```js
<li><Link className="nav-link" to="/employees">Employees</Link></li>
```


Test it out. Each employee should display a list of animals. However, we are not done.

If we edit or create an animal, the employeeId is missing. We need to add it to the **`<AnimalEditForm>`**.

## Practice: Refactor AnimalEditForm

In both `AnimalForm` and `AnimalEditForm`, you're going to have to add a dropdown menu to select an employee for this animal. Your dropdown list will need to show _all_ of the employees, but users can only select one. 

Add the **employeeId** to:
* `state`
* `componentDidMount()` - where does the employeeId come from?
* `updateExistingAnimal()` - where does the employeeId come from?

The following code will come in handy.

```jsx
<select
  className="form-control"
  id="employeeId"
  value={this.state.employeeId}
  onChange={this.handleFieldChange}
>
   {this.state.employees.map(employee =>
     <option key={employee.id} value={employee.id}>
       {employee.name}
     </option>
   )}
</select>
```
> The code above is not all you will need, however. Read it carefully. What does it _imply_ about the other changes you will need to make to the `AnimalForm` and `AnimalEditForm` components?

Once complete, you should be able to create a new animal and edit an existing animal. All animals in the database should have or retain their `employeeId` propperties.



## Practice: Employees per Location

1. Modify your API data so that employees have a `locationId` property designating at which location they work.
2. For each location, display the employees that work there.

