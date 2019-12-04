# Checking Alibis

In this chapter, you will be refactoring your application to implement a new button on each criminal representation. The button must be labeled "Interview Associates".

When the user clicks the button, you must iterate the array of `known_associates` for that criminal and then display the following information. You can display it in a dialog box, as a sidebar, at the top of the screen, or wherever you like.

1. The name of the known associate
1. The alibi that the known associate is providing for the criminal to try to prove the criminals' innocence.

If any of the alibis for some of your suspects are noteworthy, then make sure you create a new notes and POST it to your personal notes API.