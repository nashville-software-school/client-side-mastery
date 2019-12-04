# Searching for Probe Photos

The next step is to create a search form that allows a user to specify the following data to find photos of Mars.

1. Probes - This should be a select element with an option for each probe
1. Date - Use a data field to let the user specify the exact date the photos were taken.

Then add a "Search Probe Photos" button for the user to click on to initiate the search.

Once the user chooses a probe and specifies a date, you will use the choices to query the NASA Mars Rover Photos API. The name of the probe is part of the URL, the date is a query string parameter, and your API key is a query string parameter. So if the user chose the Curiosity rover, and specified a date of 2016-01-09, the your `fetch` function would have the following URL _(with the `x` characters replaced with your API key)_.

https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2016-01-09&api_key=xxxxx.xx.xxxx

## Displaying the Results

You will get a JSON response that is an object with a "photos" key on it. That key will reference an an array of photo objects. Each of those objects has the data that is needed to display.

1. Display the name of the camera that took the photo.
1. Display the image.