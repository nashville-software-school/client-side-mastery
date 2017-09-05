# Dynamic Cards

## Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/spa/cards && cd $_
touch index.html
touch cards.js
touch cards.css
```

## Requirements

1. Create an HTML page that contains a text area and a button labeled *Create*.
1. When the user enters in text into the text area and then clicks the create button, create a new card element in the DOM that includes it's own delete button. You decide the height/width of the card.
1. When the user clicks the *Delete* button, the containing card, and no other cards, should then be removed from the DOM. Not just made invisible, actually [removed](https://developer.mozilla.org/en-US/docs/Web/API/Node/removeChild) from the DOM.
