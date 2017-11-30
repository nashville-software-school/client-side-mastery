# Asynchronous Programming with XHR

We're going to use jQuery to learn asynchronous programming. Asynchronous programming will feel a bit weird at first, because up until this point, you are used to your code working in a clear, one-directional path. Sure, you've learned to split code up into modules, but if you can follow the path of logic through the modules, it's fairly easy to comprehend how the code works.

Async throws a wrench into all of that. The first thing you need to understand is that requesting resources from somewhere on the Internet can take anywhere between 200ms and 5 seconds.

Let's look at an example workflow.

1. Request weather information for the next 3 days from the Weather Underground service.
1. When that request completes, build an HTML representation of that data, and update the DOM.
1. Attach an event listener to the container of all the representations to detect when a user clicks on one.

Here's some pseudo code.

```js
const weatherEl = document.querySelector(".weather")

$.ajax({
  method: "GET",
  url: "http://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=b1b15e88fa797225412429c1c50c122a1"
}).then(function (weatherData) {
  let weatherInfo = "<section id='weatherContainer'>"

  // Add a <div> for each day in the forecast inside the container
  weatherData.list.forEach(day => {
    weatherInfo += `
      <div class="${day.dt}">
        ${day.main.temp_min} - ${day.main.temp_max}
      </div>
    `
  })

  weatherInfo += "</section>"
  weatherEl.innerHTML = weatherInfo
})

// When user clicks on any of the individual day elements, show the class name
document.querySelector(".weatherContainer").addEventListener("click", function (event) {
  console.log(event.target.className)
})
```

This looks like it should work. Yet, it won't. JavaScript will throw an exception saying that it can't invoke `addEventListener` on *undefined*. When JavaScript executes that last line of code, the asynchronous operation of loading the weather data isn't complete yet, so the `.weatherContainer` element doesn't exist yet.

When you make JavaScript perform an XHR, it uses a mechanism called the *event loop* to make the HTTP request, wait for the response, and then execute a callback function that was provided with the request. You are already familiar with this mechanism because you've used event listeners.

When you add an event listener to a DOM element, you provide a callback function that will be executed when that event is triggered. The function isn't executed immediately when JavaScript attaches the listener.

```js
document.querySelector(".firstName").addEventListener(
  "keypress",
  function (event) {    // This function is not executed until a key is pressed
    console.log(event)
  }
)
```

XHRs work similarly. When an XHR request gets a response, an event is fired. That event is the `load` event. jQuery abstracts that event listener away for you. You don't have to listen for that event. What you do is pass a callback function to the `done()` method on the XHR itself. Inside jQuery, it listens for the `load` event, and when that happens, your callback function is executed.

## Videos to Watch

1. NSS Learning Team video [JavaScript XHR and Callbacks](https://www.youtube.com/watch?v=2R28EX9QShI&index=6&list=PLX0ucpUE_qIOUsxGNEPpP9yonb4zerVIC) which shows you how to use callback functions, or lambas, to ensure that asynchronous operations execute in the right order.
1. [What the heck is the event loop anyway?](https://www.youtube.com/watch?v=8aGhZQkoFbQ)

## Practice

Your job is to build a department store's web page that lists products, the name of the department each one is in, and the price.

The two JSON representations above should be in two files: `products.json`, and `categories.json` (see below). Use jQuery's `ajax()` method to read the data from those files, and then build HTML representations of the data.

> Contents of `products.json` file

```js
{
  "products": [
    {
      "id": 0,
      "name": "Kids socks",
      "price": 4.99,
      "category_id": 1
    },
    {
      "id": 1,
      "name": "Mens socks",
      "price": 6.99,
      "category_id": 1
    },
    {
      "id": 2,
      "name": "Ladies socks",
      "price": 7.99,
      "category_id": 1
    },
    {
      "id": 3,
      "name": "Foot stool",
      "price": 14.99,
      "category_id": 2
    },
    {
      "id": 4,
      "name": "Lava lamp",
      "price": 9.99,
      "category_id": 2
    },
    {
      "id": 5,
      "name": "3 drawer dresser",
      "price": 64.99,
      "category_id": 2
    },
    {
      "id": 6,
      "name": "Air filter",
      "price": 6.99,
      "category_id": 3
    },
    {
      "id": 7,
      "name": "Surge protector",
      "price": 8.99,
      "category_id": 3
    },
    {
      "id": 8,
      "name": "Plastic storage bin",
      "price": 3.99,
      "category_id": 3
    },
    {
      "id": 9,
      "name": "Light bulb",
      "price": 1.99,
      "category_id": 3
    }
  ]
}
```

> Contents of `categories.json` file

```js
{
  "categories": [
    {
      "id": 1,
      "name": "Apparel",
      "season_discount": "Winter",
      "discount": 0.10
    },
    {
      "id": 2,
      "name": "Furniture",
      "season_discount": "Autumn",
      "discount": 0.25
    },
    {
      "id": 3,
      "name": "Household",
      "season_discount": "Spring",
      "discount": 0.15
    }
  ]
}
```

## Discounts

Now that you've populate the view with all of the products, put a `<select>` element at the top of the page that contains all possible values of the `season_discount` key in the categories file. As soon as you select one of the seasons, all prices on the page should immediately be discounted by the corresponding percentage.

For example, when _Spring_ is chosen, all products in the corresponding Household category should have their prices updated with a 15% discount off the base price.
