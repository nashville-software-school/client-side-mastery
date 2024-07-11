# Functions Cumulative Assessment

In this assessment, you are going to write some functions that will also continue to strengthen your knowledge of data types, data structures, and iteration that you learned in the previous book.

## Project Setup

Contact your mentor to get a link to your assessment repository. Once you get the link, make sure you are in your `workspace` directory and then clone the repository with the following process.

1. Authorize with Github and click on the link it generates for your repository.
1. Click on the `Code` button at the top of the repository code.
1. Click the `SSH` link inside the box that appears.
1. Copy the connection string by clicking the copy icon on the right.
1. Go to your terminal.
1. Run the `cd ~/workspace` command.
1. Run `git clone {paste step 4 here}`
1. Type in "yes" if it prompts you, otherwise move to next step.
1. `cd` into the directory that gets created. Remember to `ls` to see it. It should start with `book-2-assessment-something`.
1. Open the directory with `code .`
1. Read the instructions below.

## What You Need to Do

Open the `main.js` file. In there, you will see some boilerplate code that provides an array of objects representing people who are applying for mortgages at a bank.

You will also see three skeleton function definitions.

Please do not remove the functions, or rename the functions. They are there for testing purposes. You just need to implement the correct code inside them.

### Step 1: Iterate Applicants

Below the boilerplate array, you will see a comment that tells you where you should iterate the array. Write your code there and then once complete, move on to step 2. It is important that your `for..of` loop is in the modules scope, and not inside the functions themselves.

### Step 2: Calculate Yearly Expenses

The first function should calculate the total yearly expenses for each person. It should access the correct property on an mortgage application object that was input to the function, and perform a mathematical calculation to determine yearly expenses.

The function should return the yearly expenses for that person.


### Step 3: Calculate Expenses Percentage of Salary

In order to qualify for a mortgage, a lender looks at at your yearly salary, and how much your expenses add up to for that year. If your yearly expenses are too high, it reduces your chance to get a mortgage approved.

The second function should accept an application object, and the calculated yearly expenses as input. Remember that the previous function calculated the yearly expenses.

It should divide the yearly expenses by the annual salary, and then take that sum and multiply it by 100. This is the percentage of expenses to salary.

The function should return the calculated percentage.

### Step 4: Final Qualification Check

The third function should accepts two inputs.

1. A mortgage applicant object.
1. The percentage of expenses to salary. Remember that the previous function calculated the percentage.

The function should implement the following algorithm.

If the percentage of expenses to salary is less than 10, then the applicant object's `mortgage` property - which is also an object - should have a new property added named `qualified` and its value should be `true`. It should have another property added to it named `amount`. The value should be the person's salary multiplied by 5.

If the percentage is greater than 10, the value of the `qualified` property on the `mortgage` object should be `false`. The value of the `amount` property on the `mortgage` object should be 0.

The function should return the modified object.

#### Step 5: Output Messages

To see if all of your logic is correct, after you have invoked the qualification check function, output a message like the samples below. You should only display this message for people who qualified for a mortgage.

```txt
James Runolfsdottir is qualified for a maximum mortage of $249,693.40 
Fannie Swaniawski is qualified for a maximum mortage of $596,277.40 
Patsy Jaskolski is qualified for a maximum mortage of $516,883.80 
Ray Lubowitz is qualified for a maximum mortage of $906,814.35 
Mario Beahan I is qualified for a maximum mortage of $611,133.95 
Becky Wiegand is qualified for a maximum mortage of $380,687.25 
```

## Testing Your Code

This project has some pre-written automated tests that will run to verify that your code has been written correctly to implement the requirements above. Automated tests are used by many development teams to ensure code quality, and catch any unforseen errors before code is released to customers.

When you believe you have code that works, follow this process.

1. In the terminal, be sure you are in your project directory.
1. Run the `git status` command and you will see a message from git that you have changes that need to be saved.
1. Run the `git add main.js` command to tell git that you want to save the current version of your code.
1. Run `git status` again and git will tell you that `main.js` is ready to be be committed.
1. Then, to save this version, run the `git commit -m "Initial commit"` command. You now have a snapshot of this version of your code.
1. To backup your code to Github and run the tests, run the `git push origin main` command.
1. Back in the browser, go to the **Actions** tab on your Github repository and see if your code passes the tests.

If your code works you should see a green checkmark. If your code did not pass the tests, you will see a red x.

From this point on, you can follow the same three-step process to commit the current version of your code and back it up to the cloud.

1. `git add main.js`
1. `git commit -m "Short description of your changes"`
1. `git push origin main`

## Reviewing Your Code

If your code is successful, ping a member of the coaching team for a review of your vocabulary and ask any questions you have about the project.
