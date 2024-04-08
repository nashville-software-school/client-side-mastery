# Frequency Duplicates

This exercises uses the same data as the previous one.

You notice that the communication device repeats the same frequency change list over and over. To calibrate the device, you need to find the first frequency it reaches twice.

For example, using the same list of changes above, the device would loop as follows:

* Current frequency  0, change of +1; resulting frequency  1.
* Current frequency  1, change of -2; resulting frequency -1.
* Current frequency -1, change of +3; resulting frequency  2.
* Current frequency  2, change of +1; resulting frequency  3.
(At this point, the device continues from the start of the list.)
* Current frequency  3, change of +1; resulting frequency  4.
* Current frequency  4, change of -2; resulting frequency  2, which has already been seen.

In this example, the first frequency reached twice is 2. Note that your device might need to repeat its list of frequency changes many times before a duplicate frequency is found, and that duplicates might be found while in the middle of processing the list.

## Helpful Hint

Don't look at the hint unless you're stuck, or you feel you have a successful algorithm.

<details>
    <summary>Duplicate frequency</summary>

55250
</details>