# Average Prices

Sequina now wants to find out the average price of her entire inventory to see if it helps her understand why her profits aren't what she is expecting.

## Instructions

1. Run the following command in your terminal. It will create a new file in surf-shop directory named `averagePrice.js`.
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/averagePrice.sh)"
   ```
3. Open the `averagePrice.js` file in VS Code.
4. Run the code with your debugger.

Instead of a stack trace this time, you will see a weird output text of **NaN**. In JavaScript, this is shorthand for "not a number". There are [several ways](https://linguinecode.com/post/how-to-avoid-nan-in-javascript) that **NaN** can be generated.

Unfortunately, the development team thought that they did everything correctly and were expecting to see the value of $137.49 in the output.

Since they can't figure it out, they sent the code to you to be debugged.
