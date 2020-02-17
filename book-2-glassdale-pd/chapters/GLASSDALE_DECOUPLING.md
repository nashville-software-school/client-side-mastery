# A Discussion about Loose Coupling

The idea of Coupling in complex software is an important factor. Coupling is defined most generally as how many components know about the existence of each other. The higher that number, the higher your overall coupling is in an application. You want that number to be as low as possible.

Consider the following example. You have two modules in your system responsible for rendering HTML components.

## Tightly Coupled Components

Starting off with this default HTML structure in the `index.html` file, the **`FriendList`** component will be rendered in the first section, and the **`MessageList`** component will be rendered in the second section.

When the user chooses a friend in the first component, the second component will render a list of messages from that friend. These components are siblings to each other.

> #### `index.html`

```html
<body>
    <main id="appContainer" class="container">

        <section class="friends"></section>

        <section class="messages"></section>

    </main>

    <script type="module" src="./scripts/main.js"></script>
</body>
```

### List of all of a user's friends

> #### `scripts/friends/FriendProvider.js`

```js
let friends = [
    { name: "Sally", age: 31, location: "Nashville" },
    { name: "Dominic", age: 39, location: "Knoxville" },
    { name: "Tamela", age: 29, location: "Louisville" },
    { name: "Yolanda", age: 42, location: "Asheville" }
]

export const useFriends = () => {
    return friends.slice().sort((a,b) => a.age - b.age)
}
```

> #### `scripts/friends/FriendList.js`

```js
import { useFriends } from './FriendProvider.js'

// DOM element where friends will be rendered
const contentTarget = document.querySelector(".friends")

// Function that renders a collection of friends
const render = friendCollection => {
    contentTarget.innerHTML = `
        ${
            friendCollection.map(friend => {
                return `
                    <div>
                        <input class="friend" name="friend" type="radio" value="${friend.name}">
                        ${friend.name}
                    </div>
                `
            }).join("")
        }
    `
}

// Component function for initial rendering of friends
const FriendList = () => {
    const appStateFriends = useFriends()
    render(appStateFriends)
}

export default FriendList
```

### List of messages from only the selected friend in the list

> #### `scripts/messages/MessageProvider.js`

```js
let messages = [
    { friend: "Sally", text: "I saw a dolphin eat a bird." },
    { friend: "Sally", text: "Where is Kazakhstan?" },
    { friend: "Sally", text: "I'm going to Vegas this weekend for a professional conference." },
    { friend: "Dominic", text: "The twins won't stop crying." },
    { friend: "Dominic", text: "I got a flat tire this morning. I'll be late." },
    { friend: "Dominic", text: "I think Florida beaches are the best." },
    { friend: "Tamela", text: "I like margeritas!" },
    { friend: "Tamela", text: "Since when does Johnathan like hamburgers?" },
    { friend: "Tamela", text: "I nailed the presentation at work today!" },
    { friend: "Yolanda", text: "I didn't get any sleep last night." },
    { friend: "Yolanda", text: "Would you like to come over for coffee this morning?" },
    { friend: "Yolanda", text: "April saw Mike walking in the park yesterday instead of being at work." }
]

export const useMessages = () => {
    return messages.slice()
}

export const getMessagesByFriend = friend => {
    const friendMessages = messages.slice()
    const filteredMessages = friendMessages.filter(
        m => m.friend === friend
    )

    return filteredMessages
}
```

> #### `scripts/messages/MessageList.js`

```js
import { getMessagesByFriend } from "./MessageProvider.js"


const contentTarget = document.querySelector(".messages")

// BAD: Creates a coupling between the two components
const friendListSection = document.querySelector(".friends")

// Listen for when a friend is selected
friendListSection.addEventListener("change", changeEvent => {

    // Make sure it's the change event of the friend checkbox
    if (changeEvent.target.classList.contains("friend")) {

        // Get messages for friend and render the list of messages
        const friendName = changeEvent.target.value
        const messages = getMessagesByFriend(friendName)
        render(messages)
    }
})

// Function responsible for rendering a collection of messages
const render = messageCollection => {
    contentTarget.innerHTML = `
        ${
            messageCollection.map(message => {
                return `<section class="message">${message.text}</section>`
            }).join("")
        }
    `
}

// Component function initially renders nothing
const MessageList = () => {
    render([])
}

export default MessageList
```

> #### `scripts/main.js`

```js
import FriendList from "./friends/FriendList.js"
import MessageList from "./messages/MessageList.js"

FriendList()
MessageList()
```

Unfortunately, these two components are now tightly coupled. What couples them?

