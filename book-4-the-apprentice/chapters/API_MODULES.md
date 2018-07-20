# Using Modules in React

## Practice: Using Best Practices

Think back to the Nutshell group project you recently completed, and how you applied encapsulation, and the Single Responsibility Principle (SRP), to make modules whose reponsibilities were to interact with your persistent data storage.

Consider how you could create a regular old JavaScript module for this application which has that same responsibility. Then, each list component should import that module and use its methods for querying data.

For example:

Replace this code...

```js
componentDidMount () {
    fetch("http://localhost:5002/employees")
    .then(e => e.json())
    .then(employees => this.setState({ employees: employees }))
}
```

with something like this

```js
componentDidMount () {
    APIManager.getAllEmployees()
        .then(employees => this.setState({
            employees: employees
        }))
}
```

By using this approach, implementing the SRP, the **`APIManager`** module can evolve independently of the **`EmployeeList`** component. Any changes in how the API is accessed does not affect **`EmployeeList`** at all since it is using the abstraction that **`APIManager`** provides for getting data.
