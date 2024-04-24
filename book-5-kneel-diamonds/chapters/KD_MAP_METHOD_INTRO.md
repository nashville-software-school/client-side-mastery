# The Map Array Method

> **Pro tip**: It is strongly recommended that you practice your learning efficiency when learning about array methods. They are a significant cognitive challenge for beginners who are transitioning from using `for..of` loops for everything. YouTube videos, W3Schools, GeekForGeeks, and ChatGPT should all be used as resources as you learn these methods.

Open the **`Metals`** module in VS Code. You will see that the list items for metals uses the `for..of` loop that you have seen in previous projects for building all of the HTML representations of data.


```js
export const MetalOptions = async () => {
    const response = await fetch("http://localhost:8088/metals")
    const metals = await response.json()

    let optionsHTML = "<h2>Metals</h2>"

    for (const metal of metals) {
        optionsHTML += `<div>
            <input type='radio' name='metal' value='${metal.id}' /> ${metal.metal}
        </div>`
    }

    return optionsHTML
}
```

Each object gets a corresponding `<div>` created for it. None are skipped. Each `<div>` is then appended to the singular string that will be returned from this component function.

You can accomplish this same feat with the `Array.map()` method.

* **find()** is for when you need to locate a single item in an array
* **filter()** is for when you need to locate _some_ of the items in an array
* **map()** is for when you to to _convert_ everything in an array

Here is how you would accomplish the same goal with **map()**.

```js
export const MetalOptions = async () => {
    const response = await fetch("http://localhost:8088/metals")
    const metals = await response.json()

    let optionsHTML = "<h2>Metals</h2>"

    // Use map() to generate new array of strings
    const divStringArray = metals.map(
        (metal) => {
          return `<div>
              <input type='radio' name='metal' value='${metal.id}' /> ${metal.metal}
          </div>`
        }
    )

    // This function needs to return a single string, not an array of strings
    const optionsHTML += divStringArray.join("")

    return optionsHTML
}
```

The `.map()` method also iterates the array, just like `for..of` does. Unlike a `for..of` loop, it invokes the function that you define.

Wait, what function?

This function. It returns a string, which gets added to the array that is getting built up during the iteration.

```js
(metal) => {
    return `<div>
        <input type='radio' name='metal' value='${metal.id}' /> ${metal.metal}
    </div>`
}
```

That function is the first, and only, argument that the `map()` method will accept. As it iterates the array, it will take the object at the current location and pass it as an argument to **your** function. Your function defines the `size` parameter.

So an _object_ comes into your function, and a _string_ gets returned. That string goes into a new _array_.

## The join() Array Method

The `.join()` array method, luckily, does exactly what its name infers - it _joins_ things together.

More specifically, it join **all** of the individual items in the array into a single string... all squished together.

![](./images/array-join-method-demo.gif)

If you join the strings in this array...

```js
[
   "<li> <input type="radio" name="size" value="1" /> 0.5 </li>",
   "<li> <input type="radio" name="size" value="2" /> 0.75 </li>",
   "<li> <input type="radio" name="size" value="3" /> 1 </li>",
   "<li> <input type="radio" name="size" value="4" /> 1.5 </li>",
   "<li> <input type="radio" name="size" value="5" /> 2 </li>"
]
```

...you end up with one long string filled with HTML.

```html
"<li> <input type="radio" name="size" value="1" /> 0.5 </li>
<li> <input type="radio" name="size" value="2" /> 0.75 </li>
<li> <input type="radio" name="size" value="3" /> 1 </li>
<li> <input type="radio" name="size" value="4" /> 1.5 </li>
<li> <input type="radio" name="size" value="5" /> 2 </li>"
```

## Generate Other Options

Now it's your turn.

Use the `map()` array method in the other component functions to convert the objects into HTML strings in a new array. Then use the `join()` method to squash the array of strings into a single string and return it.
