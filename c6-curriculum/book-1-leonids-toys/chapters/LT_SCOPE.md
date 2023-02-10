# The Perry Scope

There is a popular children's character named Perry. He's a beaver that is a secret agent and solves silly mysteries with his sidekick, Pamphlet the Kangaroo.

![](https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fpictures.4ever.eu%2Fdata%2F674xX%2Ffun%2Fanimals%2F%5Bpictures.4ever.eu%5D%2520beaver%2C%2520gun%2C%2520spy%2C%2520funny%2520131482.jpg&f=1&nofb=1)

Leonid sells one of the accessories that Perry uses during his spy operations. It's a special telescope that uses x-ray vision to see inside structures.

The Perry Scope.

Add the following code to your JavaScript module. It's only task is to sell the highly popular Perry Scope. Unfortunately, the original developer made a mistake in naming a variable, and another mistake with the scope of her variables. See if you can fix it.

```js
const currentInventory = [
    "Muscle Man",
    "Dora the Scientist",
    "Princess Sparkles",
    "Perry Scope",
    "Explorer Backpack",
    "Space Scout Suit",
    "Geology Mineral Dig Kit",
    "Perry Scope"
]

const sellPerryScope = () => {

    for (const toy of inventory) {
        let availableForPurchase = false

        if (toy === "Perry Scope") {
            availableForPurchase = true
        }
    }

    if (availableForPurchase) {
        console.log("Enjoy your new Perry Scope")
    }
}

sellPerryScope()
```