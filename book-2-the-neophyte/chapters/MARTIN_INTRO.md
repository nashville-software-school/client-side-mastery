# Project: Fish in my Aquarium

Let's build a couple HTML pages whose user will be an avid rare fish collector who maintains a sophisticated tank in his home. His name is Martin. Martin meets you at a local coffee and explains what he needs to have on his web site.

> "So nice to meet you finally after all of those emails. Please, grab a chair," says Martin. He uses his leather loafer to gently nudge a chair slightly away from the table. He subtly waves his hand towards the chair in invitation.
>
> You smile, pull the chair and out and start to slide your computer bag from your shoulder.
>
> "Thanks, Martin."
>
> You put your bag on the floor next to the chair and put your cup of coffee in the middle of the table, not far from Martin's. You note briefly that Martin got the largest size that the coffee shop offer, and it appears to be a latte.
>
> "I'm glad to be able to help you build a site to track your amazing fish. When you sent me that email the other day listing all the ones that you have collected, I spent all night researching them. It was fascinating!" you exclaim.
>
> Martin smiles widely, obviously pleased that you appreciate his achievements with his hobby.
>
> You continue to pull your notebook and a pen out of your bag, and ask, "So you said that you wanted two different pages for this site, one that lists the fish you currently own, and another one that lists all the places that you've visited to collect the fish..."
>
> "Harvest the fish," Martin interjects with a forced smile.
>
> "Sorry, where you harvested the fish." You restrain an eye roll.
>
> You shift in your seat because the hard, wooden chairs are already becoming uncomfortable, and continue, "Is there anything you've thought of based on the example sites I sent you?"
>
> Martin leans forward and put his hands on the table, "Actually yes. On the _'Fish Upon A Star'_ site, they had this content on the right side of the list of fish that explained the process of keeping the tank clean and the water at the right salinity and temperature. I'd love to have that so I can put my thoughts in there."
>
> You take notes as he talks and make sure that you jot down the you will need an `<aside>` element on that page.
>
> "All the sites had a navigation bar at the top. I'd like to have a navigation bar. Were you planning on having a navigation bar?" It's clear the way Martin places an emphasis on _navigation bar_ that he's proud that he knows what that's called.
>
> You smile slightly and say, "Oh absolutely. Any web site that has more than one page would definitely need one of those."
>
> Martin smiles smugly and says, "I thought so. Just make it look clean and minimal."
>
> _"Martin's been doing a little research on web stuff,"_ you think as you pointedly write down 'Must have nav bar' in your notes.
>
> He patiently waits for you to finish jotting down these important notes, and then says, "Lastly, the _'Buoys and Gills'_ site had a part that listed travel tips for people who love to scuba and harvest fish. On the page that lists all of the out-of-the-way places I've visited, I would like to provide a few quotes to help people."
>
> "Where would you like that to appear?" you ask briskly.
>
> Martin responds, "Right under the navigation bar, and before the list of locations."
>
> You note that in your journal, then ask, "Ok, I just want to make sure I get this right for you. The details of each fish should include the image, the species, its length, what you named the fish, where you harvested it, and what it eats... is that all correct?"
>
> "That sure is," he says confidently and leans back in his chair with his arms behind his head.
>
> "Perfect!" you exclaim and then ask him if there's anything else he can think of now.
>
> "No, I think that's enough to go on for now. Just make sure it's tasteful, since I'm fairly sure that I'll get lots of visitors to the site."
>
> _"Of course you will,"_ you think as you smile and say, "I'll make sure all those people have a great experience on your site."
>
> You both shake hands and you head back home to start work on the site.

## Developer Vocabulary

> **Vocabulary:** Imagine a chair. Now imagine that you have to write a poem or other paper about the chair you have in your mind. How would you describe it? It could be a tall, white chair. It could be uncomfortable. You could say when you purchased it. When you describe something, you often list its properties. A property of something is just a specific feature of that thing. In the short description above, here are the properties of the chair you were imagining.
>   1. Height
>   1. Color
>   1. Comfort level
>   1. Date of purchase

## Discussion Points

1. What are the components (_navigation bar, list of fish, etc._) on the web page?
1. What are the properties of each fish that you will be representing in your HTML?
1. What are the properties of the fish care tips that Martin wants on the side?
1. What are the properties of the locations Martin has visited?
1. What should be the CSS class names for each?
1. Which semantic tags should you use?
1. How can we use Flexbox to build a better layout of fish and locations?
1. Which CSS files should be created? Consider the [@import](https://www.w3schools.com/csSref/pr_import_rule.asp) keyword to modularize your styling.

## Initial Goal

Create the directory for building a site for Martin's Aquarium. Use the following commands. It doesn't matter where you are in the terminal.

```sh
mkdir -p ~/workspace/martins-aquarium/scripts/fish
mkdir -p ~/workspace/martins-aquarium/styles
cd ~/workspace/martins-aquarium
touch index.html
touch scripts/main.js
touch styles/main.css
```

In the `index.html` file you are going to build a web page that lists fish in the main content area, and then some fish/tank care tips on the right side of the page. Below the list of fish, create another content area to list the locations Martin has been to, and his travel tips for each one.

Start with a wireframe. You can use an online tool for this, like sketchboard.io, but often all you need is paper and a pencil to draw boxes with some captions for where each piece of content is going.

Your instruction team will provide guidance on this.

## Building Together

Your instruction team will lead the class through the construction of the this site. You may follow along, or you can just close your computer and watch what gets built and offer your suggestions.

Once the initial site is constructed, it is your job to add 5 more fish to Martin's Aquarium. Don't spend any significant time thinking of rare fish. You can even duplicate the HTML to make the fish for now.