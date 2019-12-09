# Astronomy Picture of Which Day

By default, the Astronomy Picture of the Day API will return today's photo. However, you can specify exactly which day's photo you want to retrieve.

For example, the following URL will get today's photo. Place your API key in the URL below instead of the `x` characters.

https://api.nasa.gov/planetary/apod?api_key=xxxx.xx.xxxx

But if you want the photo from October 3rd, 2019, you get specify that as a query string parameter.

https://api.nasa.gov/planetary/apod?api_key=xxxx.xx.xxxx&date=2019-10-03

## Fetch by Date

Your job is to allow your user to select a date from a date control (i.e. `<input type="date">`) and when the Search button is clicked, use that input value to add the date to the end of the URL you have in your `fetch` call.