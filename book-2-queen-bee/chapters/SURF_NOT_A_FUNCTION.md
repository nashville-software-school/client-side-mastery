# Sequina's Accounting

Sequina recently hired an accounting form to handle all of her taxes and quarterly sales reports. The accounting firm has special software that required all of the data to be upper case. No lower case letters are allowed.

In JavaScript, you can convert any string into all caps like this.

```js
const latin = "qui sed quisquam"
const upper = latin.toUpperCase()
console.log(upper)

> "QUI SED QUISQUAM"
```

The development team tried to convert all of the data to uppercase, but couldn't quite figure it out. They tried to use the `toUpperCase()` method, but they keep getting errors that it's not a function.

They know it's a function because they found this [W3Schools article](https://www.w3schools.com/jsref/jsref_toUpperCase.asp) that proves it.


Once again they need to rely upon your debugging skills to find out why JavaScript says it's not a function.

## Instructions

1. Run the following command in your terminal. It will create a new file in surf-shop directory named `not-a-function.js`.
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-1-queen-bee/chapters/scripts/function.sh)"
   ```
3. Open the `not-a-function.js` file in VS Code.
4. Run the code with your debugger.

You will immediately see a stack trace in the **Debug Console** at the bottom. Your job is understand the error message, read the stack trace to determine exactly where the error is, and then fix the error.

Run the debugger every time you change the code to see if you have fixed the error.

There are several errors in this code, so you must use your debugger to examine the values of your variables and parameters to help you understand why the error is occurring.

Below is the format in which the accounting firm needs the data.

## Final Output

Once you have debugged and fixed all of the errors, you should see the following output in the **Debug Console**.

```txt
9 ft longboard surfboard is a surfboard
5 ft shortboard surfboard is a surfboard
Full wetsuit with hood and boots is a clothing product
Surfboard leash is currently on sale
Surf wax is currently on sale
Surfboard fins is currently on sale
Rashguard shirt is currently on sale
Surfboard rack for car is a surfing gear product
Beach towel is currently on sale
Surfboard repair kit is currently on sale

------------------------

9 FT LONGBOARD SURFBOARD - SURFBOARD - 499.99
5 FT SHORTBOARD SURFBOARD - SURFBOARD - 399.99
FULL WETSUIT WITH HOOD AND BOOTS - CLOTHING - 199.99
SURFBOARD LEASH - GEAR - 29.99
SURF WAX - GEAR - 9.99
SURFBOARD FINS - GEAR - 39.99
RASHGUARD SHIRT - CLOTHING - 49.99
SURFBOARD RACK FOR CAR - GEAR - 99.99
BEACH TOWEL - CLOTHING - 24.99
SURFBOARD REPAIR KIT - GEAR - 19.99
```