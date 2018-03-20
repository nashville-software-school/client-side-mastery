# Creating Components in Vanilla JavaScript

Creating an independent component that can be used anywhere in your application has been a goal of JavaScript developers since the mid-2000s. The reason being that component-based system are infinitely flexible and composable, allowing for faster development and modifications of features.

Consider this example.

## createElement()

JavaScript provides the `document.createElement()` method which creates a virtual DOM element that doesn't exist in the DOM until you tell it to.

## appendChild()

The `document.appendChild()` method will take a virtual DOM element you created and attach it as a child element of another one.

```js
// Create an unordered list element
const list = document.createElement('ul')

// Create a list item for our list
const listItem = document.createElement('li')
listItem.textContent = "George Bush"

// Put the list item on the unordered list
list.appendChild(listItem)

console.log(list)
```

When you insert the `list` object to the DOM, it will generate the following HTML.

```html
<ul>
    <li>George Bush</li>
</ul>
```

## createAttribute()

If you want your DOM element to have HTML attributes - like `id` or `class` - you can use the `createAttribute()` method on the virtual element.

```js
// Create an unordered list component element
const list = document.createElement('ul')

// Create an attribute for the list component
const listClass = document.createAttribute('class')
listClass.value = 'unordered-list'

// Add the attribute to the component
list.setAttributeNode(listClass)

// Create a child list item component for President Bush
const bush = document.createElement('li')
bush.textContent = "George Bush"
const bushClass = document.createAttribute('class')
bushClass.value = 'president'
bush.setAttributeNode(bushClass)

// Assign the list item component on the unordered list
list.appendChild(bush)

console.log(list)
```

```html
<ul class="unordered-list">
    <li class="president">George Bush</li>
</ul>
```

### Practice

You're going to create a simple list of chat messages that you might have with one of your family members. Maybe it's that wacky aunt that you see every Christmas and Fourth of July.

1. Put an `article` DOM element in your index.html with the `id` attribute value of `messages`.
1. In your JavaScript, use `querySelector()` to obtain a reference to that `article` DOM element.
1. Create five (5) `section` elements, each with a class of `message`, and with `textContent` of your choosing.
1. Using `appendChild()`, attach each message as a child to the `messages` element.

## createDocumentFragment()

What you did in the previous exercises was actually an expensive way of adding those elements to the DOM. Now, it didn't cost you any extra money, but it was expensive in terms of memory and processing power. When the DOM is written to, layout is 'invalidated', and at some point needs to be reflowed.

We can use a document fragment to reduce the processing and layout cost of constant, rapid-fire DOM updates. You can add as many components to it as you like, and then add the fragment to the DOM as a one-time operation.

```js
// A new "virtual" document fragment to contain components
const fragment = document.createDocumentFragment()

// Create an emperor component element
const julius = document.createElement('div')
julius.textContent = "Julius Caesar"
fragment.appendChild(julius)

// Create an emperor component element
const augustus = document.createElement('div')
augustus.textContent = "Augustus Caesar"
fragment.appendChild(augustus)

// Create an emperor component element
const aurelius = document.createElement('div')
aurelius.textContent = "Marcus Aurelius"
fragment.appendChild(aurelius)

/*
    Now I can update my HTML document all at once, with all
    three emperor components rendered. Otherwise, I would
    have needed to add each one, individually - a much more
    "expensive" operation.
*/
document.querySelector("#emperorList").appendChild(fragment)
```

### Document Fragment Practice

Update your code from the previous exercise to add the chat messages to the `messages` elements via a document fragment.
