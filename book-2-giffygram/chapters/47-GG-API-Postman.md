# API and Postman

Postman is a tool that will allow you to quickly test and make requests on an API without writing all kinds of JavaScript.

[Postman](https://www.postman.com/downloads/)

## Postman Get
### Test out getting data from an external API. 
* Postman: My workspace and then `+` new request.
* https://swapi.dev/
* Review documentation to `get` types of data
* `Get`

### Test out getting data from GiffyGram API
* Run json-server in your api directory.
* Postman: My workspace and then `+` new request.
* `Get`
* `http://localhost:8088/users`
* We should see an empty array.

## Postman Post

Test out putting data into GiffyGram API
* Postman: My workspace and then `+` new request.
* `Post`
* Name of resource: `http://localhost:8088/users`
* Select the following options: `Body >> raw and JSON`
* Based on the ERD, create a user object - do NOT include id
* JSON format requires quotes surrounding key names
```json
{
    "name": "Bryan",
    "email": "bryan@bn.com"
}
```
In the Postman app, change the `Post` to `Get`. We should see objects with an id.

Test out putting a post into GiffyGram API. Refer to your ERD for all of the properties. 


### <h3 id="DJ-Practice"> Practice Journal API Calls</h3>
* Through Postman, use `Post` to add additional entries to your Journal API
* Through Postman, use `Get` to display all entries of your Journal API