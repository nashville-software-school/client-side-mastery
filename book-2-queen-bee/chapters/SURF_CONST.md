# Sequina's Sales

Sequina has asked the development team to change the current logic of the inventory program. She would like to see what kind of product it is, but **only** if it is not on sale. If it is on sale, that should be the only message about the product.

The developers did their best to order the logic differently, but there were still plenty of errors when they tried to run the code.

Since they don't know how to fix it, they sent the script to you - the debugging expert - to find out what's going on.

## Instructions

1. Run the following command in your terminal. It will create a new file in surf-shop directory named `const.js`.
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/const.sh)"
   ```
3. Open the `const.js` file in VS Code.
4. Run the code with your debugger.

You will immediately see a stack trace in the **Debug Console** at the bottom. Your job is understand the error message, read the stack trace to determine exactly where the error is, and then fix the error.

Run the debugger every time you change the code to see if you have fixed the error.

There are several errors in this code, so you must use your debugger to examine the values of your variables and parameters to help you understand why the errors are occurring.

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
```