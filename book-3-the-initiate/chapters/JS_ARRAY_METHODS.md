# Shaping Data with Array Methods

## Why are you Learning This?

Since one of your primary jobs as a software developer will be to filter, transform, organize, sort, and then display collections of data, you will need to know how to use some of the helpful methods that software development languages provide to perform those operations.

Up until now, you have relied upon the base `for` loop mechanism in JavaScript. These array methods will let you perform more advanced operations on collections with far less code.

During this lesson, you will be helping Doris. Doris owns a paper distribution and services franchise of Dotard & Simbleton. While she operates a paper franchise, she realizes that far too much of her operation is done on paper and she needs to start building software to automate processes and eliminate waste.

To help solve her problems, you will use the following methods that are automatically available on any array in JavaScript.

1. `forEach()`
1. `filter()`
1. `map()`
1. `find()`
1. `reduce()`
1. `sort()`

## Your First Day at Dotard & Simbleton

It's your first day on the job, and Doris sits with you at your desk and talks about what she needs you to do.

> "Thank you for joining the team! We really need your help," she says as she drops a huge pile of paper on the corner of your desk, making a deep *thud* sound.
>
> "This is a list of all companies that have active accounts for purchasing any kind of paper from Dotard & Simbleton. What I need you to do is make it electronic."
>
> She waves her hands vaguely, and follows up with, "Like a web page, or something!"
>
> You blink at her, not even knowing how to respond.
>
> Doris smiles weakly, stands up and blurts out, "Well... you get started on that and let me know when you're done."
>
> You stare at the giant, multi-colored pile of papers trying to decide what just happened, and how you're going to do this. After a minute of staring, you hear a gentle voice behind you.
>
> "Hey there, we actually have those recorded on a hard drive. You don't have to do that part."
>
> You turn around and see a tall, spindly man with thinning hair, blue trousers, a wrinkled white dress shirt, and blue suspenders. While sizing him up, you ask, "Um, what hard drive?"
>
> He smiles and points at your desk. "It's in your top drawer there. I'm Howard, by the way, nice to meet you," as he leans towards you with his hand extended.
>
> You shake his hand - firmly you hope - and he wheels his chair over and helps you connect the drive to your machine. He explains that Doris' niece spent the last summer trying to do what you've been hired to do, but only got as far as entering in the active businesses, and the sales for the last 2 years.
>
> As you open the files on the hard drive, here's what you find in one of them.

Each file contains an array with 15 objects in it. Each each object represents one active customer. It details the address, purchasing agent, and the total dollar amount of that company's last 5 orders.

