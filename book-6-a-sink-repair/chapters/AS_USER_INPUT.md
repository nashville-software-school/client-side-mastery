# Collecting User Input

HTML input fields are how you collect user data. Time for you to define some fields to collect the information from a user that Maude and Merle want about a service request.

> #### `workspace/sink-repair/src/scripts/ServiceForm.js`

```js

export const ServiceForm = () => {
    let html = `
        <div class="field">
            <label class="label" for="serviceDescription">Description</label>
            <input type="text" name="serviceDescription" class="input" />
        </div>
        <div class="field">
            <label class="label" for="serviceAddress">Address</label>
            <input type="text" name="serviceAddress" class="input" />
        </div>
        <div class="field">
            <label class="label" for="serviceBudget">Budget</label>
            <input type="number" name="serviceBudget" class="input" />
        </div>
        <div class="field">
            <label class="label" for="serviceDate">Date needed</label>
            <input type="date" name="serviceDate" class="input" />
        </div>

        <button class="button" id="submitRequest">Submit Request</button>
    `

    return html
}
```

Then import the HTML into the main module and interpolate it in the site structure.

> #### `sink-repair/src/scripts/SinkRepair.js`

```js
import { ServiceForm } from "./ServiceForm.js"
import { Requests } from "./Requests.js"

export const SinkRepair = () => {
    return `
        <h1>Maude and Merle's Sink Repair</h1>
        <section class="serviceForm">
            ${ServiceForm()}
        </section>

        <section class="serviceRequests">
            <h2>Service Requests</h2>
            ${Requests()}
        </section>
    `
}
```

## Layout CSS

Time to practice your CSS. Your goal is to make the form look like this.

#### Tips

* Do not put the CSS in `main.css`. Create another module whose responsibility is to style the request form.
* Use `flex-direction: column` on the wrapper `<div>` elements.
* Copy the button CSS from a previous project and choose a background color and font color of your choice.
* Make the font size of the labels slightly larger than the default size.

![](./images/initial-request-form.png)