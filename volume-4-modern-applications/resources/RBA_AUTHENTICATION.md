# :pushpin: Exercises

1. [Battleship](../exercises/RBA_BATTLESHIP.md)
1. [Music History 9](../exercises/MUSIC_HISTORY_09.md)

# Authenticating Users

## Basics

1. What is authentication?
1. What is OAuth? Describe the basic workflow.
1. Talk with students about what authentication will provide for them in their Music History application.

## OAuth with Firebase and Github

1. Have students [create a Github application](https://github.com/settings/applications/new) for Music History
1. Set up [Github integration](https://firebase.google.com/docs/auth/web/github-auth) in Firebase
1. Show example code to [display the Github login prompt](https://github.com/nashville-software-school/music-history-step-by-step/blob/d4ba72f339ef292144239782571ee1b37d789d1b/javascripts/main.js#L28)
1. Talk through what they will need to change in their applications to integrate authentication (wipe/update current songs with userId, [only querying data from Firebase for the current user](https://github.com/nashville-software-school/music-history-step-by-step/blob/master/javascripts/core_list.js#L23))
1. Ensure they understand that no logical operations for querying data should happen [until the user is authenticated](https://github.com/nashville-software-school/music-history-step-by-step/blob/v6.0/javascripts/main.js#L32).
