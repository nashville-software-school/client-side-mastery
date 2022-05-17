# Editing Profile: Employee

In this chapter, you will be implementing several components that will allow an employee to update her profile information. Some boilerplace code is provided below.

## Video Walkthrough



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
                    <input type="text"
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