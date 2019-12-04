# Checking Witness Statements

In this chapter, you will be refactoring your application to implement a new button that will allow you to review all witness statements. The witness data is at the URL http://criminals.glassdale.us/witnesses. Place a button in the UI labeled "Witness Statements".

When the user clicks the button, you should request all witnesses and display the following information. If criminals are currently rendered, this information should take its place.

1. The name of the witness.
1. Their statement text.

Review all of the statements, and if any of them are noteworthy, then make sure you create a new notes and POST it to your personal notes API.
