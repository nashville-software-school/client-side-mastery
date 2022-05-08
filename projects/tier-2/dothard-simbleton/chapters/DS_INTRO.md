# Dothard & Simbleton

## Setup

Create the directories and files with the following commands. You can copy/pasta all four commands into your terminal at the same time and run them.

```sh
mkdir -p ~/workspace/dothard-simbleton/scripts
mkdir -p ~/workspace/dothard-simbleton/styles
cd ~/workspace/dothard-simbleton
touch index.html scripts/main.js scripts/database.js \
  scripts/BusinessList.js scripts/Business.js \
  styles/main.css
```

## Your First Day at Dothard & Simbleton

It's your first day on the job, and Doris sits with you at your desk and talks about what she needs you to do.

> "Thank you for joining the team! We really need your help," she says as she drops a huge pile of paper on the corner of your desk, making a deep *thud* sound.
>
> "This is a list of all companies that have active accounts for purchasing any kind of paper from Dothard & Simbleton. What I need you to do is make it electronic."
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

Each file contains an array with 15 objects in it. Each object represents one active customer. It details the address, purchasing agent, and the total dollar amount of that company's last 5 orders.

## HTML Setup

> **`dothard-simbleton/index.html`**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dothard & Simbleton</title>
    <link rel="stylesheet" href="./styles/main.css">
</head>
<body>
    <main id="content"></main>

    <script src="./scripts/main.js" type="module"></script>
</body>
</html>
```

## Main Module Setup

> **`dothard-simbleton/scripts/main.js`**

Here's some starter code for your main module

```js
const contentTarget = document.querySelector("#content")

const renderHTML = () => {
  contentTarget.innerHTML = `
  <input type="text" placeholder="Enter business name..." id="companySearch" />

  <article class="foundBusinesses"></article>

  <article class="businesses">
      <h2>All Businesses</h2>
      ${}
  </article>

  <article class="businesses--manufacturing">
      <h2>Manufacturing Businesses</h2>
      ${}
  </article>

  <article class="businesses--newYork">
      <h2>New York Businesses</h2>
      ${}
  </article>

  <article class="agents">
      <h2>Purchasing Agents</h2>
      ${}
  </article>
  `
}

