# Data Access Layer

Currently, the `database.js` module has three main responsibilities.

1. Maintain state of application data.
1. Provide functions to access state.
1. Provide functions to change state.

Your challenge is to break apart the responsbilities.

The database module should only store state.

You need to create a brand new module whose sole responsibility is provide access to the state. You can name this module `dataAccess.js`.

It is this new data access module that all other modules should be working with, instead of directly with the database module. It will contain all of the `get*()` functions and `set*()` functions. It should import the database module so that it can interact with the state directly.

It will be the only module that directly interacts with the raw state.