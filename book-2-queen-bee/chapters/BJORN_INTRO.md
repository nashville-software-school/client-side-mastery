# Björn's Wilderness Adventures


<img src="./images/adventures.png" width="300px" align="left" />

Björn Tôrvalds has always loved the wilderness. His parents spent much of his childhood camping in national parks, hiking the Blue Ridge Parkway, and going on thrilling river rafting adventures.

When he turned 20, he knew what he wanted to do with the rest of his life - share his love of the outdoors with the world. He decided to start his own business called **_Björn's Wilderness Adventures_**. As his business grew, he started offering more services, and his staff quickly grew.

Björn knew it was time to start managing his business with software. He has hired you as his first software developer after trying to do it himself, and quickly realizing that it was not his forte.

You will quickly discover some of the mistakes he made, but some of the mistakes will not be so easily to find. It's up to you to use your proficiency with the debugger to meticulously step through the code and uncover the mysteries.

## Getting Started

1. Run the following command in your terminal. It will automatically create a `workspace/wilderness` directory for you, and create a file in that directory named `adventure.js`, and navigate you to that directory.
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-1-queen-bee/chapters/scripts/bjorn-adventure.sh)"
   ```
2. Open the directory in VS Code with the `code .` command.
3. Open the `adventure.js` file.
4. Run the code with your debugger.

You should see the following output.

```sh
   B J Ö R N ' S   W I L D N E R N E S S   A D V E N T U R E S
   ***********************************************************

                                                        ###
        ______                                         #o###
       /     /\     (              ______            #####o###
      /     /  \     )            /     /\          #o#\#|#/###
     /_____/----\_    (          /     /  \          ###\|/#o#
    "     "          ).         /_____/----\_         # }|{  #
   _ ___          O (:') o      "  "     "   "          }|{
  (@))_))        O ~/~~\~ o                             }|{
                  o     O                          ____/   \____
                     O

***************************************************
*****              T R A I L S                *****
***************************************************
We service 45.54 miles of wilderness trails across the US
Process exited with code 1
Uncaught ReferenceError ReferenceError: shortestTrail is not defined
    at <anonymous> (/Users/you/workspace/cohort64/björn/chapter_01.js:462:20)
    at Module._compile (internal/modules/cjs/loader:1239:14)
    at Module._extensions..js (internal/modules/cjs/loader:1293:10)
    at Module.load (internal/modules/cjs/loader:1096:32)
    at Module._load (internal/modules/cjs/loader:935:12)
    at executeUserEntryPoint (internal/modules/run_main:84:12)
    at <anonymous> (internal/main/run_main_module:23:47)
```

## Your First Tasks

1. Björn knows that his company offers tours of nearly 717 kilometers of trails across the country.
2. The shortest trail they offer tours of is 6.6 kilometers, but he can't get that to show up.
3. The longest trail is 49.2 kilometers. Björn believes he has the right code for it, but since the shortest trail won't work, he can't verify if the longest code is correct.
