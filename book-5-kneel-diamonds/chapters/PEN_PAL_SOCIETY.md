# Advanced Learning with Forms

This project is for those who wish to learn the basics of working with forms, and deepen their knowledge of async operations and state.

1. Form fields
1. Collecting user input
1. `fetch()` and `then()`
1. Asynchronous state management

## Demo

<img src="./images/pen-pal-society-demo.gif" width="800px" alt="Animation of Pen Pal Society application" />

## Features

### User can choose an author

**Given** a pen pal wants to send a letter<br/>
**When** the Pen Pal app loads<br/>
**Then** there should be a select element that displays all pen pals to choose for the author

### User can choose an recipient

**Given** a pen pal wants to send a letter<br/>
**When** the Pen Pal app loads<br/>
**Then** there should be a select element that displays all pen pals to choose for the recipient

### User can choose a letter topic

**Given** a pen pal wants to send a letter<br/>
**When** the Pen Pal app loads<br/>
**Then** there should be a group of radio buttons for the user to choose a topic

### User can enter the letter body

**Given** a pen pal wants to send a letter<br/>
**When** the Pen Pal app loads<br/>
**Then** there should be textarea element in which the user can type in the letter body

### User can save letter

**Given** a pen pal wants to send a letter<br/>
**When** the Pen Pal app loads<br/>
**Then** there should be button labeled Send at the bottom of the form<br/>

---

**Given** a pen pal is done writing a letter<br/>
**When** the pal clicks the Send button<br/>
**Then** the letter should be saved in the API database<br/>
**And** the new letter should immediately be rendered in the list of letters below the form<br/>
**And** the rendered letter should display the following information

* author
* recipient
* date sent
* email address of author/recipient
* topic of letter

## Optional Advanced Challenge

Think you have a strong understanding of asynchronous operations using `fetch()` and `then()`? In the mood to stretch your coding skills and take on a challenge? Once you complete the assessment given the features listed above, you have the option of taking on this challenge.

<img src="./images/pen-pal-society-multiple-tags-demo.gif" width="800px" alt="animation of choosing multiple topics for a letter" />

### User can choose multiple letter topics

**Given** a pen pal wants to send a letter<br/>
**When** the Pen Pal app loads<br/>
**Then** there should be a group of checkboxes for the user to choose one, or more, topics

### User can save letter with multiple topics

**Given** a pen pal is done writing a letter<br/>
**When** the pal clicks the Send button<br/>
**Then** the letter should be saved in the API database<br/>
**And** the new letter should immediately be rendered in the list of letters below the form<br/>
**And** the rendered letter should display the following information

* author
* recipient
* date sent
* email address of author/recipient
* all topics chosen