1. **`MessageList`** knows of the existence of the DOM element with `friends` class name.
1. It also knows about DOM elements with the `friend` class name and that they emit the "change" event.
1. It knows that those DOM elements have a `.value` property.

Ok... so what? Why is this bad?

Imagine that the **`FriendList`** component goes through a major refactor.

* What if it is changed to no longer render to the DOM element with the class of `friends`, but now to one with a class of `friendList`.
* What if the input elements get a new class name of `friend--user`?
* What if the friend elements are changed to a control that emits a "click" event instead of a "change" event?

Any of those change in the **`FriendList`** component will then immediately break the functionality of the **`MessageList`** component. That means a refactor in one component forces a refactor of another component.

Professional developers want to avoid that. This is one of the underlying principles to the Single Responsibility Principle. Any change to a component's functionality should only require changes to that component, and no others.

## Event Based Programming

One common way around this problem is to have the components talk to each other. Think of the components as a bunch of old friends gathering at a party. They can talk to each other and let everyone at the party know what happens to them.

Now, when one component talks, not every other component has to listen. When you are at a party, there are a few key people, or a few key topics you want to catch up with. So you choose to listen to only the things that are _important_ to you, and you choose to **not** listen to people/subjects that are not important to you.

You can do the same thing in your application. Components can broadcast custom messages, and other components that care about certain kinds of messages can listen for them. In JavaScript, you can use something called a Custom Event.

In your application, your components will use a common system for talking to each other. That will be the only type of coupling between components: a shared language. Components will be self-contained and will control everything that happens to them and simply dispatch messages in the agreed-upon format to an agreed-upon location.

In this application, the agreed-upon location will be the top-most DOM element.

```html
<main id="appContainer" class="container">
```

That is going to be the event hub because it's the element in which all components will be children of.

## Loosely Coupled Components

### Friend Was Selected

The first step in this process is to have the friend list have control over what happens with itself, and also control what information is wants to share with other components.

> #### `scripts/friends/FriendList.js`

```js
import { useFriends } from './FriendProvider.js'

/*
    CHANGE: The event target is now the `<main class=".appContainer">`
            element. That element is now the Event Hub.
*/
const eventHub = document.querySelector(".appContainer")
const contentTarget = document.querySelector(".friends")


// Listen for a browser-generated change event
contentTarget.addEventListener("change", changeEvent => {

    // If the change event was generated by the radio buttons...
    if (changeEvent.target.classList.contains("friend")) {
        const selectedFriend = changeEvent.target.value

        // Generate a new custom message that a friend was selected
        const message = new CustomEvent("friendSelected", {
            detail: {
                friend: selectedFriend
            }
        })

        // Dispatch custom message to event hub
        eventHub.dispatchEvent(message)
    }
})

const render = friendCollection => {
    contentTarget.innerHTML = `
        ${
            friendCollection.map(friend => {
                return `
                    <div>
                        <input class="friend" name="friend" type="radio" value="${friend.name}">
                        ${friend.name}
                    </div>
                `
            }).join("")
        }
    `
}


const FriendList = () => {
    const appStateFriends = useFriends()
    render(appStateFriends)
}

export default FriendList
```

### Components That Listen

Now the message list component can listen for any messages that are sent to the Event Hub that it cares about.

> #### `scripts/messages/MessageList.js`

```js
import { getMessagesByFriend } from "./MessageProvider.js"


const eventHub = document.querySelector(".appContainer")
const contentTarget = document.querySelector(".messages")

/*
    CHANGE: The message list component is listening for a very
            specific event that it cares about. It can then extract
            the data in the payload and use it however it wants.
*/
eventHub.addEventListener("friendSelected", event => {
    const friendName = event.detail.friend
    const messages = getMessagesByFriend(friendName)
    render(messages)
})


const render = messageCollection => {
    contentTarget.innerHTML = `
        ${
            messageCollection.map(message => {
                return `<section class="message">${message.text}</section>`
            }).join("")
        }
    `
}

const MessageList = () => {
    render()
}

export default MessageList
```

## Visualization

![](./images/friendSelected.gif)

## Reminder: This is Hard

Thinking about components talking to each other using custom messages is a large cognitive leap. Your brain needs to build a fairly complex mental model to understand how the signal flow of information works in a system like this.

You are not going to get this right away. It requires practice, conversations with your teammates &amp; instructors, and trying it in different contexts.

Time to move on to the next chapter and actually try this out with the Glassdale Cold Case application you are building. In the previous chapter, you built a dropdown element that lists crimes. You will have that component dispatch a custom message to an Event Hub, and the criminal list component will listen for that event and then behave how it chooses.
