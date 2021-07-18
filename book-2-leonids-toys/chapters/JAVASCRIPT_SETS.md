# JavaScript Sets

A `Set()` is another type of container like an array. It can group things together, and can be iterated. However, unlike an array, a Set contains unique items.

For example, in an array, I can add the numbers 2 and 3 multiple times and they will all be in the array.

```js
const numbers = []

numbers.push(2)
numbers.push(2)
numbers.push(3)
numbers.push(3)
numbers.push(2)

console.log(numbers)  //  [ 2, 2, 3, 3, 2 ]
```

In a Set, no matter how many times I add the number 2 or 3, it will only be in the Set once.

```js
const numbers = new Set()

numbers.add(2)
numbers.add(2)
numbers.add(3)
numbers.add(3)
numbers.add(2)

console.log(numbers)  //  Set { 2, 3 }
```

Even for data structures like objects, they can be added more than once in array but only once in a Set.

```js
const garden = []
const tulip = { id: 1, color: "Red", type: "tulip" }
const orchid = { id: 2, color: "Mauve", type: "orchid" }

garden.push( tulip )
garden.push( tulip )
garden.push( orchid )

console.log(garden)

/*
Output:

[ { id: 1, color: 'Red', type: 'tulip' }, 
  { id: 1, color: 'Red', type: 'tulip' }, 
  { id: 2, color: 'Mauve', type: 'orchid' } ] 
*/
```

A Set will only have a single tulip in it.

```js
const garden = new Set()
const tulip = { id: 1, color: "Red", type: "tulip" }
const orchid = { id: 2, color: "Mauve", type: "orchid" }

garden.add( tulip )
garden.add( tulip )
garden.add( orchid )

console.log(garden)

/*
Output:

Set { { id: 1, color: 'Red', type: 'tulip' }, 
  { id: 2, color: 'Mauve', type: 'orchid' } } 
*/
```

## Iterating a Set

You can use the `for..of` loop just like you have been doing for an array.

```js
for (const flower of garden) {
    console.log(flower)
}

/*
Output:

{ id: 1, color: 'Red', type: 'tulip' } 
{ id: 2, color: 'Mauve', type: 'orchid' } 
*/
```

## Challenge: Toy Inventory Set

Modify your Leonid's Toy code to use a Set for toy storage instead of an array to ensure that the same toy does not get added to the inventory more than once.
