# Very Large Array - Muscle Memory Exercise

## Prerequisite

> :warning: This exercise requires that you have completed the [Music History 3](SW_MUSIC_HISTORY_03.md) exercise.

## Setup

1. Create a branch in your `musichistory` repository named `MM-arrays`, and switch to that branch. `git checkout -b MM-arrays`
1. Pull down your Music History `version-3` branch. `git pull origin version-3`

This will create a branch in your Music History repo called `MM-arrays` and pull down the `version-3` branch from github.

## Requirements

`Muscle memory exercises are meant to improve your muscle memory for important javascript concepts. While doing these exercises try to minimize, if not completely eliminate copying and pasting.`

Use JavaScript arrays and innerHTML to show the music you love.

Students must use JavaScript to create arrays, modify them (using only the following methods: join, push, reverse, sort, concat and unshift), and output lists to the DOM.

1. Create three separate arrays, one for songs, one for albums, and one for artists.
1. The songs array should be initialized with 10 songs.
1. Each subsequent array should hold its corresponding data (artists and albums).
 > :pencil2: For this exercise make sure each song is from a unique artist and album. We will deal with multiples in a later exercise
1. An output should be added on the add song page, under the form, for each of the sections (songs, artists & albums).
1. Each output section should have some sort of title or headline before it.
1. Add 2 more songs from the add song form.
    + Each song should be added to the end of the song array.
    + Each artist should be added to the beginning of the artist array.
    + Each album should be added to the end of the album array.
1. For each output element arrange the corresponding data as follows:
    *   Output vertically, descending alphabetically.
    *   Output vertically, ascending alphabetically.
    *   Output vertically exactly as the data was added.
    *   Output vertically exactly as the data was added, inverted.
    *   Output horizontally, descending alphabetically, separated by `, `.
    *   Output horizontally, ascending alphabetically, separated by ` >> `.
    *   Output horizontally exactly as the data was added, separated by ` : `.
    *   Output horizontally exactly as the data was added, inverted, separated by ` | `.
1. Each output area should be separated by a headline tag.

#### Bonus
*   Handle both upper and lowercase inputs. Accomplish this with any method you'd like. 

> :pencil2: Additional array methods may have to be employed to complete this bonus item.
