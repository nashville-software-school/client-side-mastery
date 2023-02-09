# Fixing DeShawn's Application

DeShawn hired some consulting agency from overseas to build a simple application that displayed the following information.

1. A list of cities where his service is provided.
1. A list of dog walkers that are currently working for him.
1. A list of pets that are currently being given walks by his employees.
1. A full list of current assignments.

Unfortunately, the overseas developer had an unfortunate noodle-related accident, and the only version that DeShawn has is filled with bugs. Your job is to fix the bugs.

Here's what the output of the application should look like.

![](./images/deshawn-final.png)

## Setup

Run the following command in your terminal.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-4-deshawns-dog-walking/chapters/scripts/deshawn-setup.sh)"
```

That script will create the `workspace/dog-walking` directory for you. Just `cd` to that directory and open it in Viual Studio Code.

Then run the `serve` command and open the URL in Chrome.

## Bugs to Fix

This table shows you how many bugs there are in each module.

| Main | CityList | Walkers | Assignments | CSS |
|---|---|---|---|---|
| 1 | 3 | 3 | 3 | 3 |

Refer to the videos in the previous chapter to use your Chrome Dev Tools, and the debugger to find and fix the issues.

Do not use any `console.log()` statements.