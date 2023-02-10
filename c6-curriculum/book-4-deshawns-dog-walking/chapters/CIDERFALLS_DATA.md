# Cider Falls Data Design

Now that you hav a visualization of how the project will be presented to the user in the browser, it is time to design the data needed for the project.

1. What are the main resources? For example, one resource is **Guests**.
1. What are the properties of each resource?
1. What are the relationships between the resources?

## Hints

Here are some helpful hints to get you moving if you feel stuck.

<details>
    <summary>Main resources</summary>

These are the main resources, but may not be all of the tables you define in your ERD. That will depend on what you determine their relationships to be.

1. ParkAreas
1. Services
1. Guests

</details>

<details>
    <summary>How to determine relationships</summary>

Pick two resources in your ERD. For example, ParkAreas and Guests. Then ask yourself the following two questions.

1. Can a park area have many guests?
1. Can a guest currently be visting many park areas?

If the answer to only one of those questions is yes, the you have a one-to-many relationship. You put the foreign key on the correct resource and draw the relationship.

If the answer both one of those questions is yes, then you have a many-to-many relationship. This requires a joining table between the resources which will contain a foreign key to each main resource. Then draw both relationships.
</details>
