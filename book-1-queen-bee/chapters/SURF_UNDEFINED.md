# Debugging Exercise Setup

Now that you have a paying job working for the Surf Shop, you are going to build out an application for producing different kinds of custom jewelry orders.

1. Run the following command in your terminal. It will automatically create a `workspace/surf-shop` directory for you, and create a file in that directory named `undefined.js`, and take you to that directory.
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/undefined.sh)"
   ```
2. Open the directory in VS Code with the `code .` command.
3. Open the `undefined.js` file.
4. Run the code with your debugger.

You will immediately see a stack trace in the **Debug Console** at the bottom. Your job is understand the error message, read the stack trace to determine exactly where the error is, and then fix the error.

Run the debugger every time you change the code to see if you have fixed the error.

There are several errors in this code, so you must use your debugger to examine the values of your variables and parameters to help you understand why the error is occurring.

## Final Output

Once you have debugged and fixed all of the errors, you should see the following output in the **Debug Console**.

```txt
9 ft longboard surfboard
	* Is a surfing gear product
5 ft shortboard surfboard
	* Is a surfing gear product
Full wetsuit with hood and boots
	* Is a clothing product
Surfboard leash
	* Is currently on sale
	* Is a surfing gear product
Surf wax
	* Is currently on sale
	* Is a surfing gear product
Surfboard fins
	* Is currently on sale
	* Is a surfing gear product
Rashguard shirt
	* Is currently on sale
	* Is a clothing product
Surfboard rack for car
	* Is a surfing gear product
Beach towel
	* Is currently on sale
	* Is a clothing product
Surfboard repair kit
	* Is currently on sale
	* Is a surfing gear product
```