```js
const businesses = [
  {
    purchasingAgent: { nameLast: "Kirlin", nameFirst: "Kristy" },
    phoneHome: "089.129.2290 x9400",
    orders: [7826.96, 8323.11, 5756.28, 6308.42, 5622.28],
    companyName: "Care-media",
    companyIndustry: "Education",
    addressZipCode: "56839",
    addressStateCode: "WI",
    addressFullStreet: "8417 Franklin Court Tunnel",
    addressCity: "Mouthcard"
  },
  {
    purchasingAgent: { nameLast: "Steuber", nameFirst: "Kamron" },
    phoneHome: "(833) 222-7579 x5874",
    orders: [6252.5, 9769.02, 9521.17, 7994.05, 7945.93],
    companyName: "Stanholding",
    companyIndustry: "Hospitality",
    addressZipCode: "09705",
    addressStateCode: "NY",
    addressFullStreet: "2889 Fawn Court Garden",
    addressCity: "Fellsmere"
  },
  {
    purchasingAgent: { nameLast: "Gutkowski", nameFirst: "Kaylee" },
    phoneHome: "235.266.6278",
    orders: [7634.43, 9766.72, 9953.45, 6559.8, 5054.9],
    companyName: "Highnix",
    companyIndustry: "Agriculture",
    addressZipCode: "49376",
    addressStateCode: "ME",
    addressFullStreet: "5734 Maple Avenue Throughway",
    addressCity: "Little Genesee"
  },
  {
    purchasingAgent: { nameLast: "Crona", nameFirst: "Lauren" },
    phoneHome: "1-449-987-3083 x23263",
    orders: [7384.52, 9252.72, 7272.65, 5251.84, 9680.08],
    companyName: "Conit",
    companyIndustry: "Defense",
    addressZipCode: "53326",
    addressStateCode: "IL",
    addressFullStreet: "5755 Hillside Drive Crossroad",
    addressCity: "Norval"
  },
  {
    purchasingAgent: { nameLast: "Krajcik", nameFirst: "Elvera" },
    phoneHome: "1-730-411-8580",
    orders: [6069.05, 8535.38, 5782.7, 7838.91, 7578.36],
    companyName: "Dong-tom",
    companyIndustry: "Energy",
    addressZipCode: "67071",
    addressStateCode: "KS",
    addressFullStreet: "4826 Arch Street Lights",
    addressCity: "Newburyport"
  },
  {
    purchasingAgent: { nameLast: "Kling", nameFirst: "Ellie" },
    phoneHome: "(868) 043-0950",
    orders: [6726.2, 8393.21, 8087.13, 6393.13, 8646.35],
    companyName: "Dan-dox",
    companyIndustry: "Manufacturing",
    addressZipCode: "98842",
    addressStateCode: "WV",
    addressFullStreet: "9767 Cedar Court Corner",
    addressCity: "Prince George"
  },
  {
    purchasingAgent: { nameLast: "Robel", nameFirst: "Otilia" },
    phoneHome: "(298) 305-1942 x53653",
    orders: [8676.05, 7430.69, 9379.81, 8074.29, 5998.75],
    companyName: "J-base",
    companyIndustry: "Health care",
    addressZipCode: "72993",
    addressStateCode: "FL",
    addressFullStreet: "9954 Buckingham Drive Mountains",
    addressCity: "Vesper"
  },
  {
    purchasingAgent: { nameLast: "Gusikowski", nameFirst: "Karolann" },
    phoneHome: "(743) 934-8981 x692",
    orders: [8650.08, 8042.69, 5555.72, 7467.86, 8851.43],
    companyName: "Span-fix",
    companyIndustry: "Construction",
    addressZipCode: "59860",
    addressStateCode: "MT",
    addressFullStreet: "4151 Orange Street Extension",
    addressCity: "Little Rock Air Force Base"
  },
  {
    purchasingAgent: { nameLast: "Hartmann", nameFirst: "Zena" },
    phoneHome: "727.635.6610 x6483",
    orders: [9415.89, 8935.45, 7413.91, 6830.96, 9746.57],
    companyName: "Sanaplane",
    companyIndustry: "Information",
    addressZipCode: "85156",
    addressStateCode: "NY",
    addressFullStreet: "4765 Fairview Avenue Locks",
    addressCity: "Dennisville"
  },
  {
    purchasingAgent: { nameLast: "Torphy", nameFirst: "Celia" },
    phoneHome: "(992) 079-1670 x71569",
    orders: [7431.21, 5911.85, 7954.86, 7141.52, 8416.79],
    companyName: "Ran-taxon",
    companyIndustry: "Manufacturing",
    addressZipCode: "96673",
    addressStateCode: "MD",
    addressFullStreet: "7157 Hudson Street Ford",
    addressCity: "Watrous"
  }
];
```

## forEach() Method

So Doris just wants to see all of the business names on a web page. You remember that the `forEach()` method on an array iterates the array and you can write logic for what to do for each item in it. You just want to build some elements to put in the DOM to look like this.

![list of businesses](./images/dotard-simbleton-simple-list.png)

Since each object is identical in its structure (but not its state), you can write some automation logic with `forEach()`.

```js
const outEl = document.querySelector("#output")
outEl.innerHTML = "<h1>Active Businesses</h1>"

businesses.forEach(business => {
  outEl.innerHTML += `
    <h2>${business.companyName}</h2>
    <section>
      ${business.addressFullStreet}
    </section>
  `
  outEl.innerHTML += "<hr/>"
});
```

> **_Lightning Exercise:_** Add another section sibling to the current one and use object dot notation to display each company's city. Use square bracket notation to display the  state code. Use dynamic square bracket notation to add the  zip code.

