# Rendering the Form as a Component

Up to this point, you have had your journal entry form hard-coded in your `index.html` file. Your task for this exercise is create a **`JournalForm`** component whose responsiblity is to render the form.

Once that component is complete, make sure you import it into `main.js` and ensure that the form is the first thing rendered.

#### `main.js`

```js
import JournalFormComponent from "./form/JournalForm.js"

JournalFormComponent()
```