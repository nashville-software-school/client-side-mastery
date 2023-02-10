# Suspects for Multiple Cases

Now that you have been introduced to related data, primary keys, and foreign keys, you are going to take the concepts and apply them in your Notes API. The extortion case you are currently working on is only the first of many cases.

You realize that future cases may have similar suspects for you to enter notes about until they are solved. That means that when you enter notes, it's not just for a criminal, but for both a case **and** a criminal.

## The Relationship

![](./images/criminals-crimes.png)

## Refactor the API

You need to refactor the Detective Notes API so that there are collections for the following resources.

1. Cases
1. Notes

## Refactor the UI

### Recording Cases

1. Create a new form component so that you can enter in a case number _(e.g. 49450)_ and a synopsis of the crime _(e.g. "Robbery case for Tim's Tools in 2009")_.
1. Create a data provider to interact with the `/cases` resource in your Notes API. It should contain a `getCases()`, a `useCases()`, and a `createCase()` method.
1. Create a case list component so that you can see a list of open cases.

### Selecting a Case for a Note

Now refactor the notes form in your application to display a `<select>` element that contains all of the cases in the API.

```html
<select id="caseSelect">
    <option value="0">Select a case...</option>
    ${
        cases.map(case => {
            return `
                <option value="${case.id}">${case.synopsis}</option>
            `
        }).join("")
    }
</select>
```


## Advanced Challenge: Notes per case and criminal

You realize that future cases may have similar suspects for you to enter notes about until they are solved. That means that when you enter notes, it's not just for a criminal, but for both a crime **and** a criminal.

## The Relationship


![](./images/criminals-crimes.png)


## Refactor the API

You need to refactor the Detective Notes API so that there are collections for the following resources.

1. Cases
1. Notes
1. Criminals
1. CrimeSuspects
