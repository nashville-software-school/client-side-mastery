# Daily Journal

The Daily Journal application will be your opportunity to take the concepts you learn in class, and practice with the exercises and apply them elaboratively throughout the course.

Ultimately the daily journal will display a list of posts with the ability to add, edit, and delete a post.

## Design and Layout
Before coding, it is recommended to plan what you will build. Use an online tool (_we like [sketchboard.io](https://sketchboard.io/)_) or you can use the tried &amp; true pen with paper method to create a wireframe visual of your journal. Wireframes establish the basic structure of a page to determine where your components will appear once you are finished with the visual design stage of a project.

The journal app will include the following components:

1. A logo. You can call your application **Daily Journal** or you can pick your own name.
1. Your name so the people know whose journal entries they are looking at.
1. A form to collect journal entry information. The form component will contain child components.
	1. Date field. Input elements in HTML can be of type `date` which will automatically render a calendar control for you to use.
	1. Concepts covered. A short input field of type `text` where you enter in what concept(s) were covered and are driving the journal entry.
	1. Journal entry. This is a `textarea` field where you can enter in as much text about what you learned, how you felt, and plans for the upcoming days.
	1. Mood. This should be a `select` element with as many `option` child elements as you would like to describe your mood for the day. You can start with the simply happy, fine, and sad values, or pick your own scaling system.
	1. A `button` element labeled `Record Journal Entry`, or any other text that you would like. This button will, when clicked, save the entry to a database. You will learn how to do this in Book 5.
1. A list component for all journal entries. Each item in the list is a component whose responsibility is to display an HTML representation of a single journal entry. Draw a few boxes to indicate that it is a list.
1. Individual entries. Each entry component will include a `Delete` button and `Edit` button.

1. A footer area that includes your name with a link to GitHub and copyright.