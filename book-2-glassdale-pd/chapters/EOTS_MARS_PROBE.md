# Searching Probe Photos by Date

In this chapter, you will take what you did for the picture of the day API and apply it to search for Mars probe photos. So if you want the photos for October 3rd, 2019, your URL would look like this.

https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2019-10-03&api_key=xxxx.xx.xxx

> **Note:** Remember that everything after the question mark in a URL is called a query string parameter. Each one is a key followed by an equal sign, and then the value of that parameter.

Now refactor the method in your Mars probe photo provider that gets the data from the API to accept a single parameter that represents a date string. Then, when the user clicks the Search button in your application, pass the date chosen as a argument to the function that gets the data and then render the images in the response.