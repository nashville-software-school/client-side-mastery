# State as a Map Instead of an Object

Modify Kneel Diamonds to store transient state as a **Map** data structure. Also update the setter functions to update the value of the key instead of updating the value of an object key.

You will also need to update your code where you use `JSON.stringify()` to turn your state into a string before sending to your local API. You will need to convert the **Map** into an **Object** before stringifying it. `JSON.stringify()` does not work with a **Map**.

Hint: `Object.fromEntries`
