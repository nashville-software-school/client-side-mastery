# Presentation to Björn

Now that you have made all of the changes that Björn wanted for his software program, you need to present it to him. To put your best foot forward, make sure that - if you haven't done so already - that your code is modularized.

You can follow one of two strategies.

* By content type _(i.e. a module for all trail code, etc.)_
* By function _(i.e. all data in one module, all functions in one module, etc.)_

Then utilize `require()` and `module.exports` correctly make the appropriate code available to other modules. The final result should be that the `adventure.js` module should contain only the code for displaying the information, and should import the data and/or the functions needed from other modules.
