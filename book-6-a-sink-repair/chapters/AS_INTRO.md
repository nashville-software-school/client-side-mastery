# A Sink Repair Service

Maude &amp; Merle Baumgardner were married in 1994 after a brief courtship. They are both licensed plumbers and met while working a job together on a major office building.

Sparks flew.

Now they have decided to start a family business and started a sink repair and plumbing service.

They have hired you to create a web application that will let people submit service requests that they can view quickly what needs to be done.

They want a form where a person can enter in a description of the job, the address where the work needs to be done, their spending limit for the job, and a date the work should be completed by.

Once they are done with a job, they want a way to...

1. Track who worked on the service request.
2. Once Maude and/or Merle are recorded to have finished the job, they want the UI to reflect that the job is complete.

If they don't have time to work on a particular request, they want the ability to delete it from the list.

## ERD

Just from that general description of their needs, take a shot at creating an ERD that will store all of the information needed for this application.

Once you feel you have a good ERD, review it with an instructor.

## Setup

Run the following command to get your basic directory structure set up. It will create a project directory for you at `~/workspace/sink-repair`.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-6-a-sink-repair/chapters/scripts/sink-repair-setup.sh)"
```