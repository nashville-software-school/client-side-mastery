# Challenges for Ch 4: React Props and State

## Countdown (#useState)
1. Add a countdown to your page.  This is similar to the coutner, only it starts at a number and counts down.  
1. Have your countdown stop at 0.  
1. Display a message when the countdown reaches 0.

## Detials Card (#props)
Pass another prop into your `PropsAndState` component.  Have that prop be an object that contains the keys streetAddress, city, state and zip.  For example:
```js
address: {
  streetAddress: "123 NSS Way",
  city: "Nashville",
  state: "TN",
  zip: 37536
}
```

Display this information on the main page.

## Refactor (#Functional Components #props)

Refactor your Kennel's add to Pass the name and Address to it's own component.  

Display this component at least two times with different names and addresses.