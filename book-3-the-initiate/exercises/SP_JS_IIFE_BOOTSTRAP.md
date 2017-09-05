# Walk-A-Thon Donations

## Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/spa/walkathon && cd $_
```

## Requirements

Create a donation submission page for a Walk-A-Thon that allows donors to enter their name, email, dollar amount & whether their donation is lump sum or per lap.

Your project should have one HTML file that has:

+ A form for user information submission
+ The ability to select whether the donation will be a single amount or per lap
+ A table to display each donor's submission information
+ A button labeled `Donate` to process the submission
+ A button labeled `Cancel` to clear the submission form

The donor information should be stored as JS objects that contain their content type as keys and the submitted information as the value. `{name: "John Donut", pledge: 70}`

All donor information objects should be stored in a private array in an IIFE.

Make sure the donor array cannot be accessed by the other modules except through an accessor (getter) method.

The IIFE should expose, in its public interface, a method named `addDonor` that accepts a single argument. That argument's value should be the user information object.

You should also create an additional JavaScript file that handles interacting with the form elements and determining which method should be called.

## Styling

For display on the page, use [Bootstrap](https://getbootstrap.com) to style the form and table elements. Use Bootstrap's grid system and styling classes to get the following effects.

+ At desktop size display the table on the left and form on the right with some space around the sides
+ The page should have the same display on a tablet in landscape mode, but with no space at the sides
+ On mobile/vertical tablet the table should display above the form
+ The table entries should be alternately striped

> On top of these styling requirements, feel free to apply any of your own personal styling via your own CSS or Bootstraps myriad styling effects to enhance the display style and usability of your page.
