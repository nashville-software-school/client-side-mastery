# Editing The Employee Profile
In this chapter you will implement the form for the logged in employee to edit their profile.

## 📺 Watch the video

### ⚠️ Note on the video: 
This video instructs you to make the file `components/forms/EmployeeEdit.js`. Make sure your file ends in `.jsx` instead of `.js`.

Watch the [Employee Form](https://youtu.be/fg6g5rs5hh4?si=xTBsRD8G8hjjHgNn) video and implement the code yourself. Then read the rest of the chapter summarizing what you've learned.


### 🔸🔻🔹 CSS for this chapter
<details>
  <summary>Form.css</summary>

```css
form {
  margin: 3rem 5rem;
  border: 1px solid var(--outline);
  border-radius: 10px;
  padding: 1rem 0rem 0rem 1rem;
  box-shadow: 1px 2px 5px lightgray;
  background-color: var(--offWhite);
}

fieldset {
  min-width: 0;
  padding-bottom: 1.5rem;
  margin: 0;
  border: 0;
}

.form-control {
  height: calc(1.5em + 0.75rem + 2px);
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  border: 1px solid var(--outline);
  border-radius: 0.25rem;
}

.form-group {
  margin-right: 1rem;
  display: flex;
  flex-direction: column;
}

.form-btn {
  align-self: flex-end;
}

.form-btn:focus {
  box-shadow: none;
  outline: 2px solid transparent;
  outline-offset: 2px;
}
```
</details>

## The `useNavigate` hook
In this chapter you were introduced to another hook we get from the **react-router-dom** library called `useNavigate`. This hook returns a function that allows us to navigate to a different url, much like the `Link` component. 

```javascript
const navigate = useNavigate() // returns a function
```

We stored that function in a variable called ***navigate***. In order to use that function, we just pass the path we want it to navigate to.

```javascript
navigate(`/employee/${currentUser.id}`)
```

## Prevent Default for Forms
Forms are a special element in HTML. If you have a `button` inside of a `form` element, when you click on that button it will submit the form. On the form's submission, the page will refresh. To prevent this from happening, you can capture the event in the `onClick` function for the button and call `preventDefault()` on the event. This will prevent the page from refreshing.

## What's up with that warning?
After creating the form and populating the inputs with the values from our employee state, we got this warning in the console: 

```sh
Warning: A component is changing an uncontrolled input to be controlled. This is likely caused by the value changing from undefined to a defined value, which should not happen. Decide between using a controlled or uncontrolled input element for the lifetime of the component. More info: https://reactjs.org/link/controlled-components
```

The reason for this warning is the values we passed to the inputs:

```jsx
<input
  type="text"
  value={employee.specialty}
  required
  className="form-control"
/>

<input
  type="number"
  value={employee.rate}
  required
  className="form-control"
/>
```

The initial value for `employee` when the component renders is an empty object. Therefore, on the initial render, `employee.specialty` and `employee.rate` are `undefined`. Take a look at that error one more time. It doesn't like when we set the value of an input to undefined. So how do we get rid of this error? Two ways. We could add `specialty` and `rate` as properties with `''` and `0` as values to the initial object we give our `employee` state. This way way `specialty` and `rate` will never be undefined. Or we could use a ternary statement when setting the value of the input.

```jsx
<input
  type="text"
  value={employee.specialty ? employee.specialty : ''}
  required
  className="form-control"
/>

<input
  type="number"
  value={employee.rate ? employee.rate : 0}
  required
  className="form-control"
/>
```

This way we're first checking if `employee.specialty` and `employee.rate` are defined before setting them as the values for our inputs.

## Refactoring the `onChange` functions
Let's try to simplify our code a bit by writing a function we can use for any `onChange` that updates our state. Here's the way we're currently handling the `onChange` of our inputs.

```jsx
<input
  type="text"
  value={employee.specialty ? employee.specialty : ""}
  onChange={(event) => {
    const copy = { ...employee }
    copy.specialty = event.target.value
    setEmployee(copy)
  }}
  required
  className="form-control"
/>

<input
  type="number"
  value={employee.rate ? employee.rate : 0}
  onChange={(event) => {
    const copy = { ...employee }
    copy.rate = event.target.value
    setEmployee(copy)
  }}
  required
  className="form-control"
/>
```

This works, but we have some redundant code. We've also written quite a bit of logic in these `onChange` functions which makes our jsx long and difficult to read. Let's write ***one*** function that can handle both of these `onChange` events. We'll start by adding a `name` attribute to our `input` elements. 

```jsx
<input
  type="text"
  name="specialty"
  value={employee.specialty ? employee.specialty : ""}
  onChange={}
  required
  className="form-control"
/>

<input
  type="number"
  name="rate"
  value={employee.rate ? employee.rate : 0}
  required
  onChange={}
  className="form-control"
/>
```

Now for the function: 

```javascript
const handleInputChange = (event) => {
  const stateCopy = { ...employee }
  stateCopy[event.target.name] = event.target.value
  setEmployee(stateCopy)
}
```

By adding the `name` attribute to our input, we were able to define which property this input will change. In our function, we target that property by accessing the name via `event.target.name`. Now we can use this function for any input that modifies our employee state object.


```jsx 
<input
  type="text"
  name="specialty"
  value={employee.specialty ? employee.specialty : ""}
  onChange={handleInputChange}
  required
  className="form-control"
/>

<input
  type="number"
  name="rate"
  value={employee.rate ? employee.rate : 0}
  required
  onChange={handleInputChange}
  className="form-control"
/>
```

Up Next: [Setting up routes and authentication in Learning Moments](./LEARN_ROUTES_SETUP.md)