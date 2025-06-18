# Getting Started

1. In your main module, define your render function and design the overall HTML structure you want.
1. Create four modules in your `scripts` directory, each being responsible for displaying the four different option groups, just like you did in Kneel Diamonds.
    1. Wheels
    1. Technologies
    1. Paints
    1. Interiors
2. Import those four modules into the main module you created in step one. Invoke them in your render function and interpolate the resulting HTML them in the appropriate places in the overall structure.
3. Create a module to store transient state. Define the initial state needed for the application, and write setter functions for each state property.