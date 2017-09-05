# Objective Reasoning - Muscle Memory Exercise

## Prerequisite

> :warning: This exercise requires that you have completed the [Music History 4](SP_MUSIC_HISTORY_04.md) & [For The Love Of Loops](SP_MM_FOR.md) exercises.

## Setup

1. Create a branch in your `musichistory` repository named `MM-objects`, and switch to that branch. `git checkout -b MM-objects`
1. Pull down your Music History `version-4` and `MM-arrays` branches. `git pull origin version-4 MM-arrays`

This will create a branch in your Music History repo called `MM-objects`, pull down both `version-4` and `MM-arrays` branches from github and merge them.

## Requirements

`Muscle memory exercises are meant to improve your muscle memory for important javascript concepts. While doing these exercises try to minimize, if not completely eliminate copying and pasting.`

Use JavaScript objects, for loops and innerHTML to show the music you love.

Students must use JavaScript to filter objects, modify them, and output lists to the DOM. Use the three separate arrays created in the Very Large Array exercise to build objects.

1. Create a new empty array called `songObjects`.
1. For each song in your previous song title array create an object that includes the song title, artist, album and genre.
1. Add a genre input to the add song section in the `index.html` file.
1. When a song is added it shoud be added not only to the DOM but to the array of objects as well.
1. Write a function that uses a for loop to populate the DOM on the add song section as follows:

    >  Song Title  
    >  Artist  
    >  Album  
    >  Genre  

1. Write four more functions that use for loops to populate the DOM on the add song section for each of the four categories (song title, artist, album & genre).

#### Bonus
*   Refactor your code to accomplish the same results using only one function and one for loop.
