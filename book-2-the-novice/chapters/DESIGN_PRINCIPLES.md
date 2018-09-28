# Designing and Planning Software

Planning what you are going to do before you do it is the most important factor in writing quality, scalable, maintainble software applications. We are going to train you to be software designers, and the byproduct of that is becoming software developers because you will write the code that implements your design.

## Key Principles

1. Keep the code DRY. Dry means "Don't Repeat Yourself".
1. Don't write code that isn't needed. Also know as YAGNI: You ain't gonna need it.
1. Make a function, module, or method do just one thing.
1. Code for extension. Write code that can easily be extended in the future.
1. Try to reduce coupling.

## How to Plan

### Whiteboard

1. Start by writing down all of the features that are needed for the application.
1. Then discuss what you think is needed to complete each feature. Write down those tasks.
1. Next, determine your dependency tree. Draw lines between tasks to visualize the dependencies.
1. Whichever task has no dependencies, or has the least, is usually the task that you should start with.

### Code Comments

Next, create some boilerplate HTML, CSS, and JavaScript files. In those files, use comments to plan what code you will need to write.

> HTML comments

```html
<!-- Create a `nav` element to contain all anchor tags for each page on our site  -->

<!-- Create an `article` element to contain all child elements that will display products  -->

<!-- Create a `footer` element to contain the copyright information and team member names  -->
```

> JavaScript comments

```js
/*
    Create an array to hold all product objects.
    let products = [
        {
            name: "Toxic Waste Pops",
            price: 3.99,
            quantity: 5000
        },
        {
            name: "Nuclear Fallout Popcorn",
            price: 5.29,
            quantity: 11000
        }
    ]
*/

// Get a reference to the article element contains

// Iterate the `products` array and add a new DOM element for each product
```

### Code & Refactor

1. Start writing code to implement all of the features, and completes all of the tasks that you defined initially.
1. Review your code with a critical eye, or better yet, pull in a teammate to review your code and see if any improvements can be made.
1. Refactor the code, if needed.
1. Repeat steps 1-3

### Unit Testing

You will learn about something called unit testing. Unit testing provides a way for you to write code that verifies expected behavior of your actual, working code for your product or site.

It protects you from people inadvertantly making code changes that break critical functionality, and protects your business from introducing bugs into the product.

## Principles

### Encapsulation

Here's a very official sounding definition of encapsulation

> Encapsulation the process of compartmentalizing the elements of an abstraction that constitute its structure and behavior; encapsulation serves to separate the contractual interface of an abstraction and its implementation.

To think about this at a lower level, consider the code that might be needed in order to send a customer a confirmation email when they complete an order on an ecommerce site like Etsy or Amazon.

1. Request the customer's email address from the database
1. Check that the customer's email was verified
1. Request the order details from the database
1. Compose an object in memory that represents the email
1. Set the recipient
1. Build the HTML for the message of the email based on the products that were ordered, the payment method used, and the delivery mechanism chosen
1. Request delivery estimate from an external provider like USPS, or FedEx
1. Send the email to the email server
1. Verify that it was sent correctly

If you were the developer responsible for writing all of this code, it's a daunting task that will require hundreds of lines of code. However, in the end, when another developer wants to send a verification email, they don't need to know all of those steps.

Do you build a `ConfirmationEmailService` module, and define a `send()` method. This method takes two parameters.

1. The identifier for the customer
1. The identifier for the order

```js
let ConfirmationEmailService = {
    send: function (customerId, orderId) {
        // The actual implementation code
    }
};
```

You have now encapsulated a very complex abstraction into a single module, and a single method call for other developers to use.

### Single Responsibility Principle

There is one and only one reason to change a class. More specifically, this principle states that every module or class should have responsibility over a single part of the functionality. Think of your classes as Actors in your software, and what the responsibility of each is.

Once you've defined each Actor and what reponsibility it has in the system, you use those Actors as the foundation for keeping your code DRY, encapsulating all implementation logic within that Actor, and then making sure each method that defines the behavior of the Actor does one thing only.

This means that we should start to think small. Each complex problem cannot easily be solved as a whole. It is much easier to first divide the problem in smaller sub-problems. Each sub-problem has a reduced complexity compared to the overall problem and can then be tackled separately.
