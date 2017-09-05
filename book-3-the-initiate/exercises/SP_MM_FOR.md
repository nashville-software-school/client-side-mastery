# For The Love Of Loops - Muscle Memory Exercise

## Prerequisite

> :warning: This exercise requires that you have completed the [Very Large Array](SP_MM_ARRAYS.md) exercise.

## Setup

1. Create a branch in your `musichistory` repository named `MM-for`, and switch to that branch. `git checkout -b MM-for`
1. Pull down your Music History `MM-arrays` branch. `git pull origin MM-arrays`

This will create a branch in your Music History repo called `MM-for` and pull down the `MM-arrays` branch from github.

## Requirements

`Muscle memory exercises are meant to improve your muscle memory for important javascript concepts. While doing these exercises try to minimize, if not completely eliminate copying and pasting.`

Use JavaScript arrays and innerHTML to show the music you love.

Students must use JavaScript to create arrays, modify them (using only for loops), and output lists to the DOM.

1. Using the three separate arrays you created in the Very Large Array exercise code the following functionality.
1. Using the output elements from the previous muscle memory exercise, utilize for loops to duplicate output to the DOM.
1. For each output element send the corresponding data as follows:
    *   Output vertically, descending alphabetically.
    *   Output vertically, ascending alphabetically.
    *   Output vertically exactly as they were added.
    *   Output vertically exactly as they were added, inverted.
    *   Output horizontally, descending alphabetically, separated by `, `.
    *   Output horizontally, ascending alphabetically, separated by ` >> `.
    *   Output horizontally exactly as they were added, separated by ` : `.
    *   Output horizontally exactly as they were added, inverted, separated by ` | `.
1. Add a couple of songs in the add song form and make sure your loop logic works.
> :pencil2: For this exercise make sure each song is from a unique artist and album. We will deal with multiples in a later exercise

#### Bonus
*   Handle both upper and lowercase inputs. Accomplish this with any method you'd like. 

> :pencil2: Additional array methods may have to be employed to complete this bonus item.

*   Try to output each section using just one for loop for each section.
*   Try to achieve the same results using just one for loop for all three sections.
*   Handle extra punctuation at the end of a list.