## filter() Method

Now you have code to show web pages for each of the businesses that have active accounts. You call Doris over and show her the results, and she's very excited.

> Doris leans forward in her seat, eyes bright, and exclaims, "Yes! This is exactly what I need!" She starts to scroll through all of the businesses, clearly enjoying her new toy.
>
> After several minutes of this, she abruptly stops and turns her head quickly in your direction, eyes wide. "You know, my regional manager, Barry has been asking me for something for months now. He has a new sales rep in New York and wants to check how many sales are being made in that state. So out of all these businesses, I need to see only the ones in New York."
>
> She turns her head towards the computer, narrows her eyes slightly and asks in a low voice, "Can you do that?"
>
> Unsure why she needed to ask in such a dubious manner, you confidently respond that you can. She smirks, takes out her cell phone, and walks back to her office while dialing a number...

For a task like this, the array `filter()` method is perfect, because you need to look at each object in the businesses array, check to see if it meets Doris' condition, and if it does, place that object in a new array that only contains the businesses she wants.

![list of new york businesses](./images/dotard-simbleton-newyork-list.png)

The filter function creates a new array from the existing one, so you can invoke it and assign it to a new variable such as in the code below. The function that you pass to `filter()` should return true or false. If it returns true, then the current item will be placed in the new array.

```js
// Array to contain all the New York businesses
const newYorkBusinesses = businesses.filter(business => {
  let inNewYork = false

  if (business.addressStateCode === "NY") {
      inNewYork = true
  }

  return inNewYork
})
```

> **_Lightning Exercise:_** Use `filter()` to create another array named `manufacturingBusinesses` that will contain all businesses in the manufacturing industry. Display those to the DOM.

![manufacturing businesses list](./images/dotard-simbleton-manufacturing-list.png)

## map

> Doris sidles up next to you after your lunch break, holding a cup of herbal tea. She takes a quick sip, inhales deeply and says, "I love everything you've done so far. This is making a huge difference in everyone's productivity."
>
> You're fairly that by _everyone_ she's just talking about herself, but you nod, smile and respond, "Thank you. Just glad to be making a difference."
>
> Doris smiles back and says, "Now that I have a list of businesses, I realize that I would also love to have a list of purchasing agents. All by themselves. On a web page like the business names."

To achieve this task for Doris, you still need to iterate the original array of businesses, but all you need is the purchasing agent names. If you can extract those names and put them in their own array, then you can use `forEach()` to display them in the DOM.

The `map()` method is perfect for that. The map method is used for transforming items in one array to a different structure, and storing them new items in another array. Here's how you would do that for this feature.

```js
outEl.innerHTML += "<h1>Purchasing Agents</h1>";

/*
    Using map(), you extract the purchasing agent object
    from each business and store it in a new array
*/
const agents = businesses.map(business => {
    return business.purchasingAgent
})

console.table(agents)

agents.forEach(agent => {
  outEl.innerHTML += `<h2>${agent.nameFirst} ${agent.nameLast}</h2>`;
  outEl.innerHTML += "<hr/>";
});
```

You will see the list of agents in the DOM. Also look at the new array in the Developer Console. The only information in that array is the purchasing agent properties.

![purchasing agents with console.table](./images/purchasing-agents.png)

> **Lightning Exercise:** Instead of just returning the purchasing agent object, return a new object that has the full name of the purchasing agent, the company name, and the phone number. The data structure is shown below.

```js
{
    "agentName": "Kaylee Gutkowski",
    "company": "Highnix",
    "phoneNumber": "235.266.6278"
}
```

## find



## reduce



---

## Practice: Big Spenders

> Doris leans forward in her seat, eyes bright, and exclaims, "Yes! This is exactly what I need!" She starts to scroll through all of the businesses, clearly enjoying her new toy.
>
> After several minutes of this, she abruptly stops and turns her head quickly in your direction, eyes wide. "You know, my regional manager, Barry has been asking me for something for months now. He wants me to produce a report for him that list only the companies that have placed an order for more than nine thousand dollars."
>
> She turns her head towards the computer, narrows her eyes slightly and asks in a low voice, "Can you do that?"
>
> Unsure why she needed to ask in such a dubious manner, you confidently respond that you can. She smirks, takes out her cell phone, and walks back to her office while dialing a number...

