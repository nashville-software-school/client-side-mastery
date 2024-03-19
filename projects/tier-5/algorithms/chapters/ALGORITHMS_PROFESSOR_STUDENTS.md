# The Professor

## Phase 1: Rounding Grades

HackerLand University has the following grading policy:

Every student receives a grade in the inclusive range from 0 to 100.

Any grade less than 40 is a failing grade.

Latitia is a professor at the university and likes to round each student's score according to these rules:

* If the difference between the grade and the next multiple of 5 is less than 3, round the grade up to the next multiple of 5.
* If the value of the grade is less than 38, no rounding occurs as the result will still be a failing grade.

## Examples

* `grade = 84` round to 85 (85 - 84 is less than 3)
* `grade = 29` do not round (result is less than 40)
* `grade = 57` do not round (60 - 57 is 3 or higher)
* `grade = 68` round to 70 (70 - 68 is less than 3)

Given the initial value of the grade for each of Latitia's _n_ students, write code to automate the rounding process.

## Function Description

* The function should accept an array of student objects as input.
* The function should return an array of student objects with the grades adjusted after rounding is complete.

## Constraints

* Each grade should be 1 ⩽ 𝓷 ⩽ 100
* Number of student grades should be 1 ⩽ 𝓷 ⩽ 30

### Sample Input

```js
[
    { id: 1, name: "Nicolas Renner", grade: 73 },
    { id: 2, name: "Patty Bahringer", grade: 67 },
    { id: 3, name: "Rodney Emard", grade: 33 },
    { id: 4, name: "Karen Gislason", grade: 38 },
    { id: 5, name: "Teresa Johnston", grade: 88 }
]
```

### Sample Output

```js
[
    { id: 1, name: "Nicolas Renner", grade: 75 },
    { id: 2, name: "Patty Bahringer", grade: 67 },
    { id: 3, name: "Rodney Emard", grade: 33 },
    { id: 4, name: "Karen Gislason", grade: 40 },
    { id: 5, name: "Teresa Johnston", grade: 90 }
]
```

## Phase 2: Passing Students

After the grade of each student has been correctly adjusted, Latitia wants to have the program automatically display the students that are currently passing her class, and those that aren't. If a student's score is 65, or higher, then the student is passing.

## Function Description

* The function should accept an array of adjusted student objects as input.
* The function should display the list of passing students first, sorted by score descending.
* The function should display the list of failing students second, sorted by score descending.

### Sample Input

```js
[
    { id: 1, name: "Nicolas Renner", grade: 75 },
    { id: 2, name: "Patty Bahringer", grade: 67 },
    { id: 3, name: "Rodney Emard", grade: 33 },
    { id: 4, name: "Karen Gislason", grade: 40 },
    { id: 5, name: "Teresa Johnston", grade: 90 }
]
```

### Sample Display

```js
Passing Students
================
Teresa Johnston (90)
Nicolas Renner (75)
Patty Bahringer (67)

Failing Students
================
Karen Gislason (40)
Rodney Emard (33)
```