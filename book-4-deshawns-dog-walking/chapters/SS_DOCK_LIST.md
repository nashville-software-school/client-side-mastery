# List of Docks

Your first task is to create a list of available docks.

![](./chapters/../images/docks.png)

Here are some dock objects that you can add to your database module.

```js
const database = {
    docks: [
        { id: 1, location: "Shanghai, China", volume: "43.5" },
        { id: 2, location: "Busan, South Korea", volume: "21.6" },
        { id: 3, location: "Rotterdam, The Netherlands", volume: "14.35" },
        { id: 4, location: "Antwerp, Belgium", volume: "12.04" }
    ]
}
```

Remember to put an accessor, or getter, function in the database module so that the other modules can get a copy of this array of objects.

```js
export const getDocks = () => {
    // You write the code for copying the array and returning it
}
```

## Build an HTML List of Docks

Now open your module that is responsible for building the HTML for each dock and implement the code. Here is some starting code for you.

```js
import { getDocks } from "./database.js"


export const DockList = () => {
    const docks = getDocks()

    let docksHTML = "<ul>"

    for (const dock of docks) {
        // Convert each dock object to an <li> and append to the docksHTML string
    }

    docksHTML += "</ul>"

    return docksHTML
}
```