# Displaying Your Note Journal

Your job is to display a list of your learning notes in the terminal. Remember to use string interpolation, dot notation to access object properties, and your `for..of` loop.

Display each note to look like the output below. The number on the first line is the primary key _(the `id` property)_.

```html
Note 1
2/14/2021
I learned JavaScript Objects.
I spent 124 minutes working on it
I felt frustrated.
```

To have a string output on multiple lines, just press enter when you want a line break. Here's an example.

```js
const chickens = [
    {
        id: 1,
        name: "Little",
        fame: "Falling sky"
    },
    {
        id: 2,
        name: "Foghorn",
        fame: "Stupidity"
    }
]

for (const bird of chickens) {
    console.log(`Chicken ${bird.id}
Name is ${bird.name}
Famous for ${bird.fame}
---------
`)
}
```

The above code would output the following text to the terminal.

```html
Chicken 1
Name is Little
Famous for Falling Sky
---------
Chicken 2
Name is Foghorn
Famous for Stupidity
```