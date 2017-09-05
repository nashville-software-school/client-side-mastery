# Local Weather Application Part 2: Authentication

## Setup

You will need to have Part 1 of this assignment done before you start this part.  Part 1 of the assignment is probably located here:

```bash
~/workspace/exercises/rich-browser/weather
```

## Requirements

**given** a user wants to view weather information<br/>
**when** the user visits your application<br/>
**then** they should be presented with an authentication mechanism that allows login email and password.

**given** a user wants to view weather information<br/>
**when** the user visits your initial view<br/>
**then** there should be social sharing buttons for Facebook and Twitter

**given** a user wants to save weather information<br/>
**when** the user visits your initial view<br/>
**then** there should be an affordance (e.g. a star or link) that allows them to save a day's forecast to their profile

**given** a user wants to view their saved forecasts<br/>
**when** the user performs a gesture on an element that clearly states its purpose is to view saved data<br/>
**then** the user should be shown a list of all of their saved forecasts

**given** a user wants to delete one of their saved forecasts<br/>
**when** the user performs a gesture on an element that clearly states its purpose is to delete saved data<br/>
**then** the data should be deleteted and the user should be shows the list of all their remaining forecasts


## Challenge: OAuth
**given** a user wants to view weather information<br/>
**when** the user visits your application<br/>
**then** they should be presented with an authentication mechanism that allows login via Google, Twitter, Facebook, or Github. Pick one, at a minimum, but if you want to add all, that would be impressive.

**given** a user wants to share a day's forecast<br/>
**when** the user performs a gesture on one of the social sharing elements<br/>
**then** the user should be authenticated against that service's OAuth API and prompted with a status update affordance with the day's forecast pre-populated
