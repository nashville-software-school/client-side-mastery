# Automated Testing

Professional software developers very often write code called **Test Suites**. You will be writing tests in your career, so having some familiarity with them now is important.

This is a light introduction.

Click the button below to watch a video that is an overview of how testing works and why it is important.

[<img src="../../../../book-1-queen-bee/chapters/images/video-play-icon.gif" height="75rem" />](https://www.youtube.com/watch?v=Jv2uxzhPFl4)

## Testing Your Code

There are some automated tests in the `test` directory of your project. To see if your code passes the tests that were created for this project, follow these steps.

1. Go to your terminal application and make sure you are in the `fish-fusion` directory. You can make sure you are there with the following command.
    ```sh
    cd ~/workspace/fish-fusion
    ```
1. Run the tests with the following command.
    ```sh
    npm run test
    ```

If all of your tests pass, you will see the following output. Once the tests run, you can press **q** to quit the testing operation.

If your tests do not pass, you can scroll up and read the output of what they failed. Each test failure will show what was the expected output of your code, and the actual output of your code.

![](./images/fish-fusion-tests.gif)
