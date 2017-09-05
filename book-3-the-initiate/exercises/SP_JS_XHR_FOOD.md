# Pet Food

## Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/spa/food && cd $_
touch index.html
touch food.js
```

## Requirements

You are working as a junior developer for Acme, Inc. This company sells dog food. Each brand of dog food is represented by an object in an array you get back from the (fictional database) in JSON format.

```js
{
  "dog_brands": [
    {
      "name": "Chuck wagon",
      "types": [
        {
          "type": "all_natural",
          "volumes": [
            {
              "name": "32oz",
              "price": 9.99
            },
            {
              "name": "64oz",
              "price": 17.99
            }
          ]
        },
        {
          "type": "standard",
          "volumes": [
            {
              "name": "58oz",
              "price": 12.99
            },
            {
              "name": "72oz",
              "price": 21.99
            }
          ]
        }
      ]
    },
    {
      "name": "Purina",
      "types": [
        {
          "type": "puppy",
          "volumes": [
            {
              "name": "16oz",
              "price": 8.99
            },
            {
              "name": "24oz",
              "price": 14.99
            }
          ]
        },
        {
          "type": "standard",
          "volumes": [
            {
              "name": "58oz",
              "price": 19.99
            },
            {
              "name": "72oz",
              "price": 24.99
            }
          ]
        }
      ]
    }
  ]
}
```

Your first task is to build a product page that displays all brands of dog food, the different types, with the price and size for each container volume.

Once you have all of that information listed, you need to create a second JSON file to represent the new product line for Acme, Inc. They now want to sell cat food. Your product owner gives you a spreadsheet with all the new data in it. It is your job to get this data represented correctly in JSON format and then update your page to now show cat food, along with dog food.

Brand         |   Breeds      |   Types / Prices
------------- | ------------- | ------------------- |
Purrina       | Siamese, Bengal, Showshoe, Munchkin | Kitten, 20oz, 19.99 : Kitten, 32oz, 26.99 : Kitten, 64oz, 34.99 : Elite, 20oz, 24.99 : Elite, 40oz, 47.99
Meow Meal     | Manx, Egyptian Mau, Himalayan, Rag Doll | Kitten, 24oz, 19.99 : Kitten, 48oz, 34.99 : Adult, 28oz, 22.99 : Adult, 56oz, 40.99
