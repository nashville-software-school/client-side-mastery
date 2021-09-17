# Moving the Fetch (Single Responsibility)

Just like you did in the Explorer chapter for Honey Rae's Repairs, move all of the `fetch()` calls from the individual components into an `ApiManager.js` module that you create in the `components` directory.

Then refactor the components to import the appropriate function that performs the fetch.