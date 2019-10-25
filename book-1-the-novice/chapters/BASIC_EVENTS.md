# Martin's Minimal Mockup

> After an "urgent" email from Martin, you have agreed to meet him again at the coffee shop. He has "critical information" to show you that he "thought he made clear the first time we talked." Just thinking about the email makes you sigh heavily as you pull into a parking spot and then head towards your meeting.
>
> You can the shop and see Martin in the back furiously scribbling on a legal pad, and head over to meet him. He greets you without smiling and turns his legal pad towards you, and blurts out, "We have a problem with the site."
>
> You blink, and say, "Ok, what's the issue?"
>
> "I said I wanted a nice, clean site and right now I think it's way too 'busy'. Here's what I want."
>
> He takes his pencil and makes a stabbing motion towards the legal pad and says, "There's too much information on the page when it shows up. I was on the 'For the Halibut' web site and I noticed that they had these buttons that I could click on which showed these little windows in the middle of the screen."
>
> "Oh, those are called dialogs," you interject patiently.
>
> He glances at you quickly and nods his head in apparent understanding and continues, "So I'd like to have these 'dialogs', as you call them, show the species, location harvested, and the food they eat show up when the button is clicked."
>
> He points again at his legal pad, "I kind of drew it up for you so that you would know how this all works."
>
> You bristle internally. Hopefully it's not obvious to him. Then you realize that he's not really paying attention to you, as so much as he's lecturing you.
>
> You glance at his mockup.
>
> "See?" he says. "Much more minimal and clean, just like I originally wanted!" He forces a smile as if that wipes away his condescension.

![martin's minimalism mockup](./images/martin-minimal-mockup.png)

> "I see now," you say as calmly as you can. "I can make those changes today."
>
> "That would be great," Martin says, emphatically. "Send me an email when it's ready to go."

## HTML Dialogs

Implementing a dialog box is a straightforward process in the browser. There is a `<dialog>` element implemented in the Google Chrome browser. It's not fully supported in all browsers yet, but since we're using Chrome, we'll go ahead and use it.

First, each of your fish components needs to have a corresponding `<dialog>`

```html
<div class="fish">
    <div><img class="fish__image"
            src="https://3.imimg.com/data3/IW/XT/GLADMIN-105863/fish-125x125.jpg"
            alt=""></div>
    <div class="fish__name">Bart</div>
    <div><button id="button--bart">Details</button></div>

    <dialog class="dialog--fish" id="details--bart">
        <div>Species: Orange Clownfish</div>
        <div>Location: Caribbean</div>
        <div>Food: Algae, crustaceans</div>

        <button class="button--close" id="close-bart">Close Dialog</button>
    </dialog>
</div>

```

Create a new JavaScript module named `dialogs.js` whose Single Responsibility will be to manage the showing and hiding of the digalog windows in the application.

```js
const allDialogs = document.querySelectorAll(".dialog--fish")

document.querySelector(".button--close").addEventListener(
    "click",
    theEvent => {
        for (const dialog of allDialogs) {
            dialog.close()
        }
    }
)
```

Add one of these for every fish that you create. Replace the CSS selector, but nothing else needs to change.

```js
document.querySelector("#ivan-button").addEventListener(
    "click",
    theClickEvent => {
        theDialog = document.querySelector("#ivan-details")
        theDialog.show()
    }
)
```