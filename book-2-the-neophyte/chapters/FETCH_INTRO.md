# Fetch your Data

## Why are you Learning This?

Companies all over the world provide access to their data so that software developers can build interesting solutions for their customers. You, as a developer, can request their raw data, but use it however you like.

For example, the [Merriam-Webster](https://dictionaryapi.com/) dictionary and thesaurus is available for software developers who may be building a tool for children to work on their spelling and vocabulary skills.

Another source of data is the [Air quality and pollution API](https://www.airvisual.com/air-pollution-data-api). Software developers who work for non-profits that monitor industrial pollution, or government agencies who regulate industry would find this data very useful for building custom software.

In this chapter, you will be learning how to use the `fetch` statement to make requests for data that live on the World Wide Web somewhere.

## Reference

The [fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch) is a recent addition to native JavaScript that software developers use to interact with data on the Web. There is also a maintained list on Github of [all public, free APIs](https://github.com/toddmotto/public-apis) for software developers to use.

## Setup

You're going to use the food API that you set up in the last chapter.

1. Make sure your API is running. If you need to review, go back to the last chapter for the command.
1. Make a new sub-directory in your project named `src`. This directory will hold your application code.
    ```sh
    mkdir -p ~/workspace/javascript/exercises/food-api/src
    cd $_
    touch index.html
    mkdir scripts
    touch scripts/foodapi.js
    ```
1. Create the boilerplate HTML in VS Code and hook up your `foodapi.js` file into the HTML.

## Working for the Chesterfield Food Bank

You've been hired by the city of Chesterfield, Missouri to build an application that provides ingredient information to people who are in need. Even those who use a food bank care about providing nutritious, safe food for their families. The food bank has requested that the information is on their web site so that the public can know which food is available, and see if any ingredients would cause allergic reactions.

The director of the food bank is Consuela Mendoza, and it's your first day on the job.

> Consuela greets you as you enter the spartan entryway of the food bank on a humid Monday morning. The sun is shining brightly, but it had rained heavily the night before. You notice several dehumidifiers running as you glance down a concrete hallway directly ahead of you.
>
> Consuela smiles brightly and shakes your hand firmly but affably. "Thank you so much for helping us with this," she says as she extends an arm, guiding you down the concrete hallway that is briskly humming from the sound of the dehumidifiers. As the two of you walk towards a large grey door, she says, "We have to make sure that the humidity from the outside doesn't make it into our pantry."
>
> When you reach the door, she presses the bar across the middle and it swings open to reveal a warehouse filled with food. It's much larger than you expected it to be. The door closes behind you and you continue to follow Consuela as she leads you to the left side of the pantry and another gray door.
>
> You ogle the rows and rows of food and supplies and smile a little as you decide that this is the first place that you need to go in case of a zombie apocalypse. You enter the main office area of the food bank and she shows you to a small area on a long desk that they've cleared off for you.
>
> "This is best place we could find for you while you work. I'm right around the corner to the left there," as she points through a window and you see a small cluttered desk, "and George is just past me through that door. He's in charge of inventory control and logistics."

As you continue to talk, you find out that a previous software developer was hired to automate the entry of the inventory into a JSON file that is used to produce an API for all of the foods. That will save you a tremendous amount of time. Consuela also informs you that many of the foods are contributed from foreign countries - which you find a bit odd.

> She holds out her hands, starts counting on her fingers, and says, "It comes largely from Britain, Scotland, Portugal, Australia and Germany. It all started with a food exchange program that our local government took part in with the state." She shrugs and continues, "I guess that's still going because the food keeps arriving every month."
>
> "The first thing I need you to do is list all of the foods on a web page on our main site. That folder," she points at a red folder on the table, "contains all of the information set up by the last developer we used. She said it will let you access and maintain all the data."

First, you are going to perform a [GET](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods) operation to retrieve all the foods from the API. You look in the red folder to find out the URL of API that the last developer set up.


Paste the following code into your `foodapi.js` JavaScript file and refresh your browser. Remember, **always have your DevTools open**.

> food-api/src/scripts/foodapi.js

```js
fetch("http://localhost:8088/food")
    .then(foods => foods.json())
    .then(parsedFoods => {
        console.table(parsedFoods)
    })
```

You should see this in your console.

![food API response](./images/foodapi-response.png)

Time to explore the code line by line.

### The Request

```js
fetch("http://localhost:8088/food")
```

This makes a request to a specific domain, port address, and resource on the Web.

1. `localhost` is the domain
1. `8088` is the port address
1. `food` is the resource

By default, `fetch` performs a GET operation, so it requires no other configuration.

### The Parsing

```js
.then(foods => foods.json())
```

This line of code accepts the response from your request, parses the body of the response as JSON and returns it to any subsequent `then()` method.

### Using the Response

```js
.then(parsedFoods => {
    console.table(parsedFoods)
})
```

This line of code accepts the parsed JSON as the argument to a function, and then uses `console.table()` to display the results.

## Practice: Displaying Foods

Once you have retrieved all of the foods from your own Food API, display each one of them in the DOM. Create an HTML representation of each food which will display the name of the food, its type, and its ethnicity.

1. Create a DOM element in your `index.html` with a class of `foodList`.
1. Create a function which returns a string template. The template is the HTML representation for a food item.
1. Create a function that inserts an HTML representation of a food into the DOM

> Example fetch call using functions

```js
fetch("http://localhost:8088/food")
    .then(foods => foods.json())
    .then(parsedFoods => {
        parsedFoods.forEach(food => {
            const foodAsHTML = foodFactory(food)
            addFoodToDom(foodAsHTML)
        })
    })
```

Use Flexbox row direction so that you have a horizontal list of items.

![food items layout](./images/food-items.png)

## Practice: Fetching Other People's Data

> For this exercise, you will be adding barcodes to your food products, and using another, 3rd-party API to query more information about each product and display it in the DOM. That's right! You don't have to be stuck just messing around with your own data; there's a whole world of information out there for you fetch.

There is a wonderful, free resource of data about food called the [Open Food Facts](https://world.openfoodfacts.org/). Visit the site and use the search feature to find all foods matching the `name` property of each of the foods in your food API. For example, search for _"Green curry"_ and see the how many matches there are.

Next, click on one of the search results and get the barcode for the product. It's at the top, right beneath the product name.

![finding a barcode](./images/IRHRnpTxtF.gif)

Create a new `barcode` key for each of the items in your API, and provide the correct barcode value that you found in your search.

```json
{
    "id": 4,
    "name": "Ravioli Funghi",
    "type": "pasta",
    "ethnicity": "italian",
    "barcode": "8021733250892"
},
```

Once you have the barcode, you can use the Open Food Facts JSON API to get a plethora of information about that product. For example, the barcode for Jimmy Dean Pork Sausage is `0077900110726`. I can take that barcode and query their API.

```js
fetch("https://world.openfoodfacts.org/api/v0/product/0011150479547.json")
    .then(response => response.json())
    .then(productInfo => {
        // Use it here
    })
```

Go ahead and copy that URL and paste it into a new tab in your browser. You will see a very large JSON document in the response.

![image of JSON document](./images/openfoodapidetails.png)

Your job is to query the Open Food Facts API for each of your products, and list the following additional information.

1. Ingredients
1. Country of origin
1. Calories per serving
1. Fat per serving
1. Sugar per serving

> **Helpful hints:** You will need to use the `forEach` array method to iterate your foods. Inside that `forEach`, you will need to perform another `fetch` to get the additional information. The barcode value must be interpolated inside the URL for the inner fetch.

```js
fetch("http://localhost:8088/food")
    .then(response => response.json())
    .then(myParsedFoods => {
        myParsedFoods.forEach(food => {
            console.log(food) // Should have a `barcode` property

            // Now fetch the food from the Food API
            fetch(`https://world.openfoodfacts.org/api/v0/product/${what goes here?}.json`)
                .then(response => response.json())
                .then(productInfo => {
                    food.ingredients = productInfo.product.ingredients

                    // Produce HTML representation
                    const foodAsHTML = foodFactory(food)

                    // Add representaiton to DOM
                    addFoodToDom(foodAsHTML)
                })
        })
    })
```

#### Example with ingredients included

![foods with ingredients included](./images/foods-with-ingredients.png)
