# Practice for Array methods 

### Array methods

```js
/* For each of the sections, consider the array and the method.  What would you expect the output to be? */

let letters = ['l', 's', 'a', 'r', 'd', 'f']

// letters.sort()

// letters.pop()

// letters.push('q')

// letters.shift()

// letters.unshift('y')

// letters.slice(1,2)

let names = ['John', 'Mandeep', 'Ruby', 'Rose', 'Jackson']

// names.concat(letters)

// names.join(' ')

// names.reverse()

let superheroes = ['Wonder Woman', 'Captain America', 'Spiderman', 'Batman', 'The Flash']

// iterate over superheroes and console log the superhero's name in the following sentance "<NAME> is a superhero!".


let superheroesDetails = [
  { 
    id: 1,
    name:'Wonder Woman',
    isDC : true
  },
  {
    id: 1,
    name:'Captain America',
    isDC : true
  },
  {
    id: 1,
    name:'Batman',
    isDC : true
  },
  {
    id: 1,
    name:'The Flash',
    isDC : true
  },
  {
    id: 1,
    name:'Spiderman',
    isDC : false
  }
]
    
// iterate over superheroesDetails if the superhero is a DC character (isDC = true)  console log "<the heros name> is in the Justice League.".  Otherwise console log "<the heros name> is a superhero" in the following sentence "<NAME> is a superhero!".

```

### .map and .filter
```js
const outfits = [
  {
    id: 1,
    bottoms: "slacks",
    top: "orange",
    shoes: "leather",
    style: "formal",
    own: false
  },
  {
    id: 3,
    bottoms: "jeans",
    top: "t-shirt",
    shoes: "flip flops",
    type: "casual",
    own: true
  },
  {
    id: 2,
    bottoms: "yoga",
    top: "tank top",
    shoes: "flip flops",
    type: "casual",
    own: false
  },
  {
    id: 9,
    bottoms: "skirt",
    top: "blouse",
    shoes: "heals",
    type: "formal",
    own: true
  },
  {
    id: 6,
    bottoms: "shorts",
    top: "tank top",
    shoes: "none",
    type: "casual",
    own: true
  },
  {
    id: 7,
    bottoms: "jeans",
    top: "sweater",
    shoes: "boots",
    type: "casual",
    own: true
  },
  {
    id: 8,
    bottoms: "slacks",
    top: "button down",
    shoes: "dress",
    type: "formal",
    own: false
  },
]

/* considering the array outfits, use map, filter and find to do the following */

//Make a copy of outfits called outfitsCopy that can be modified without changing outfits directly.  

//Change a value on outfitsCopy and use console logs to show you did not change outfits

//Make a copy (map) of outfits with the added property of accessories.  Make accessories always false.

//Make a copy (map) of outfits that contains on the properties of id, bottoms, tops and shoes

//filter outfits to give only outfits that are casual

// filter outfits to give only outfits that are owned

// use find to return an outfit that has no shoes

// use find to return an outfit that has boots


//Bonus:
// use find to return an outfit that has jeans and a t-shirt
```

### Iteration Review/Practice

```js
const animals = [
  {
    id: 3,
    name: "Rex",
    trait: "mischievous",
    species: "dog",
    isReal: true
  },
  {
    id: 9,
    name: "Joel",
    trait: "playful",
    species: "dog",
    isReal: true
  },
  {
    id: 5,
    name: "Cleo",
    trait: "friendly",
    species: "rat",
    isReal: true
  },
  {
    id: 8,
    name: "Draco",
    trait: "grumpy",
    species: "dragon",
    isReal: false
  },
  {
    id: 2,
    name: "George",
    trait: "curious",
    species: "monkey",
    isReal: true
  },
  {
    id: 1,
    name: "Peanut",
    trait: "needy",
    species: "cat",
    isReal: true
  },
  {
    id: 1,
    name: "Lexi",
    trait: "shy",
    species: "cat",
    isReal: true
  }
]

// iterate over animals and console log each animal by the following conditions:
// if the animal is a dragon console log "I am mythical."
// if the animal is a dog console log "I bark."
// if the animal is a monkey or a rat console log the animals name and "I am a rat or monkey."
// if the animal is a cat  is needy console log "I am Sydney's cat."
// if the animal does not meet any of the above conditions console log the animals name, trait and species


// BONUS:  Sort the array of animals by id.
```