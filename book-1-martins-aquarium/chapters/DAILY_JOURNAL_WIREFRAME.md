# Daily Journal

The Daily Journal application will be your opportunity to take the concepts you learn in class, and practice with the exercises and apply them elaboratively throughout the course. 

Ultimately the daily journal will display a list of posts with the ability to add, edit, and delete a post. 

## Design and Layout
Before coding, it is recommended to plan what you will build. Use an online tool like [Sketchboard.me](https://sketchboard.me/) or [Figma.com](https://www.figma.com/) or a trusty pen with paper to create a wireframe visual of your journal. Wireframes establish the basic structure of a page before visual design.

The journal app will include:
1. Logo: Daily Journal/or other of your choosing.
1. Your name
1. A form to collect journal entry information:
	* Date field. Input elements in HTML can be of type `date` which will automatically render a calendar control for you to use.
	* Concepts covered. A short input field of type `text` where you enter in what concept(s) were covered and are driving the journal entry.
	* Journal entry. This is a `textarea` field where you can enter in as much text about what you learned, how you felt, and plans for the upcoming days.
	* Mood. This should be a `select` element with as many `option` child elements as you would like to describe your mood for the day. You can start with the simply happy, fine, and sad values, or pick your own scaling system.
	* A `button` element labeled `Record Journal Entry`, or any other text that you would like.
1. A list display of all journal entries
	* Each item (card) in the list will represent a single journal entry with the details from the form. 
	* In the wireframe, each card will include a `Delete` button and `Edit` button.

1. A footer area that includes your name with a link to GitHub and copyright.