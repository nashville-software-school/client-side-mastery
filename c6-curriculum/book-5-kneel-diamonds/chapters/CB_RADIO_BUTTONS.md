# Display Your Options

1. Create a module that is responsible for generating the overall HTML structure for your app. It will be the equivalent of the **`KneelDiamonds`** module.
1. Create four modules in your `scripts` directory, each being responsible for displaying the four different option groups, just like you did in Kneel Diamonds.
    1. Wheels
    1. Technologies
    1. Paints
    1. Interiors
1. Import those four modules into the module you created in step one and interpolate them in the appropriate places in the overall HTML structure.
    ##### Example for Technologies import
    ```js
    import { Technologies } from "./Technologies.js"
    ```
1. Return an `<h2>` heading from each module's component function to verify that each one is imported and returning a value.
    ##### Example for Technologies.js

    ```js
    export const Technologies = () => {
        return `<h2>Technologies</h2>`
    }
    ```
