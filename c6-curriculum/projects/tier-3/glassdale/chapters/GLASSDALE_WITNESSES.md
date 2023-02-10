# Checking Witness Statements

## Before this chapter...

- `fetch()`
- Array methods
- Iteration
- Custom events

> Maggie is grumbly today, you think. When you saw her get out of her pickup truck this morning, you could hear her slamming the door from inside.
>
> You wander in to her room, holding your laptop, to show her your progress so far. She barely glances at you and she moves papers and photos around on her desk.
>
> She asks, quickly, "What's up?"
>
> You get the hint and get straight to the point.
>
> "I've got case notes being automatically saved electronically, and anyone can now quickly review the statements provided by each perp's known associates. Eventually I'll want to let any search the notes, but that's later." You open your notebook and let her quickly scan what she's looking at.
>
> "Looks good," she says, abruptly.
>
> "Any suggestions what to do next?" For some reason you start to feel uneasy. Of course, being around other people who are on edge has always made you uncomfortable.
>
> "Yeah. Witnesses. I want to see all of the witness statements for an entire case." Maggie seems to be getting more irritated each moment that goes by. She looks up at you again and sees the look on your face. She sighs quickly, and adds, "Look, this auto theft case I'm working has me all kinds of aggravated. I need to get to the bottom of it, and I'm not making much progress."
>
> "No worries, Maggie. I'll get started on witness statements," you say cheerily, hoping it will help her mood.

In this chapter, you will be refactoring your application to implement a new button that will allow you to review all witness statements. The witness data is at the URL https://criminals.glassdale.us/witnesses. Place a button in the UI labeled "Witness Statements".

When the user clicks the button, you should request all witnesses and display the following information. If criminals are currently rendered, this information should take its place.

1. The name of the witness.
1. Their statement text.


## Getting Started

1. Which components do you need to create for this feature?
1. Where is the data coming from in the API? Do you need a new provider?
1. Which component should listen for the click event on the "Witness Statements" button?
1. Which DOM element would contain the list of witness statements? Do you need a new one, or can they go in an existing one?