renderHTML()
```

## Database Setup

Copy the follow code into your database module.

> **`dothard-simbleton/scripts/database.js`**

```js
const database = {
  businesses: [
    {
      purchasingAgent: {
        nameLast: "Kirlin",
        nameFirst: "Kristy",
      },
      phoneWork: "089.129.2290 x9400",
      orders: [7826.96, 8323.11, 5756.28, 6308.42, 5622.28],
      companyName: "Care-media",
      companyIndustry: "Education",
      addressZipCode: "56839",
      addressStateCode: "WI",
      addressFullStreet: "8417 Franklin Court Tunnel",
      addressCity: "Mouthcard",
    },
    {
      purchasingAgent: {
        nameLast: "Steuber",
        nameFirst: "Kamron",
      },
      phoneWork: "(833) 222-7579 x5874",
      orders: [6252.5, 9769.02, 9521.17, 7994.05, 7945.93],
      companyName: "Stanholding",
      companyIndustry: "Hospitality",
      addressZipCode: "09705",
      addressStateCode: "NY",
      addressFullStreet: "2889 Fawn Court Garden",
      addressCity: "Fellsmere",
    },
    {
      purchasingAgent: {
        nameLast: "Gutkowski",
        nameFirst: "Kaylee",
      },
      phoneWork: "235.266.6278",
      orders: [7634.43, 9766.72, 9953.45, 6559.8, 5054.9],
      companyName: "Highnix",
      companyIndustry: "Agriculture",
      addressZipCode: "49376",
      addressStateCode: "ME",
      addressFullStreet: "5734 Maple Avenue Throughway",
      addressCity: "Little Genesee",
    },
    {
      purchasingAgent: {
        nameLast: "Crona",
        nameFirst: "Lauren",
      },
      phoneWork: "1-449-987-3083 x23263",
      orders: [7384.52, 9252.72, 7272.65, 5251.84, 9680.08],
      companyName: "Conit",
      companyIndustry: "Defense",
      addressZipCode: "53326",
      addressStateCode: "IL",
      addressFullStreet: "5755 Hillside Drive Crossroad",
      addressCity: "Norval",
    },
    {
      purchasingAgent: {
        nameLast: "Krajcik",
        nameFirst: "Elvera",
      },
      phoneWork: "1-730-411-8580",
      orders: [6069.05, 8535.38, 5782.7, 7838.91, 7578.36],
      companyName: "Dong-tom",
      companyIndustry: "Energy",
      addressZipCode: "67071",
      addressStateCode: "KS",
      addressFullStreet: "4826 Arch Street Lights",
      addressCity: "Newburyport",
    },
    {
      purchasingAgent: {
        nameLast: "Kling",
        nameFirst: "Ellie",
      },
      phoneWork: "(868) 043-0950",
      orders: [6726.2, 8393.21, 8087.13, 6393.13, 8646.35],
      companyName: "Dan-dox",
      companyIndustry: "Manufacturing",
      addressZipCode: "98842",
      addressStateCode: "WV",
      addressFullStreet: "9767 Cedar Court Corner",
      addressCity: "Prince George",
    },
    {
      purchasingAgent: {
        nameLast: "Robel",
        nameFirst: "Otilia",
      },
      phoneWork: "(298) 305-1942 x53653",
      orders: [8676.05, 7430.69, 9379.81, 8074.29, 5998.75],
      companyName: "J-base",
      companyIndustry: "Health care",
      addressZipCode: "72993",
      addressStateCode: "FL",
      addressFullStreet: "9954 Buckingham Drive Mountains",
      addressCity: "Vesper",
    },
    {
      purchasingAgent: {
        nameLast: "Gusikowski",
        nameFirst: "Karolann",
      },
      phoneWork: "(743) 934-8981 x692",
      orders: [8650.08, 8042.69, 5555.72, 7467.86, 8851.43],
      companyName: "Span-fix",
      companyIndustry: "Construction",
      addressZipCode: "59860",
      addressStateCode: "MT",
      addressFullStreet: "4151 Orange Street Extension",
      addressCity: "Little Rock Air Force Base",
    },
    {
      purchasingAgent: {
        nameLast: "Hartmann",
        nameFirst: "Zena",
      },
      phoneWork: "727.635.6610 x6483",
      orders: [9415.89, 8935.45, 7413.91, 6830.96, 9746.57],
      companyName: "Sanaplane",
      companyIndustry: "Information",
      addressZipCode: "85156",
      addressStateCode: "NY",
      addressFullStreet: "4765 Fairview Avenue Locks",
      addressCity: "Dennisville",
    },
    {
      purchasingAgent: {
        nameLast: "Torphy",
        nameFirst: "Celia",
      },
      phoneWork: "(992) 079-1670 x71569",
      orders: [7431.21, 5911.85, 7954.86, 7141.52, 8416.79],
      companyName: "Ran-taxon",
      companyIndustry: "Manufacturing",
      addressZipCode: "96673",
      addressStateCode: "MD",
      addressFullStreet: "7157 Hudson Street Ford",
      addressCity: "Watrous",
    }
  ]
}
```

## .forEach() Method

So Doris just wants to see all of the business names on a web page. You remember that the `.forEach()` method on an array iterates the array and you can write logic for what to do for each item in it.

Since each object is identical in its structure (*but not its state*), you can write some automation logic with `.forEach()`.

Here's an example of using `.forEach()` to iterate an array of objects that represent art supplies.

### Example Usage of `.forEach()`

> **`just-for-show/scripts/exampleDatabase.js`**

```js
const database = {
  supplies: [
      {
          id: 1,
          price: 12.99,
          color: "Red",
          brand: "Bloomfield",
          type: "Paint"
      },
      {
          id: 2,
          price: 75.49,
          color: "Brown",
          brand: "Illinois Art",
          type: "Easel"
      },
      {
          id: 3,
          price: 19.99,
          color: "White",
          brand: "Emerson",
          type: "Oil Paint Canvas"
      }
  ]
}

// Export a function that other modules can use to get the data
export const getSupplies = () => {
    // Use .map() to create a new array with copies of all the original object
    const copy = database.supplies.map(item => ({...item}))

    // Return the copy of the data
    return copy
}
```

> **`just-for-show/scripts/SupplyList.js`**

```js
import { getSupplies } from "./database.js"

/*
  SupplyList Component Function

  Responsibility:
    Generate the HTML representation for every supply object

  Parameters:
    None

  Returns:
    (string) - HTML representation of entire supply list
*/
const SupplyList = () => {
    const supplyArray = getSupplies()
    const supplyListHTML = "<h1>Art Supplies</h1>"

    // Iterate the supply array
    supplyArray.forEach(
        // This function will be invoked on each iteration
        (supplyObject) => {
            supplyListHTML += `
                <section class="supply">
                    <h2 class="supply__type">${supplyObject.type}</h2>
                    <div class="supply__price">
                        Price: ${supplyObject.price}
                    </div>
                </section>
            `
        }
    )

    return supplyListHTML
}
```

## Videos With More Examples

You can watch some videos where other developers show you other examples of how to use the `.forEach()` method on an array.

* [.forEach() Array Method | JavaScript Tutorial](https://www.youtube.com/watch?v=SXb5LN_opbA)
* [JavaScript Array .forEach() in 90 Seconds](https://www.youtube.com/watch?v=qdSD5MiqQg0)

## Task: Listing Purchasing Companies

Your task is to use the `.forEach()` array method to list all of the companies so that Doris can easily browse a list of her customers. Use the example code above as a starting point. The list of companies should look like the image below.

1. Create a new module named `BusinessList.js`
1. Build a function named the same inside it that uses `.forEach()` to generate an HTML representation of each business _(see example image below for guidance on the structure)_.
1. Invoke the function in the correct place in `main.js` to view your results on the DOM.

    ![list of businesses](./images/dothard-simbleton-simple-list.png)
