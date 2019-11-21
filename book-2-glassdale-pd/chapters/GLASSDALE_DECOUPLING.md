# A Discussion about Loose Coupling

The idea of Coupling in complex software is an important factor. Coupling is defined most generally as how many components know about the existance of each other. The higher that number, the higher your overall coupling is in an application. You want that number to be as low as possible.

Consider the following example. You have two modules in your system responsible for rendering HTML components.

## Coupled Components

### List of all of a user's friends

```js
// FriendList.js
import { useFriends } from './FriendProvider.js'

const contentTarget = document.querySelector(".friends")

const FriendList = () => {
    const appStateFriends = useFriends()

    const render = friendCollection => {
        contentTarget.innerHTML = `
            ${
                friendCollection.map(friend => {
                    return `
                        <input class="friend" type="checkbox" value="${friend.name}">
                        ${friend.name}
                    `
                })
            }
        `
    }

    render(appStateFriends)
}
```

### List of messages from only the selected friend in the list

```js
// MessageList.js
import { getMesssageByFriend } from "./MessageProvider.js"

const eventTarget = document.querySelector(".friends")
const contentTarget = document.querySelector(".messages")

const MessageList = () => {
    const appStateFriends = useFriends()

    // Listen for when a friend is selected
    eventTarget.addEventListener("change", changeEvent => {
        // Make sure it's the change event of the friend checkbox
        if (changeEvent.target.classList.contains("friend")) {

            // Get messages for friend and render the list of messages
            const friendName = changeEvent.target.value
            const messages = getMesssageByFriend(friendName)
            render(messages)
        }
    })

    const render = messageCollection => {
        contentTarget.innerHTML = `
            ${
                messageCollection.map(friend => {
                    return `
                        <input class="friend" type="checkbox" value="${friend.name}">
                        ${friend.name}
                    `
                })
            }
        `
    }
}
```

Unfortunately, these two components are now tighly coupled. What couples them?

1. **`MessageList`** knows of the existence of the DOM element with `friends` class name.
1. It also knows about DOM elements with the `friend` class name and that they emit the "change" event.
1. It knows that those DOM elements have a `.value` property.

Ok... so what? Why is this bad?

Imagine that the **`FriendList`** component goes through a major refactor. It no longer renders to the DOM element with the class of `friends`, but now to one with a class of `friendList`. What if the input elements get a new class name of `friend--user`?

Either of those change in that component will then immediately break the functionality of the **`MessageList`** component. That means a refactor in one component forces a refactor of another component. That's unnecessary.