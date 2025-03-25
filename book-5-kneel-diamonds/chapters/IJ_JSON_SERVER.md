# Database Design and API

## Entity Relationship Diagram (ERD)

In the previous chapter, we learned about Dr. Henrietta Jones and her research project on blue jeans. Now, we need to create a database to store the survey data.

Let's look at the ERD for our Indiana Jeans survey:

![](./images/indiana-jeans-erd.png)

This diagram shows:
- Two tables: `submissions` and `socioLocations`
- A one-to-many relationship: Many submissions can reference one socioLocation
- The Foreign Key `socioLocationId` in the submissions table connects to the Primary Key `id` in the socioLocations table

## Introduction to JSON Database

For our client-side applications, we will be using a JSON file to simulate a structured database, similar to what you'd find in a real-world application. While it won't have the full capabilities of a relational database like PostgreSQL or MySQL (we'll use one of these in the server-side portion of this course), it will allow us to work with data in a way that mimics how a backend stores and retrieves information.

JSON (JavaScript Object Notation) is a lightweight data format that's easy for humans to read and write, and easy for machines to parse and generate.

Our ERD acts as a blueprint for this database. It has defined each table (or in the case for our JSON file, each array) and each row in the tables (properties for each object in the tables)

In this project, we'll use a JSON file to store:
1. Survey submissions (who owns blue jeans and where they live)
2. Predefined socioeconomic locations (Urban, Suburban, etc.)

## Setting Up the JSON Database

In `database.json` in your project's `api` directory and add the following JSON content:

```json
{
  "submissions": [
    {
      "id": 1,
      "ownsBlueJeans": false,
      "socioLocationId": 1
    }
  ],
  "socioLocations": [
    {
      "id": 1,
      "label": "Urban"
    },
    {
      "id": 2,
      "label": "Suburban"
    },
    {
      "id": 3,
      "label": "Semi-Rural"
    },
    {
      "id": 4,
      "label": "Rural"
    }
  ]
}
```

This JSON file contains:
- An array of `submissions` with one sample submission
- An array of `socioLocations` with four options for survey respondents

## Introducing JSON Server API

Now that we have our database file, we need a way to interact with it. For this, we'll use **JSON Server**, a simple tool that allows us to interact with our JSON file with an API.

### What is JSON Server?

JSON Server is a Node.js package that allows you to create a fake API with zero coding. It uses a JSON file as the database and automatically generates [endpoints](./FD_INTRO_TO_API.md#-key-concepts-to-remember) to access and modify that data.

### Installing JSON Server

You should already have json-server installed. Check this by running the following command in your terminal:

If you haven't already installed JSON Server globally, run this command in your terminal:

```sh
npm install -g json-server
```

This installs JSON Server as a global tool on your computer.

### Starting JSON Server

Navigate to your project directory in the terminal and run:

```sh
json-server -p 8088 -w api/database.json
```

This command:
- Starts JSON Server on port 8088
- Watches (-w) the database.json file for changes
- Creates RESTful routes based on the top-level keys in your JSON file

You should see output similar to:

```
\{^_^}/ hi!

JSON Server is running on port 8088
```

## Understanding the API Communication Flow

When using JSON Server, the communication flow works like this:

![JSON Server Communication Flow](./images/json-server-flow.png)

1. Your JSON file (database.json) serves as the data store
2. JSON Server creates a RESTful API based on this file
3. Client applications (like Yaak) can make HTTP requests to this API
4. The API processes these requests and updates the JSON file as needed

## Testing the API with Yaak

Now let's use Yaak to test our API and see how it works.

### Making a GET Request

First, let's retrieve all the socioLocations from our database:

1. Open Yaak
2. Create a new HTTP request
3. Set the method to `GET`
4. Enter the URL: `http://localhost:8088/socioLocations`
5. Click "Send"

You should receive a response with a status code of 200 (OK) and a JSON array containing all four socioLocations.

### Understanding the POST Method

While the GET method retrieves data, the POST method allows us to create new data. Here's how it works:

1. The client sends a POST request with new data in the request body
2. The server processes the request and adds the data to the database
3. The server responds with the newly created data, including an auto-generated ID

### Making a POST Request

Let's create a new survey submission:

1. In Yaak, create a new HTTP request
2. Set the method to `POST`
3. Enter the URL: `http://localhost:8088/submissions`
4. Add a request header: `Content-Type: application/json`
5. In the request body, add:
   ```json
   {
     "ownsBlueJeans": true,
     "socioLocationId": 2
   }
   ```
6. Click "Send"

You should receive a response with:
- Status code 201 (Created)
- A JSON object of your new submission, now with an auto-generated ID

To verify the submission was saved, make a GET request to `http://localhost:8088/submissions`. You should see both the original submission and your new one.

## What We've Learned

In this chapter, we've:
- Designed a database structure using an ERD
- Created a JSON database file
- Started a JSON Server to create a RESTful API
- Learned about GET and POST HTTP methods
- Used Yaak to test API endpoints

## Next Steps

In the next chapter, we'll build the client-side interface for our survey, allowing users to select from radio buttons and submit their responses to our API.

## Practice Exercise

1. Use Yaak to make another POST request to add a new submission with:
   - `ownsBlueJeans`: false
   - `socioLocationId`: 3
2. Verify it was added by making a GET request to `/submissions`
3. Try making a GET request to `/submissions/2` to retrieve just the second submission
4. Bonus: Try making a GET request to `/submissions?_expand=socioLocation` - What's different about the response?