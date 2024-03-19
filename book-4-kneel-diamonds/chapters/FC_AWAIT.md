# Another Approach to Fetch

After the JavaScript standards committee approved the **Fetch API**, a few years later, they approached a different syntactical approach that was requested by the community. It is the `async/await` syntax. In this chapter, you will see an overview of the syntax.

## The Await Syntax

Once again, here is a visual representation of the request/response cycle between your code and a remote computer via the WWW.

![](./images/REST-API-request-response.png)

Here is how the code would look for this request using the keyword of **await**.

```js
const response = await fetch("https://indoatlantis.com/rest_api/last_transaction")
const convertedData = await response.json()
/*
    Here, and only here, is where you can do something
    with the data that you requested.
*/
```

## Await Syntax, a Breakdown


### The Fetch

By putting the **await** keyword in front of the fetch function, JavaScript waits until the response is received and assigns the result to the `response` variable.

```js
const response = await fetch("https://indoatlantis.com/rest_api/last_transaction")
```

### The Conversion

Instead of being combined together like a `fetch().then()` chain is, you can write the conversion process on a discrete line of code. This syntax kicks off the conversion process, and the **await** keyword waits for that process to complete, and then assigns the converted data to the `convertedData` variable.

```js
const convertedData = await response.json()
```

### The Action

With this syntax, you don't need a second `.then()` chained onto the previous two functions in order to write the logic that will use the converted data. You can write that code on a separate line of code.

Here's a simple example...


```js
const response = await fetch('http://shibe.online/api/cats?count=1&urls=true&httpsUrls=false')
const convertedData = await response.json()
const transaction = `Order ${convertedData.odr_id} is currently ${convertedData.odr_status}`
```

## Async Syntax

The partner of **await** is the **async** keyword. This comes into play when you have asynchronous code inside a function. When that is the case, you have to mark the function as **async** like the code below.

```js
/*
    Define a function to get the cat data over the Web.
    Because the function contains the `await` keyword, then
    the function must be marked as `async`.
*/
const getTransaction = async () => {
    const response = await fetch('http://shibe.online/api/cats?count=1&urls=true&httpsUrls=false')
    const convertedData = await response.json()
    const transaction = `Order ${convertedData.odr_id} is currently ${convertedData.odr_status}`

    return transaction
}

// Then invoke the asynchronous function to get the cat data
getTransaction()
```

Now move on to the next chapter to write your next data request using **async/await** syntax.