Use the filter method to display all the big spenders. Inside the filter function, you will need to use the `forEach` method on the `orders` property array.

```js
// Array to contain all the big spenders
const bigSpenders = businesses.filter(business => {
    let isBigSpender = false

    // Iterate the orders property with `forEach()`

    return isBigSpender
})
```

## reduce

The `reduce()` method is for aggregating the data into a single value.

```js
const monthlyRainfall = [23, 32, 27, 20, 20, 31, 33, 26, 19, 12]

// ES6+ syntax
const totalRainfall = monthlyRainfall.reduce(
    (currentTotal, next) => currentTotal + next
)

// Traditional syntax
const totalRainfall = monthlyRainfall.reduce(
    function (currentTotal, next) {
        return currentTotal + next
    }
)
```

## Other Helpful Methods

* [reverse](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse) - Reverses the order of items in the array
* [every](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) - Determine if every item in an array passes a condition
* [some](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some) - Determine if some of the items in an array passes a condition

[Mozilla Developer Network documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) on every method available on arrays.

## For the Visual Learners

![emojis](./images/array_methods.png)

## Videos to Watch

* [6 JavaScript Native Array Functions in 5 Minutes](https://www.youtube.com/watch?v=9ar5ZpBW7NE)
* [Common Array Methods - Beau teaches JavaScript](https://www.youtube.com/watch?v=MeZVVxLn26E)

## Practice: Solar System

### Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/javascript/exercises/array-methods && cd $_
touch index.html
touch array-methods.js
```

### Requirements

1. Copy the code below into the JavaScript file, and follow the instructions in the comments.

```javascript
const planets = ["mercury", "venus", "earth", "mars", "jupiter", "saturn", "uranus", "neptune"]

/*
    Use the forEach method to add the name of each planet
    to a section element in your HTML with an id of "planets".
    Use string templates to construct the DOM elements.
*/
const planetEl = document.getElementById("planets")

/*
    Use the map method to create a new array where the
    first letter of each planet is capitalized. Use the
    `toUpperCase()` method on strings.

    https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase
*/


/*
    Use the filter method to create a new array that
    contains planets with the letter 'e'. Use the `includes()`
    method on strings.

    https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes
*/


// Use the reduce method to create a sentence from the words in the following array
const words = ["The", "early", "bird", "might", "get", "the", "worm", "but", "the", "second", "mouse", "gets", "the", "cheese"]
```

## More Practice: Spam, Spam, Spam, Spam
Learning Objective: practice accessing data within an array of objects

You have been tasked with building a list of email addresses of all of our customer's contacts so we can spam them with an email about Miffles the Vampire Weiner Dog.

1. Create a new project in `workspace`.
1. In your JavaScript file, paste the [customers array](./data/customers.js) that contains the emails we need to retrieve.

From that array, extract just the customers' contact email addresses and store them in a new array. (Hint: you may want to use `forEach()` and/or `concat()` or any other array methods you have learned.)


## Challenge: Chaining Methods

### Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/javascript/chaining-methods && cd $_
touch index.html
touch chaining.js
```

### Requirements

Using one single line of JavaScript code, complete the following tasks on the array of integers below.

1. Sort the numbers in descending order (10, 9, 8, 7, etc).
1. Remove any integers greater than 19.
1. Multiply each remaining number by 1.5 and then subtract 1.
1. Then output (either in the DOM or the console) the sum of all the resulting numbers.

```js
const integers = [13, 25, 6, 3, 11, 2, 18, 7, 21, 1, 29, 20, 12, 8];
```

## Advanced Challenge: Car Dealership

Copy the JSON from [cars.json](./data/cars.json) and assign it to a variable in a new application. This data holds sales information for a car dealership. Your job is to produce the following reports for the dealership based on their total 2017 sales.

1. Total profit for 2017
1. In which month did they sell the most cars?
1. Which salesperson sold the most cars?
1. Which salesperson made the most profit?
1. Which model was the most popular?
1. Which bank provided the most loans to our customers?
