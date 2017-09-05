# Local Weather Application Part 1: Working with APIs

## Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/rich-browser/weather && cd $_
```

## Requirements

Use the [OpenWeatherMap](http://openweathermap.org/API) API to build an application that meets the following criteria.

**given** a user wants to view weather information<br/>
**when** the user visits your initial view<br/>
**then** there should be an input field to accept a zip code value

**given** a user wants to view weather information<br/>
**when** the user visits your initial view<br/>
**then** there should be a submit button next to the zip code field

**given** a user has entered in some text into the zip code field<br/>
**when** the user presses the enter key<br/>
**or** the user clicks the submit button<br/>
**then** the value should be validated as a zip code (5 digit number)

**given** the user has entered a valid zip code<br/>
**when** the user presses the enter key<br/>
**or** clicks the submit button<br/>
**then** the current weather for the provided zip code should be displayed, which includes

1. Temperature
1. Conditions
1. Air pressure
1. Wind speed
1. An affordance to view the forecast for the current day, the next three days, or the next 7 days

**given** the user is viewing the current forecast<br/>
**when** the user clicks on the link to view the 3 day forecast<br/>
**then** the current data (see above), and the data for the next 3 days should be displayed

**given** the user is viewing the current forecast<br/>
**when** the user clicks on the link to view the 7 day forecast<br/>
**then** the current data (see above), and the data for the next 7 days should be displayed

### Note
Temperature is returned in Kelvin. You will need to add to the query string to get results in Fahrenheit and Celsius.

* Fahrenheit: units=imperial
* Celsius: units=metric

Example:
```http://api.openweathermap.org/data/2.5/weather?q=London&appid=XXXXXX&units=imperial```


