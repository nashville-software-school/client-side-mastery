#!/bin/bash
set -u

mkdir -p $HOME/workspace/message-list/scripts/messages
mkdir -p $HOME/workspace/message-list/styles
cd $HOME/workspace/message-list

echo '<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Nashville Software School</title>
        <link rel="stylesheet" href="./styles/main.css">
    </head>

    <body>
        <main id="container">
            <div id="messages"></div>
        </main>

        <script type="module" src="./scripts/main.js"></script>
    </body>
</html>
' >> index.html

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

.blue {
    background-color: aliceblue;
}

.green {
    background-color: darkseagreen;
}
.purple {
    background-color: mediumorchid;
}
.red {
    background-color: darksalmon;
}' >> ./styles/main.css

echo 'import { MessageList } from "./messages/MessageList.js"

MessageList()' >> ./scripts/main.js

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
' >> ./scripts/messages/MessageProvider.js

echo 'import { useMessages } from "./MessageProvider.js"
import { Message } from "./Message.js"

const contentTarget = document.querySelector("#messages")

/*
    COMPONENT FUNCTION
*/
export const MessageList = () => {
    const allMessages = useMessages()
    render(allMessages)
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
}' >> ./scripts/messages/MessageList.js

echo 'export const Message = messageObject => {
    return `
        <section class="message">${messageObject.friend}: ${messageObject.text}</section>
    `
}' >> ./scripts/messages/Message.js

# serve -l 8080