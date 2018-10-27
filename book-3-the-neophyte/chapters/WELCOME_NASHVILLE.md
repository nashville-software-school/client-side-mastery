# Welcome to Nashville: Build an itinerary for a day trip to Music City

In this app users can search for four different things to do/visit in Nashville:
* parks -- using the Nashville [Metro Gov API](https://dev.socrata.com/foundry/data.nashville.gov/xbru-cfzi)
* restaurants -- using the [Yelp API](https://www.yelp.com/developers/documentation/v3/business_search)
* meetups -- using the [Meetups.com API](https://www.meetup.com/meetup_api/)
* concerts -- using the [Songkick API](https://www.songkick.com/developer)

You will be utilizing all of the skills and concepts that you've learned up to this point in the course.

1. Functions
1. Persistent data storage
1. Github
1. CSS
1. Building DOM components
1. Handling user events
1. Modular code

## Itinerary Builder

When the user finds any item using the four modules, the user should have an affordance to add the item to the current itinerary.


To start you off, here's an example of what the itinerary in your API might look like once it's created by the user.

```json
{
	"id": 1,
	"park": "Centennial Park",
	"restaurant": "Prince’s Hot Chicken",
	"meetup": "Meeple Mountain Board Game Night",
	"concert": "John Mellencamp at the Ryman"
}
```

## Professional Requirements

1. Only one itinerary needs to exist at a time. If a user selects an item to add to the itinerary, and a item already exists for that category in the itinerary, then you will need to update the itinerary with the new data
1. All teammates must be using Grunt to run ESLint, http-server, and json-server during development
1. Each teammate is responsible for one API module. If your group has five members, one person is responsible for the module that interacts with the DOM and the data from the API modules. In a four-person team, the team will decide how to handle the development of that module.
1. The README for your project should include instructions on how another person can download and run the application. PRO TIP: Don't wait until the very end to create the README.
1. DO NOT FORGET to use a `.gitignore` file to keep git from tracking your node_modules folder
1. Styling is strictly _secondary_, beyond necessary display formatting. Do not add any additional visual enhancements until you have a fully functional app. The goal of every member of the team is to implement functionalty with JavaScript

## Visual Feature List

To help you along, here is a wireframe of how your app might look

![welcome wireframe](images/welcome_nash_wireframe2.png)

## Stretch Goals
* Add an affordance to finalize an itinerary, and start a new one.
  * Add ability to view one or all of the itineraries
* Instead of displaying all the search fields, search results, and itinerary list at the same time, add a nav bar or other feature(s) for hiding/showing what the user wants to view
