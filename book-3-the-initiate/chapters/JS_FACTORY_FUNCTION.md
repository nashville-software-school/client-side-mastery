# Factory Functions

## Why are you Learning This?

As part of your education in object oriented programming, learning about factory functions in JavaScript introduces you to a concept called composition. Composition is the process of combining simpler data structures into more complex ones.

It also introduces you to the concept of creating object instances, which you will cover in your server-side course by using classes.

## Definitions


First, a factory function is just a regular function. No syntactical difference. We've coined certain functions as factory functions simply because they return new objects.

Read more with the article "[What Are Factory Functions in JavaScript?](https://www.sitepoint.com/factory-functions-javascript/)"

Yes, this is a factory function.

```js
// This is a factory function. It returns a new object every time.
const createAmplifier = function (volume = 11, color = "Black") {
    return {
        "type": "Guitar Amplifier",
        "maximumVolume": volume,
        "caseColor": color
    }
}

const marshallAmp = createAmplifier(9, "White")
> { "type": "Guitar Amplifier", "maximumVolume": 9, "caseColor": "White" }

const blackstarAmp = createAmplifier(10, "Gold")
> { "type": "Guitar Amplifier", "maximumVolume": 10, "caseColor": "Gold" }
```

No.

```js
// Not a factory function. Primitive type returned.
const add = function (first, second) {
    return first + second
}
```

Yes.

```js
// This is a factory function. It returns a new object every time.
const createLocation = (name, address, type) => ({
    "businessType": type,
    "businessName": name,
    "address": address
})

const kennel = createLocation("Bow Wow Kennels", "100 Infinity Way", "Animal Boarding")
> { "businessType": "Animal Boarding", "businessName": "Bow Wow Kennels", "address": "100 Infinity Way" }
```

No.

```js
// Not a factory function. Primitive type returned.
const isLegal = (activity, age) => age >= activity.minimumAge

const socialActivity = {
    activity: "Buy alcohol",
    minimumAge: 21
}

const april = {
    name: "April Atkinson",
    age: 19
}

const canAprilDrink = isLegal(socialActivity, april.age)
> false
```

## Working for Kneel Diamonds

Kneel Diamonds is a jewelry store founded by James Kneel in 1937. It is currently owned and operated by his granddaughter Natasha Dimitrionov. It currently operates three physical locations around Nashville, TN and has 38 employees.

Natasha wants to expand her business to allow customers to commission works online, and have an online catalog of her existing inventory. A couple years ago, she figured she could do it herself, but her attempts quickly sputtered when she realized how difficult it was. She decided it was time to hire a professional developer to get it done correctly.

Your first day was yesterday. You completed all your paperwork, met everyone, and got all the software that you needed installed on one of their computers.

Today, you used your new key card to enter in through the back door, walked through the small kitchen and into the dark room off to the left in the back hallway. You flip on the lights and start your computer at 8:38 am.

> At 9:05, you hear the back door of the office open and hear Natasha's voice. She's discussing something with another person that arrived at the same time. Five minutes later, she briskly walks into your room, pulls up a chair next to you, crosses her legs and asks, "How are you this morning?"
>
> You tell her that you're fine and excited to build something.
>
> She nods and quickly gets to business.
>
> "I need you to build a web page with Java on it that lists all of possible options that we offer to make custom jewelry. The user can choose any of the options, and a new code object should be created to represent their custom piece of jewelry. The customer can create as many jewelry items as she likes, and add them to a cart, and the Java code should be able to calculate the total cost."
>
> "You mean JavaScript, right?"
>
> She looks up at your sharply, narrows her eyes, and quips, "I remember trying to do this! It was Java. Just use it for this web page."
>
> You realize that it's not a battle worth fighting, shrug your shoulders, and say, "Ok. I need to know what all of the options are for the customer to choose from."
>
> She smiles quickly. You're not sure if there was a hint of smugness in that smile or not. She stands up and says, "I'll be back in just a minute."
>
> You hear her heels clicking down the hallway, then some shuffling, a metallic clang, and then the heels again as she makes her way back to your office.



## Orders from Existing Inventory

> "The next order of business is getting current inventory available to be purchased," she says and reaches into her large purse to pull out a tattered, gray binder filled with laminated pages. She opens it to a random page and continues talking. "This binder has all of the items that we purchase from distributors to sell in all of our locations."
>
> You glance at the open binder and notice that it is open to a page with men's and ladies' wristwatches. You nod and mumble, "Ok."
>

## Practice: Doctors

> **Lightning Exercise 1:** Write a factory function that creates an object that represents a doctor. The function should accept three arguments.
>
>    1. Doctor's name
>    1. Specialty _(Oncologist, pediatrician, etc...)_
>    1. Address of practice


> **Lightning Exercise 2:** Write a factory function that creates an object that represents a pet. The function should accept two arguments.
>
>    1. Pet name
>    1. Pet breed
>
> Invoke the factory function 3 times and place each animal in an array stored in a variable named `BowWowKennels`

## Practice: Music Row

Your job is to sign each of these promising young music stars to the appropriate label.

* JumpStop Records works with Funk and Rap artists.
* Chatten Records works with Country and Bluegrass artists.
* Polar Records works with Pop artists.

Create an array for each of these record labels.

Create a factory function for each possible genre (_e.g. `createBluegrassArtist()`_). Then invoke the appropriate function for each of the following artists and place the resulting object in the corresponding label array.

* Bruce Atikins is a Country artist and is 23 years old
* Jensen Brown is a Pop artist and is 20 years old
* Dre Funkz is a Funk artist and is 25 years old
* Dusta Grimes is a Rap artist and is 21 years old
* Bartholomew Danielson is a Bluegrass artist and is 23 years old
* Avilee Dallas is a Country artist and is 19 years old
* Austin Kinkaid is a Pop artist and is 22 years old
* Loyoncé Branis is a Rap artist and is 27 years old
