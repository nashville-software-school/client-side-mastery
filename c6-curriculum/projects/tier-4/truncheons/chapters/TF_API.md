# Building Your Game API

In this chapter, you will be creating your own, local API which you will use to persist data for your Truncheons &amp; Flagons game application. 

### Creating Your Database File

Go to your project's API directory.

```sh
cd ~/workspace/truncheons/api
```

Create your database file.

```sh
touch database.json
```

Create the base collections. You fill in the array with some sample teams, a few players for each team, and one some game score for teams of your choosing.

```json
{
    "teams": [],
    "players": [],
    "teamScores": []
}
```

## Starting Your Server

Then fire up your API with the following command.

```sh
json-server -p 8088 -w database.json
```

You should see the following output in your terminal.

![](./images/tf-api-start.png)
