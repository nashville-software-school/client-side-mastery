# Kandy Korner

You are going to be building your own React application based off of what you have done with the code in Nashville Honey Rae's.

1. Create another React project in `~/workspace/kandykorner` and `cd` into it.
1. Initialize your app with `npx create-react-app .`
1. Create a `src/components` directory.
1. Create your application file and component in `components/KandyKorner.js`.
1. Update `index.js` to render the **`<KandyKorner />`** component, just like you did in Honey Rae's.
1. Make sure your Kandy Korner API is running


# Kandy Korner Data

Before you start building your React application, you need a database to persist the data for it. Please follow these steps to get it set up.

```sh
cd ~/workspace
mkdir kandy-api
cd kandy-api
touch database.json
```

In your JSON file, create the following resources. Define the properties for each that you feel are appropriate. Make sure you reflect on the relationships and define all the foreign keys to establish those relationships.

| Resource | Description |
| -- | -- |
|**`locations`** | The physical location of your stores |
|**`products`** | All of the different candies that you sell in your stores |
|**`employees`** | Employees can only be assigned to work at a single store |
|**`productTypes`** | All of your candies fall into categories _(e.g. hard candies, chocolates, gummies, etc...)_ |
|**`customers`** | The people who make candy purchases at your stores |
|**`purchases`** | When a customer purchases candy at a store, a record of the transaction should be created. |

As always, if you want to run your ERD by someone on your instruction team for feedback, they are more than happy to do that with you.

## Example Locations

Here are some possible properties for a location.

* Address (`varchar`)
* Square footage (`number`)
* Handicap accessible (`boolean`)

