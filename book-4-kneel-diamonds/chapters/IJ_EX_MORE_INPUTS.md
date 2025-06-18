# Explorer Chapter: Expanding Dr. Jones' Research

## An Urgent Message

*You're working late on the Indiana Jeans project when you receive an urgent email from Dr. Jones:*

---

**From:** hjones@indianapolis.edu  
**Subject:** URGENT: Survey Expansion Required!

Dear Developer,

Great news! My research grant has been expanded, and I've been given additional funding to collect more detailed data about blue jeans ownership. I need to expand our survey immediately to include two critical new data points:

1. The **brand name** of the jeans (text input)
2. The **year of purchase** (number input)

My presentation to the grant committee is tomorrow afternoon, and I need to show them our expanded survey capabilities. Can you implement these changes before then?

Remember, we need to track this data per submission and display it in our results.

Thank you for your prompt attention to this matter!

Regards,  
Dr. Henrietta Jones  
*Professor of Urbanology*  
*University of Indianapolis*

P.S. I'm currently on an archaeological dig in northern Indiana and have limited connectivity. I trust your judgment on the implementation details!

---

## Your Mission

As Dr. Jones' trusted developer, your task is to expand the Indiana Jeans survey to collect and display these additional data points. This is your chance to apply everything you've learned so far without step-by-step instructions.

## Points to Consider

As you approach this challenge, here are some questions to think about:

### Database Considerations
- How will you need to update the ERD to accommodate these new fields?
- What changes are needed in your `database.json` file?
- Do you need to modify existing submissions?

### Application Architecture
- Which modules will need to be updated?
- How will you capture the new input values?
- Where will you store these values in your transient state?

### User Interface
- How will you design the input fields?
- Where should they appear in relation to existing fields?

### Display
- How will you update the `SubmissionList` component to display the new data?
- Should the brand be displayed if the user doesn't own jeans?
