# Your Own Database

In this chapter, you are going to use a tool called [json-server](https://github.com/typicode/json-server) to run your own, local API in which you will manage the data for GiffyGram.

## Setup

First, you need to create a new sub-directory in your project named `api`. In that directory, create a file named `giffygram.json`. This fill will store the raw data for your API.

```sh
mkdir -p ~/workspace/giffygram/api && cd $_
touch giffygram.json
```

Now open `giffygram.json` in Visual Studio Code, and place the following starter JSON inside of it.

```json
{
	"users": [],
	"posts": [],
	"messages":[]
}
```

These arrays will store objects as you create them. Refer back to the ERD to determine the properties on each object. 

[What is JSON?](https://www.w3schools.com/whatis/whatis_json.asp) JSON stands for JavaScript Object Notation


### Start json-server

Now that your JSON has been created, you can use json-server to start your own GiffyGram API. This will run within the `api` directory.

```sh
json-server -p 8088 -w giffygram.json
```

Once you run that, you will see a happy little guy displayed, along with the URL that json-server is making available. That URL (http://localhost:8088/) will be the target of all your `fetch()` calls when you request data, add data, and delete data.


Remember, json-server is a tool that allows you to access your data via an HTTP request. That means you can throw `http://wwwlocalhost:8088/` into a browser tab URL bar, or use Postman, to `GET` your data. Of course, you can just peek at `giffygram.json` to see the data, as well. But where's the fun in that? 

## Close JSON-Server
It is a good idea to close the server when you stop work on a project (or for the day). Keyboard control: `control c`


## <h3 id="DJ-Practice">Practice: Journal</h3>
After you have created the ERD for your journal, go ahead and set up json-server. Try adding a journal entry object to the entry resource.

## <h3 id="MA-Practice">Practice: Martins Aquarium</h3>
Once you have created an ERD for Martin's Aquarium, set up json-server. You should have a minimum of 3 resources: fishes, tips, and locations. Include the properties needed for each. Share your ERD and API with a member of the instruction team.