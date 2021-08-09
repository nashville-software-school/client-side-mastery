# Big Fish, Little Fish - Filtering Source Data into Smaller Arrays


### Why Are You Learning This?

Filtering is a very common process that applications provide for their users. Think of Amazon, or Etsy, or really any site that sells a large number of products. They always provide a way to filter their list of products to help you find products that match your likes.

* Filter by price
* Filter by category
* Filter by color
* Filter by size
* etc...

## Vocabulary to Learn
* Array Loop: `for...of`
* Array iteration methods
* Conditional statement


### Filtering with a for..of Loop

One thing that many people despise is when they discover that a sock was devoured by the Dryer Monster. It's been a while since you did laundry, you get out of the shower, put on some nice black pants and start searching in your socks drawer for some black socks. A minute later, you realize that there is only 1 black sock left.

How did that happen? I just put all my black socks through the wash last time and I counted out 8 of them. How do I only have 7 now?

```js
const socks = ["white", "brown", "white", "black", "blue",
"white", "brown", "white", "white", "white", "brown", "white",
"black", "white", "black", "brown", "black",  "white",
"brown", "white", "black"]

/*
    From the source data, which should never be modified,
    filter out each color of socks into its own array
*/
const brownSocks = []
const blackSocks = []
const whiteSocks = []

for (const sock of socks) {
    if (sock === "brown") {
        brownSocks.push(sock)
    } else if (sock === "black") {
        blackSocks.push(sock)
    } else if (sock === "white") {
        whiteSocks.push(sock)
    }
}
```

## Martin's Mayan Vision

> A year has gone by since you built, and got paid for, Martin's fish site. You had nearly forgotten all about Martin and his odd requests until two nights ago when you received a strange phone call.
>
> _"Hi, it's Martin, and I really need to talk to you about my site. Something important has come up and I need some changes right away,"_ he said in his hurried phone message. While he's talking, you hear a loud whirring, or whooshing, in the background. It makes it hard to understanding a few words in his message.
>
> He continues in a rushed voice, "Look, I'll ***** home by tomorrow ***** and I'll meet ***** place at 7 pm. Coffee's on me this time."
>
> That's the end of the message. You gather from how he ended it that he wants to meet at your usual coffee house to discuss his new idea.
>
> The next night, you are sitting at your usual table when Martin's comes blustering into the coffee house. He looks different.
>
> His usual neat appearance is gone. His hair is disheveled, and looks oily, you notice. His clothes are wrinkled and he is wearing boots covered in caked mud.
>
> He spots you and hurriedly comes to the table and sits down. In a breathless voice, he makes his request.
>
> "I've made the most amazing discovery. It's going to turn the world of fish harvesting and care on its head." He runs his hand through his slick hair and says in a lowered voice, "I just returned from a trip to the Caribbean where I took a day trip inland to see the ruins of the city of Tikal."
>
> "Wow, I've heard that it's beautiful. Do you have any..." he cuts you off mid-question.
>
> "As I was deep inside one of the ruins, I wandered down this hallway. At the end was this enormous engraving of a fish. Only it wasn't just a fish. It was a logoglyph surrounded by other ones." Martin's eyes grow large and unfocused as he continues to recount his tale.
>
> "Somehow, I just could understanding the writing, even though I'd never seen it before."
>
> Your mouth drops open, even as you eyes narrow as you slowly start to suspect that Martin may have eaten some special herbs or mushrooms on his trip.
>
> "It described the Holy Fish Jutz'kar and his followers. The most holy of his followers were always a multiple of 3 inches in length. They cared for Jutz'kar and fed him. The next holy were his soldier fish - swordfish - and they were all multiples of 5 inches in length. Some were even as large as 250 inches!!"
>
> You grow more skeptical and say, "Um, aren't sword fish a lot longer than..."
>
> It's like Martin has forgotten you are even sitting next to him. He continues, "So my site needs to pay homage to the Great Fish Jutz'kar and his servants. Any fish that is a multiple of 3 inches in length must be shown first. Then fish that are multiples of 5 inches must be shown next.
>
> "What about fish that aren't that size?" you ask curiously.
>
> Martin gives you a strange look, and for a second, you're afraid that he might say, _"There won't be any of those... soon."_, but he just waves his hand and says, "Display the rest in any order, since they are unworthy."

Remember, Martin always pays his invoices promptly, so regardless of his strange requests, you promptly get to work. You wonder how to go about displaying fish the way he wants.

Luckily, you know about the [remainder operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Arithmetic_Operators#Remainder) in JavaScript. Using this operator, the following code will only display even numbers.

##### Example

```js
const numbers = [4,1,5,8,6,4,2,2,4,6,7,7,8,9,7,5,3,2,1,3,4,2,1,3,5,7,76,5,9,4,23,5,3,2,6,8,98,65,3,1,3,4]

// Only display even numbers
for (const number of numbers) {
    if (number % 2 === 0) {
        console.log(number)
    }
}
```

## Goal

You need to build three functions in your fish data module. One to return an array of fish that are multiples of 3 in length, one for multiples of 5, and one for all others.

Some starter code is provided below. Use the example code blocks above to have each function filter out the appropriate fish.

```js
export const getMostHolyFish = () => {
    // 3, 6, 9, 12, etc... fish
    const holyFishArray = []

    for () {

    }

    return holyFishArray
}

export const getSoldierFish = () => {
    // 5, 10, 15, 20, 25, etc... fish
    return soldiersArray
}

export const getUnworthy = () => {
    // Any fish not a multiple of 3 or 5
    return unworthyArray
}
```

## Refactor the FishList
The FishList will need to invoke the three functions responsible for sorting and returning the fish arrays. Be sure to import each FishData function. You will then need to display each list in the order specified by Martin.

