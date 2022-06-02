# Checking Alibis

## Before this chapter...

- `fetch()`
- Arrays & array methods (`.find()`, `.map()`, etc.)
- Iteration
- Custom events

> Now that you have the application able to find likely suspects, and you can start keeping notes as you investigate, you realize the next step would be to review statements from key people in the investigation.
>
> You see, with pleasure, each criminal invesitgation in the past kept a record of interviews with each criminal's known associates at the time of the crime.
>
> _"Hm, not a whole lot of information, though,"_ you think to yourself as you look at the data. You see that only a brief statement was recorded from each known associate that provided an "alibi" for the criminal at the time of questioning.
>
> You decide to talk to Chief Watson. Maybe there is more information written down somewhere, and someone was just lazy when entering it into the API database.
>
> You track her down about ten minutes later, and she greets you warmly. "I hear you've been doing great things with the computer and the code and stuff!" You smile, bemused by _"stuff"_.
>
> You say, "Yes, I'm starting to make progress and keeping notes about information I find that I think is relevent, but I just discovered something I need to talk to you about."
>
> She raises her eyebrows and says, "Hm? What's that?"
>
> You explain how there's very little recorded in the data about the alibis provided by the known associates for each criminal. "Are there paper files that I can review and see if there's more information?" you ask.
>
> Chief Watson shakes her head. "Sorry, for better or for worse, when the Commissioner went on his Digital Police crusade," she emphatically uses her fingers to make air quotes, "he wanted all paper records replaced with digital ones. So we got rid of all the hand-written notes at the time."
>
> She slightly shrugs and continues, "You'll have to go with what's in the computer."
>
> She starts to walk away, but as she leaves, she half-yells, "I need to get help Maggie with her auto theft case, so I'll talk to you later!"
>
> With an internal sigh, you head to the coffee machine on the way to your office. Outside, you see Chief Watson talking to Maggie in her pickup truck. You then head to your office to go with what you've got.

## Goal

In this chapter, you will be refactoring your application to implement a new button on each criminal representation. The button must be labeled "Associate Alibis". Give each button a unique id by interpolating the `id` property of the criminal in the value.

```html
<button id="associates--${criminal.id}">Known Associates</button>
```

When the user clicks the button, you must iterate the array of `known_associates` for that criminal and then display the following information. You can display it in a dialog box, as a sidebar, at the top of the screen, or wherever you like.

1. The name of the known associate
1. The alibi that the known associate is providing for the criminal to try to prove the criminals' innocence.

If any of the alibis for some of your suspects are noteworthy, then make sure you create a new notes and POST it to your personal notes API.

## Getting Started

1. Which components do you need to create for this feature?
1. Where is the data coming from in the API? Do you need a new provider?
1. Which component should listen for the click event on the Alibis button?
1. What should happen when the button is clicked?
1. Which DOM element would contain the list of alibis? Do you need a new one, or can they go in an existing one?
