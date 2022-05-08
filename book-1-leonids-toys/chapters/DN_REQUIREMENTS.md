# Daily Notes Project

## Algorithm

The most important part of this project is that you write your algorithms out in comments before you code. Starting this practice right now will have a significantly positive impact on your ability to understand what code you need to write.

## How A Senior Developer Would Do It

Here are the first requirements for this project.

1. You need to store many notes for a user in a collection.
1. Each note needs to store the following information.
    1. The note of the text
    1. The author of the note
    1. The date the note was entered
    1. The category of the note
1. A note can be assigned any number of topics. For example...
    1. "task"
    1. "observation"
    1. "code"
    1. "learning"
    1. "feelings"
    1. etc...

### Beginning Algorithm Comments

Given those requirements, here is how each would be described by a professional developer.

```js
/*
    Define a variable named `notes` and assign a value of an empty array
*/


/*
    Fill the array with several starter objects that have
    the following properties.
        * id (number)
        * text (string)
        * author (string)
        * date (string)
        * topics (array of strings)

    Either define the objects within the initial array or
    use the .push() method to add them after initialization.
*/
```

Why do developers do this? The two main reasons are...

1. Reflecting on the problem and writing comments saves time. If you start with code, without thinking it through, you waste large amounts of time in the long run.
1. When you come back and look at this code again in the future, there is a ready-made explanation for the code. Again, this saves large amounts of time for "future you".

Since you are a beginner, you **must** start with algorithm development with comments before you write code.

## Setup

```sh
cd
cd workspace
mkdir daily-notes
cd daily-notes
touch main.js
code .
```

## Instructions

Copy the algorithm provided above into your `main.js` and see if you can write the code for both operations. Add a few notes to the array.