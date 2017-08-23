# Music History Part 4

## Prerequisites

> :warning: This exercise requires that you have completed the [Music History 3](SP_JS_EVENT_LISTENERS_MUSIC_HISTORY_03.md) exercise.

## Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
cd ~/workspace/musichistory
git checkout -b version-4
```

## Requirements

### Part One

1. Read from local JSON file with an XHR.
1. Loop over results and inject into Music History list view.
1. Add delete button to each row and, when it is clicked, delete the entire row in the DOM.

### Part Two

1. Take your music and split it into two JSON files instead of them all living on one file.
1. Add a button at the bottom of your music list and label it `More >`.
1. Load the songs from the first list, and inject the DOM into the document as you've already done.
1. When the user clicks that button, load the songs from the second JSON file and append them to the bottom of the existing music, but before the More button.
