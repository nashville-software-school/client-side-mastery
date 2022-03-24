# The Professor

HackerLand University has the following grading policy:

Every student receives a grade in the inclusive range from 0 to 100.

Any grade less than 40 is a failing grade.

Latitia is a professor at the university and likes to round each student's  according to these rules:

* If the difference between the grade and the next multiple of 5 is less than 3, round the grade up to the next multiple of 5.
* If the value of the grade is less than 38, no rounding occurs as the result will still be a failing grade.

## Examples

 * `grade = 84` round to 85 (85 - 84 is less than 3)
* `grade = 29` do not round (result is less than 40)
* `grade = 57` do not round (60 - 57 is 3 or higher)
* `grade = 68` round to 70 (70 - 68 is less than 3)

Given the initial value of the grade for each of Sam's _n_ students, write code to automate the rounding process.

## Function Description

* The function should accept an array of integers as input.
* The function should return an array of the grades after rounding is complete.

## Constraints

* Each grade should be 1 ⩽ 𝓷 ⩽ 100
* Number of student grades should be 1 ⩽ 𝓷 ⩽ 30

### Sample Input

```js
[ 73, 67, 38, 33 ]
```

Sample Output 0

```js
[ 75, 67, 40, 33 ]
```
