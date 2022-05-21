# Editing Profile: Employee

In this chapter, you will be implementing several components that will allow an employee to update her profile information. Some boilerplace code is provided below.

## Video Walkthrough

Watch the [Edit Employee Profile](https://watch.screencastify.com/v/zQvaC71N4MmJTtwU95v0) video and then implement the code yourself with the boilerplate code below.

## Starter Code

```js
import { useEffect, useState } from "react"

export const EmployeeForm = () => {
    // TODO: Provide initial state for profile


    // TODO: Get employee profile info from API and update state


    const handleSaveButtonClick = () => {
        event.preventDefault()

        /*
            TODO: Perform the PUT fetch() call here to update the profile.
            Navigate user to home page when done.
        */
    }

    return (
        <form className="profile">
            <h2 className="profile__title">New Service Ticket</h2>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="specialty">Specialty:</label>
                    <input
                        required autoFocus
                        type="text"
                        className="form-control"
                        value={profile.specialty}
                        onChange={
                            (evt) => {
                                // TODO: Update specialty property
                            }
                        } />
                </div>
            </fieldset>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="name">Hourly rate:</label>
                    <input type="number"
                        className="form-control"
                        value={profile.rate}
                        onChange={
                            (evt) => {
                                // TODO: Update rate property
                            }
                        } />
                </div>
            </fieldset>
            <button
                onClick={}
                className="btn btn-primary">
                Save Profile
            </button>
        </form>
    )
}
```

## Success Message

In this next section, after you have completed the functionality, you can implement a slide in message for the employee once the data is saved.

It's always nice to provide some feedback to the user of your application when things work, or don't work.

### Style Rules

Add the following styles to your `index.css` file.

```css
.feedback {
  border: 1px dotted cadetblue;
  padding: 1rem;
  background-color: rgb(218, 230, 247);
  position: absolute;
  top: 20%;
  left: 50%;
  width: 70%;
  transform: translate(-50%, -50%);
  animation: 1s slideDown;
}

.invisible {
  display: none;
}

.visible {
  display: block;
}

.error {
  border: 1px dotted rgb(107, 21, 4);
  padding: 1rem;
  background-color: rgb(255, 229, 228);
}

@keyframes slideDown {
  0% {
    top: 0%;
  }

  100% {
    top: 20%;
  }
}
```

### Feedback Element JSX

Add the following JSX **above** the profile form element. This is where your feedback message will be displayed, and have the correct CSS classes applied to it.

```jsx
<div className={`${feedback.includes("Error") ? "error" : "feedback"} ${feedback === "" ? "invisible" : "visible"}`}>
    {feedback}
</div>
```

### State and Observer

Add the following state and observer code.

```js
const [feedback, setFeedback] = useState("")

useEffect(() => {
    if (feedback !== "") {
        // Clear feedback to make entire element disappear after 3 seconds
        setTimeout(() => setFeedback(""), 3000);
    }
}, [feedback])
```

### Set Success Message

Lastly, chain the following Promise code to your PUT operation.

```js
.then(() => {
    setFeedback("Employee profile successfully saved")
})
```

Once implemented you should see the following animated message when you click save.

<img src="./images/honey-rae-edit-success-message.gif" width="600px" alt="Animation showing an aminated, slide-in message that appears when the PUT operation is successful" />