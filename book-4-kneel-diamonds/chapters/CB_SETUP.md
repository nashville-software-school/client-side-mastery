# Cars 'R Us

For this application, you are going to allow customers to design their own car detailing package and place an order for a new car with those options. In the Guided Tour, you generated radio buttons to allow customers to choose their option for each kind of resources, but in this project, you will be using `<select>` elements to create the dropdown controls.

<img src="./images/car-builder-overview.gif" alt="animataion of car builder user interface" width="800px">

## Setup

1. Create `workspace/cars-r-us` directory.
1. Create `scripts` and `styles` sub-directories
1. Create `main.js` and `database.js` in scripts directory

## Options

There will be four different sets of options.

### Paint Color

Customer should be able to choose one of the following paint colors. You set the price for each one.

1. Silver
1. Midnight Blue
1. Firebrick Red
1. Spring Green

### Interior

Customer can choose from the follow options for interior seat types. You set the price for each one.

1. Beige Fabric
1. Charcoal Fabric
1. White Leather
1. Black Leather

### Technology

Customer can choose from the follow options for the tech capabilities of the car dashboard. You set the price for each one.

1. Basic Package _(basic sound system)_
1. Navigation Package _(includes integrated navigation controls)_
1. Visibility Package _(includes side and reat cameras)_
1. Ultra Package _(includes navigation and visibility packages)_

### Wheels

Customer can choose from the follow options for wheels. You set the price for each one.

1. 17-inch Pair Radial
1. 17-inch Pair Radial Black
1. 18-inch Pair Spoke Silver
1. 18-inch Pair Spoke Black

## ERD

Before you create any actual state data structures in your code, create an ERD for this application. Consider not only the resources above, but also how the customer's order will be stored and the properties on those objects.

Once you have an ERD created, but are unsure if you got it right, feel free to run it by your peers or an instructor.

## Database

Once your ERD is complete, then go to the `database` module and start setting up your data structures for each resource. Also set up the `get*()`functions for each collection of customizations so that other modules can import the data and convert it to HTML.

You might forget some of them now, and that's fine. You'll discover what you missed when you start to build out the functionality.
