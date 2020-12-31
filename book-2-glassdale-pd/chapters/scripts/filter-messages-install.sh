#!/bin/bash
set -u

mkdir -p $HOME/workspace/message-filter/scripts/messages
mkdir -p $HOME/workspace/message-filter/scripts/friends
mkdir -p $HOME/workspace/message-filter/styles
cd $HOME/workspace/message-filter

echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>NewForce</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>
        <main class="container">
            <section class="friends"></section>
            <section class="messages"></section>
        </main>

        <script type="module" src="./scripts/main.js"></script>
    </body>
</html>
' > index.html

echo '@import url("https://fonts.googleapis.com/css?family=Comfortaa|Patua+One");

/*Typography
--------------------------------------------------------------*/
body,
button,
input,
select,
textarea {
	color: #404040;
	font-family: "Comfortaa", Arial, sans-serif;
	font-size: 14px;
	line-height: 1.5;
}

h1,h2,h3,h4,h5,h6 {
  font-family: "Patua One", serif;
  letter-spacing: 2px;
}

.messages {
    border: 1px dotted goldenrod;
    padding: 1rem;
    margin: 1rem;
}
' > ./styles/main.css

echo 'let friends = [
    { name: "Sally", age: 31, location: "Nashville" },
    { name: "Dominic", age: 39, location: "Knoxville" },
    { name: "Tamela", age: 29, location: "Louisville" },
    { name: "Yolanda", age: 42, location: "Asheville" }
]

export const useFriends = () => {
    return friends.slice().sort((a,b) => a.age - b.age)
}' > ./scripts/friends/FriendProvider.js

echo 'import { useFriends } from "./FriendProvider.js"

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
export const FriendList = () => {
    const appStateFriends = useFriends()
    render(appStateFriends)
}
' > ./scripts/friends/FriendList.js

echo 'import { FriendList } from "./friends/FriendList.js"
import { MessageList } from "./messages/MessageList.js"

FriendList()
MessageList()
' > ./scripts/main.js

echo 'let messages = [
    { friend: "Sally", text: "I saw a dolphin eat a bird." },
    { friend: "Sally", text: "Where is Kazakhstan?" },
    { friend: "Sally", text: "I am going to Vegas this weekend for a professional conference." },
    { friend: "Dominic", text: "The twins will not stop crying." },
    { friend: "Dominic", text: "I got a flat tire this morning. I'\''ll be late." },
    { friend: "Dominic", text: "I think Florida beaches are the best." },
    { friend: "Tamela", text: "I like margeritas!" },
    { friend: "Tamela", text: "Since when does Johnathan like hamburgers?" },
    { friend: "Tamela", text: "I nailed the presentation at work today!" },
    { friend: "Yolanda", text: "I didn'\''t get any sleep last night." },
    { friend: "Yolanda", text: "Would you like to come over for coffee this morning?" },
    { friend: "Yolanda", text: "April saw Mike walking in the park yesterday instead of being at work." }
]

export const useMessages = () => {
    return messages.slice()
}

export const getMessagesByFriend = friend => {
    const friendMessages = useMessages()
    const filteredMessages = friendMessages.filter(
        message => {
            /*
              Returns true or false. If true, current message
              goes into new array.
            */
            return message.friend === friend
        }
    )

    return filteredMessages
}
' > ./scripts/messages/MessageProvider.js

echo 'import { getMessagesByFriend } from "./MessageProvider.js"
import { Message } from "./Message.js"

const contentTarget = document.querySelector(".messages")
const friendListSection = document.querySelector(".friends")

/*
    COMPONENT FUNCTION
*/
export const MessageList = () => {
    render([])
}

/*
    RENDERING FUNCTION
*/
const render = messageArray => {
    const convertedMessages = messageArray.map(messageObject => {
        const messageHTML = Message(messageObject)
        return messageHTML
    })
    const combinedSections = convertedMessages.join("")
    contentTarget.innerHTML = combinedSections
}

// Listen for when a friend is selected
friendListSection.addEventListener("change", changeEvent => {

    if (changeEvent.target.classList.contains("friend")) {
        // Get messages for friend and render the list of messages
        const friendName = changeEvent.target.value
        const messages = getMessagesByFriend(friendName)
        render(messages)
    }
})
' > ./scripts/messages/MessageList.js

echo 'export const Message = messageObject => {
    return `
        <section class="message">${messageObject.friend}: ${messageObject.text}</section>
    `
}' > ./scripts/messages/Message.js

# serve -l 8080