# Capstone Information

## Requirements

### Proposal/Planning

1. Your proposal must clearly articulate the problem it is solving for your customers.
2. Your proposal must define a minimum of four user stories that describe the core functionality of your application. Registration and login do not count since you are given the code for those. 
3. Your proposal must include a hyperlink to your ERD and it must be accessible by the instructors. Do not include a picture of your ERD.
4. Your proposal must include wireframes that comprehensively show the journey of a user through your application.
    1. Each view must be represented. Do not include login/register unless you need to customize those views for your user experience.
    2. Buttons or links must be included with notes/arrows describing what happens when the customer clicks on it.

#### Supporting Notes

* If you are using an external API, gather all sample data and be prepared to demo your API during your one on one (via Postman and with an HTTP request in code (i.e. fetch, axios, etc.) before committing to use the API.
* For help on authoring good user stories, please refer to the [Behavior Driven Development Wikipedia entry](https://en.wikipedia.org/wiki/Behavior-driven_development#Behavioral_specifications)


### Data Design (ERD)

1. You must have an ERD for your project
1. You must have a user-related data scheme. This means that different people can authenticate with your application, and the resources that are created must be assigned to individual users.
1. In addition to having user-related data, you need to have at least one more `1 -> many` relationships defined in your ERD.
1. Having a `many -> many` relationship is recommended, but **not required** for your client side project.
1. You are required to use the persistent storage tool that you were taught _(i.e. json-server, firebase, SQL Server, SQLite)_.

#### Server Side

There are additional data design requirements for your server side capstone.

1. You must have at least one `many -> many` relationship in your ERD.

### Application Design

#### Client Side

1. You are required to use the major libraries and/or frameworks that you learned during the course _(e.g. React, etc...)_.
1. Your application must support multiple routes to show different views to the user, and the user must be able to navigate to each route/view.
1. You must show your proficiency with following the Single Responsibility Principle by writing modular code, where each module has a single responsibility _(e.g. displays a list of things, displays a single thing, manages application state, etc.)_.
2. You must have a form that allows a user to create a new resource.
3. Your form must include `<select>` element, radio button group, or checkbox group that allows a user to choose a related resource. For example, if your application allows users to create new plants for their home, one of the fields in the form must allow them to select something like the following items:
    1. The room it will be in.
    2. The level of sunlight it needs.
    3. It's type.
1. Customer must be able to delete their own data, and be prevented from deleting other customers' data.
2. It is strongly recommended that you provide the ability for your customers to edit their data. If you feel that your application does not need this ability, you must gain approval from the senior instructor to exclude it from your application.
3. You must be able to implement a flexible layout for your UI by either (a) authoring your own CSS using Flexbox, or (b) using a 3rd party framework like Bootstrap.
4. All copy for your application must be legible, so pay attention to colors, margins, padding, and font sizes.

#### Server Side

For your server side capstone at the end of the cohort, there are additional requirements.

1. You are required to use the major framework that you learned during the course _(e.g. ASP.NET, Django, etc...)_.
1. Your application must include edit capabilties.

### Interview

You will also be interviewed by the instruction team so that your knowledge and vocabulary can be assessed. This is more important than your code. If you cannot explain the concepts, the design of your ERD and modules, and the data flow, then you will not be recommended to continue in the program.

1. You must be able to demonstrate proficiency in the fundamental concepts covered in the client-side course.
    1. Functions, objects, iteration
    2. ERD and data relationships
3. You must clearly demonstrate the flow of data in your application, and you must demonstrate that flow by using the developer tools and/or debugger.
    1. You must be able to demonstrate and explain the request/response cycle in the Network tab.
    2. You must be able to demonstrate and explain component state with the React Components tab.
    3. You must be able to demonstrate and explain how to step through your code and examine the values of variables in the Sources tab.
    4. You must be able to demonstrate how to use breakpoints, or use the `debugger` keyword, to pause the execution of your code for debugging purposes.
1. You must be able to explain any key aspects of the libraries and frameworks that the instructor asks you. Here are some examples. Be aware that the instructor may ask additional things, and may not ask you about any of the example below.
    1. `useState()` and `useEffect()` in React.
    1. HTTP status codes.
    1. Explanation of `fetch()` and `then()` process for making HTTP requests.
    1. Explain how routes that your application supports are established/defined.
    1. Methods used in the ORM _(server side only)_.
    1. Explain the parts of the MVC application framework pattern, and the responsibilities of each _(server side only)_.
    1. Functions used in SQL _(server side only)_.

#### Server Side

For your server side capstone at the end of the cohort, there are additional requirements.

1. You will be asked to write one, or more, SQL queries that involve querying two, or more, tables and obtaining information from each of the specified tables.
2. You will be asked to clearly explain how a client and a server communicate with each other, and demonstrate how the data in the request and response are captured by the corresponding code.

## Additional Guidelines

To impress potential employers, make sure you complete this additional checklist. These are not part of your official NSS proficiency assessment, but can make a huge impact on how others perceive you and your professionalism.

### General

1. Project details
    1. Make sure your project name is in the `<title>` tag of `public/index.html`.
    2. Make sure your project name is correct in the `name` property in your `package.json`.
1. Forms/data
    1. Make all inputs have the correct type (e.g. numeric inputs should be of type `number`, long form text should be a `textarea`)
    2. Make sure all of your data is professional and relevant (e.g. descriptions should not be "test" or "example")
1. Have a comprehensive README that has the following sections.
    1. Introduction
    2. Purpose & motivation for project
    3. How does the application work? _(animations are always good)_
    4. How was the application developed?
    5. How to install and run the application.
    6. Difficulties & challenges faced during process.
    7. Public link _(if exists)_.
1. No zombie code. Having chunks of code that are commented out is unprofessional.
1. No console logs.
1. The console in your Developer Tools should not have any errors.
1. Student should be able to explain any warnings in the console.
1. Professional/meaningful commit and PR messages. 
1. Write a minimum of 4 integration tests for your client and/or server side project.

### Design

1. Limited color palette (3 colors)
1. Most text copy should be left aligned
1. Use of padding/margins
1. Consistency: views, cards, fonts, sizes, etc.
1. If you use images in your application, they must be resized, if needed, for display in the UI and the correct ratio must be maintained.
