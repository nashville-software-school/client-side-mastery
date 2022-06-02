# Glassdale PD: Cold Case Cyber Police

>"Maybe relocating to Glassdale won't be bad after all," you think as you enter the newly built police station in the center of town.
>
>But the truth is, you're just trying to muster up even the tiniest bit of a good attitude after you feel like you've been ripped from your favorite job so you could live in this tiny town to take care of your elderly step mother. You moved this past weekend from Washington D.C. where you worked on cyber cases with the National Cyber Investigative Joint Task Force and now have, unfortunately, 'downgraded' to a Detective job with the local police force.
>
>Shaking your head you think to yourself, "There's no way this new job will be anywhere near exciting as working to catch cyber terrorists every day..."
>
>As soon as you enter the building, Police Chief Renee Weston welcomes you with a large smile and a firm handshake.
>
>"Welcome! I can't tell you how excited we are to have a person of your expertise joining our team. We have a lot going on around here so I'll fill you in as we walk to your new office."
>
>You half-heartedly mutter back, "Um, yeah. Thanks. I'm glad to be joining the team."
>
> "Perfect! Well, let's get you set up with your laptop because I have the perfect job for you to take on for this first week," Renee excitedly says.
>
> Immediately, Renee dives into your new assignment, "So, we have this cold case... Five years ago, Glassdale's local businesses were being extorted for 'protection' money over a six month period. Until one night, where one brave shop owner, Carl, finally notified the police when he refused to pay our perp. After reporting it to the police,  Carl returned back to his shop where our masked perp was waiting for him with a loaded gun and threatened to kill him if he didn't pay up."
>
> She takes a long sip of her coffee and opens a manila folder she placed in front of you and turns to a photo. You assume that it's Carl.
>
>  She points at the photo and continues, "Carl was, thankfully, able to run and escape. Later that night, the perp broke into the business and emptied the registers and the safe."
>
> Renee pauses, raises her eyebrows slightly, and says, "Revenge for going to the police."
>
> You're able to utter one shocked "Wow..." before Renee dives back into your assignment, "No one was ever able to solve it, and I'm hoping now that we have shifted all of our crime data from paper documentation to our new criminal database that you'll be able to use all of those fancy coding skills of yours to solve it."
>
> You smile ever so slightly at how she said _"fancy coding skills"_, but recover in a split second.
>
> "Damn, that's a lot to digest on my first day but I'm up for the challenge and glad I can help out!" you reply eagerly, still shocked that this quiet, small town was victim to such an insane extortion scandal.
>
> The police chief slaps the manila folder with satisfaction and a glint in her eyes. "Believe me, we're glad to have you on our team."
>
> She stands up, pulls a laptop from the desk behind yours and hands it to you. "This is yours now. Brady down in procurement has all the details of how to get into it."
>
> You take the laptop in both hands and stare at it for a few seconds. It looks like it's been around the block a few times, and it's heavier than any laptop you've ever owned.
>
> Renee starts to walk away and flatly says, "Review that case file. Get your laptop set up, and then go talk to Captain Debrowski." She points to an office in the corner of the floor with its door shut.
>
> You sit down at your clunky desk that's probably been around since the 80's. For the first time since you arrived in Glassdale, Illinois, you feel the slightest tinge of excitement for this new step in life.

In this book, you will be using your _fancy coding skills_ to review all of the evidence for the case that the police chief handed off to you. The data exists, but you will be writing code that will help you filter through the data and find relevent hints that are hidden in it as you grow your skills.

## Setup

1. Create the `~/workspace/glassdale` directory with the `mkdir` command.
1. Create the following directory structures.
    1. `~/workspace/glassdale/api`
    1. `~/workspace/glassdale/scripts/criminals`
    1. `~/workspace/glassdale/scripts/convictions`
    1. `~/workspace/glassdale/scripts/officers`
    1. `~/workspace/glassdale/styles`
1. Create your `scripts/main.js`, and `styles/main.css` files.
<<<<<<< HEAD:book-2-glassdale-pd/chapters/GLASSDALE_PD_INTRO.md
1. Run the command `npm i -g json-server` to install a tool we'll use later. If you get any error messages, come see an instructor.
=======
>>>>>>> upstream/master:projects/tier-3/glassdale/chapters/GLASSDALE_PD_INTRO.md
1. Make an `index.html` file in `~/workspace/glassdale` directory. You are provided some boilerplate HTML below to place in that file.
1. Start your web server and verify that you get that HTML in Chrome.

#### Boilerplate HTML

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles/main.css">
    <title>Glassdale PD</title>
</head>
<body>


    <section class="criminals">
        <h2>Criminals</h2>
        <div class="convictions-select-container"></div>
        <div class="criminal-list flex-container">

        </div>
    </section>



    <script type="module" src="scripts/main.js"></script>
</body>
</html>
```