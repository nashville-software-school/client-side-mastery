# The Glassdale PD Criminal API

For this book, you will be consuming the Glassdale Police Department Criminal API (http://criminals.glassdale.us) to help you do your job as a highly technical police detective.

## Setup

1. Install [Postman](https://www.getpostman.com/). You instruction team will walk you through the basics of usage.
1. If you are on a Mac or Linux, you need to get oh-my-zsh installed if you haven't yet. See an instructor for help if you need it.
1. If you are running Windows, we highly recommend that you get the LInux Subsystem running on your machine.


## Introduction

> While you are still getting settled at your new desk and Brady finally figured out how to get into your laptop, you walk over to your captain's door and rap your knuckles on it confidently.
>
> Silence...
>
> "Captain?" you ask with your face right in front of the door.
>
> More silence...
>
> _"I guess I'll try later..."_ you think to yourself, and wander back to your desk.
>
> Just as you sit down and type in your password to log into your laptop, you hear loud footsteps coming down the hallway next to the elevators on the other side of the room. Muffled voices are intermingled in with the strangely loud footsteps. Seconds later, a man and a woman turn the corner of the hallway, each with a drink and a snack in their hands, talking animatedly with each other.
>
> You watch, curious who they are.
>
> The woman catches your eye and says something to the man and extends her hand for a perfunctory handshake. She then turns to you and heads straight for your desk.
>
> You shift in your seat, and then decide to stand up to greet this person who is confidently striding towards you.
>
> "Well, well, well," she says with a bright voice and a wide smile. "This must be our newest detective - the transfer from Chicago!"
>
> "Um, yes, my very first day." You introduce yourself and extend your hand, just as she did for the man a few moments ago.
>
> "So nice to meet you. I'm Captain Debrowski. Margaret Debrowski, but everyone just calls me Maggie." She shakes your hand enthusiastically.
>
> Captain Debrowski... Maggie... sits down in the aluminum chair with the awful green padding on the other side of your desk. You sit back down along with her. She grabs the case file and turns it towards her for a brief review.
>
> "Ah, yes, the extortion mystery." Her brows furrow as she looks at Carl's photo, and she says solemnly, "I just can't imagine who would do something like this to Carl and the other shop owners downtown. There isn't a single soul in this town who doesn't know Carl, or one of his boys."
>
> She turns the file back around and looks up at you. "It just about ruined him," she says with a dark look on her face.
>
> "Did all of the shop owners have insurance?" you ask.
>
> "All but one. Nellie Freemon ran her antique and oddities store, but never had the sense to get additional, commercial crime insurance. Of course, her business was only extorted once." She lowers her voice and says gently, "She never did have much revenue, so I guess it just wasn't worth their time to extort what she couldn't make."
>
> That sounded like good knowledge, so you reach quickly for the pen on your desk, click it open and scribble a note in your notepad.
>
> Maggies smiles blandly. "Oh, it's all there in the file." She waves at the folder.
>
> "So the chief said I should talk to you to get started?" You ask after a brief pause.
>
> "Oh yes! So we have this thing called an API that a couple interns built for us about a year ago. It has a record of all criminal activity in this town dating back to, oh, about 1989. I was thinking you could start using it to find out some clues about who are possible suspects at the time of the crime." She then looks at you expectantly.
>
> "Sure, let me look at it for the afternoon and see if I can start getting the data from it into something we can use."
>
> Maggie taps the table and says, "Great. Grab me before the end of the day and show me what you have."

## Assignment

Your first assignment is to pull all of the data from the API (see above) and display all criminals in a grid format. Start with the following details for each criminal.

1. Name
1. Age
1. Conviction
1. Dates of incarceration

![grid layout of criminals](./images/glassdale-assignment-1.png)

### Tips

1. Use the `toLocateDateString()` method on the dates to get the date in a more human readable format. Example below.
    ```js
    ${new Date(criminal.incarceration.start).toLocaleDateString('en-US')
    ```
1. Create your criminal provider component, criminal list component, and criminal component in the `scripts/criminal` directory.
1. The criminal provider component should have the following collections and functions.
    ```js
    let criminals = []

    /*
        Should you just export the private array as is?
        Should it be sorted in some way?
    */
    export const useCriminals = () => criminals

    export const getCriminals = () => {
        // Load database state into application state with a fetch()
    }
    ```