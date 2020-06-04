# Martin's Fish API

Up to this point, you've created and interacted with data within the context of your application code - like in the `fishData.js`. All of the data is just in an array that you iterate.

However, you may have noticed that any changes to that data (updates, deletions, additions) go away when you close the browser or refresh the page.

In this chapter, you are going to use a tool called `json-server` to store your application's data in JSON format on your file system instead. This will allow the data to persist from browser session to browser session.

## Why are you Learning this?

Further in the course, you will be learning how to build powerful, professional database systems. This chapter gets you started on how to think about structuring, and storing that data later on.

## API

What is an API? It's an acronym for _Application Programming Interface_. To best decribe it, reverse the words. It's an interface provided to developers to program an application.

* Video: [What is an API?](https://www.youtube.com/watch?v=s7wmiS2mSXY)
* Video: [What Is an API? Learn the Basics in 3 Minutes](https://www.youtube.com/watch?v=Rha1_St_9kw)
* Video: [What is an API? - Application Programming Interface](https://www.youtube.com/watch?v=B9vPoCOP7oY)

## Install JSON Server

```sh
npm install -g json-server
```

## Create the Fish API

Create a new sub-directory in your Martin's Aquarium project directory with the commands below. It will also create the file where all of your API data will be stored.

```sh
mkdir -p ~/workspace/martins-aquarium/api
cd ~/workspace/martins-aquarium/api
touch database.json
```

Open the `database.json` file in Visual Studio Code and place the following starter JSON in it.

```json
{
    "fish": [],
    "locations": [],
    "tips": []
}
```

See those empty arrays up there 👆🏿? Look in your `fishData`, `tipsData`, and `locationData` modules. You can copy and paste the arrays from the modules directly into this file.

Not the variable names, just the array, from `[` to `]`.

## Running JSON Server

Type the following command into the terminal once you navigate to the `api` directory.

```sh
json-server -p 8088 -w database.json
```


## Using Postman for API Queries

Postman is a valuable tool for software developers who want to explore any API resources. When you are building your own API for a group project, or when you are building one for a personal project or your capstone, Postman will help you test the API before you start writing your application code.

1. Visit the [Postman apps page](https://www.getpostman.com/apps) and download the application for your OS.
1. Watch the wonderful [Postman Beginner Tutorial](https://www.youtube.com/playlist?list=PLhW3qG5bs-L-oT0GenwPLcJAPD_SiFK3C) series on YouTube.

Your instruction team will demonstrate the usage of Postman as well.

## Practice

Practice using Postman to perform GET, POST, PUT, and DELETE operations on your new fish API.

1. GET all fish.
1. Use POST to create some new fish.
1. GET all foods and use the [sort capabilities of json-server](https://github.com/typicode/json-server#sort) to sort the fish by size. Ten sort them by location.
1. Delete a fish from the API by using the DELETE method, and putting in the URL of a specific resource (e.g. `http://localhost:8008/fish/7`)
