# Daily Journal

Since your daily journal is already using Javascript modules, in order to implement ES 6 modules, please go through the following steps.

## ES6 Modules

1. Which of your Javascript modules contains the main logic? In this application, the `src/scripts/journal.js` is where execution starts. Remove all other script tags from `index.html` so that it only has a single script tag for `journal.js`. 

1. The other three modules (`data.js`, `entriesDOM.js` and `entryComponent.js`) have methods that are being used outside the scope of the module. So add export statements to these modules.

1. Add import statements at the top the appropriate modules so that each module is importing any module it needs.
