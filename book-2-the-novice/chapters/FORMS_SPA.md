# Using Forms in Single Page Applications

HTML forms were invented and mostly standardized before the advent of modern, asynchronous JavaScript and complex web applications. Today, we use form inputs, buttons, and other interaction mechanisms in lots of different ways; but underlying that is a system based on the HTTP request-response paradigm.

When you load a page, you are making an HTTP request (a GET request, usually). This request is sent by your browser to the server, and the server responds with the resource you requested, if it exists. This interaction is one of the most fundamental concepts of the internet. And it is how HTML forms are designed to work.

Each input inside a `<form>` element (and this includes `<input>` elements as well as `<select>` and others) has a name attribute, and also a value. The value is determined in different ways. For text-based inputs, the value is whatever has been typed into the field. For radio-buttons, the value is the selected option. The user can adjust the value, but (usually) not the name. This creates a set of name-value pairs in which the values are determined by user input.

When a form is submitted, the name-value pairs from all the fields inside the `<form>` element are included in an HTTP. The request is made to a URL defined in the form’s action attribute, and the type of request (GET or POST) is defined in the form’s method attribute. This means that all the user-provided data is sent to the server all at once when the form is submitted, and the server can do whatever it wants with that data.

## Single Page Web Applications

Modern, single page web applications use JavaScript to run asynchronous HTTP requests, or "behind the scenes" calls to the server which do not reload the page. They aren’t relying on the HTML `<form>` element’s built-in behavior, because they aren’t bundling up a bunch of user data and sending it all at once.

For this reason, many (though not all) HTML+JS web apps don’t use the `<form>` element at all, or they just use it as a kind of container for various types of fields and input elements. In this case, you won’t see the method and action attributes being used.

## Collecting Form Fields

### Using `<form>`

If you have a `<form>` tag in your code that is the parent element to all of the input fields, make sure the button your create for the user to click to perform an action is **not inside the form**.

```html
<form>
    First name: <input type="text" name="first_name">
    Last name: <input type="text" name="last_name">
    Address: <input type="text" name="address">
    Phone number: <input type="tel" name="phone_number">
</form>

<!-- 
    By being outside the form, clicking the button will not
    submit a new GET request to the server.
-->
<button id="createAccount">Create Account</button>
```

Then you can attach an event listener to the button, and collect the form field values.

```js
document.getElementById("createAccount").addEventListener("click",
    event => {
        const newCustomerAccount = {
            "first_name": document.querySelector("input[name='first_name']").value,
            "last_name": document.querySelector("input[name='last_name']").value,
            "address": document.querySelector("input[name='address']").value,
            "phone_number": document.querySelector("input[name='phone_number']").value,
        }
    }
)
```
