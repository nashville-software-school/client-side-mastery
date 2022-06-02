# Permanent State vs Transient State

## Permanent State

Permanent state goes in the database for long-term storage. You can consider permanent state as information that must be retained and used each time a person uses your application.

Examples of this are:

1. The person's personal information _(name, email address, personal bio, etc.)_
1. Information the user has created to be displayed in your application. For example, a post on Facebook, or an image on Instagram.

## Transient State

Transient state only exists while the user is interacting with the application. When the user leaves the app, or refreshes the browser, transient state is reset to default.

Examples of this are:

1. Options a user has chosen in the user interface.
1. Text the user has entered into form fields.
1. Which view the user is currently on.

This kind of state is still tracked, but only in the application code, and is not saved to the database.