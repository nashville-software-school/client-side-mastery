# Writing Math Tests

## Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/mjd/calculator && cd $_
```

## Requirements

Your task is to download the stand-alone version of Jasmine and author failing unit tests for each of the functions listed below and then make each one pass.

### Unit Tests

1. Write unit tests to check for the existence of the following functions:
    1. `add()`
    1. `subtract()`
    1. `multiply()`
    1. `divide()`
    1. `square()`
    1. `squareRoot()`
1. Write unit tests that will verify the expected output of each of those functions.

### User Interface

1. Create a user interface for a calculator. One text input and 6 buttons.
1. The user will enter a number in the text input.
1. The user will then press one of the buttons for an operation.
1. The input field should be cleared so that a new number can be typed in.
1. The user will then type in a new number and press enter.
1. The resulting value of the operation should then be in the text input.
