# Welcome to Bug Wrangler Ranch

<img src="./images/bug-wrangler.png" width="300px" alt="Cowboy coder" align="right" />

This first self-assessment is for you to hone several Core Skills that you need as a software developer.

Taking your time now to be thorough, reflective, patient and curious will give you the foundation to be successful throughout the rest of this course and your career.

If you rush this, or think of it as a test to be "passed", then you will already be on the wrong path.

> 🧨 Make sure you answer the vocabulary and understanding questions at the end of this document before notifying your coaches that you are done with the project


## Starter Code

Slim Jenkins has the existing code on Github, so you need to download it from there. Actually, developers call this process _cloning a repository_.

1. Go to the [Learning Platform](https://learning.nss.team) and click the button to start your self-assessment
2. You will receive a Slack message with the URL for your very own repository _(if this does not happen, contact one of the coaches immediately)_
3. Click on that URL
4. Click the **Code** button
5. Click on *SSH* in the window that appears
6. Copy that string
7. Go to your workspace directory
   ```sh
   cd ~/workspace
   ```
8. Then clone the repository to your machine with the following command.
   ```sh
   git clone {copy what you pasted here... no curly braces}
   ```

This will create a new sub-directory called `bug-wrangler-ranch`. Use the `cd` command to navigate into that directory and open it in VS Code.

```sh
cd bug-wrangler-ranch
code .
```

## Vocabulary and Understanding

> 🧨 When you are done with the code, open the **README.md** file and write your answers to the following questions in the corresponding `> Your answer here` spot.

1. In the **main** module, one of the first lines of code is `const drovers = hireDrovers(cattleToDrive)`. Explain what the value of the `drovers` variable is when that line of code runs.
   > Your answer here
2. At the bottom of the main module, you will see the following code - `for (const drover of drovers)`. Explain what the values of both the `drover` and the `drovers` variables are.
   > Your answer here
3. In the **journey** module, there is a `journeyMaker()` function. In that function, there is a variable named `areas` which will have the value of an object. Use your debugger to show what the value of each key is on that object. Use [Loom](https://www.loom.com) to record your session.
   > Your public Loom URL here
4. Also in the **journey** module, there is the following code:
   ```js
   for (let forestNumber = 0; forestNumber < areas.forests; forestNumber++) {
      journey.push("forest")
   }
   ```
   Explain this code with your best vocabulary.
   > Your answer here
5. Explain the value of the `database` variable in the **database** module. Be as comprehensive as possible.
   > Your answer here
6. In the **drovers** module, there is a `hireDrovers()` function. You will notice the following code on that line - `(herdSize)`. What is that defining, and where does it get its value?
   > Your answer here

## When You Are Done

After you have answered all the questions above, you need to push all of your code back up to Github. Follow these instructions.

1. Be in the `bug-wrangler-ranch` directory.
2. `git add --all`
3. `git commit -m "Code complete"`
4. `git push origin main`

Then go to the Learning Platform and click the **Self-assessment Complete** button.
