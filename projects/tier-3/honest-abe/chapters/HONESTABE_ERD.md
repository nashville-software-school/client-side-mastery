# Honest Abe

You need to design an ERD with dbdiagram.io to represent the financial relationship between political candidates and corporate entities. Since corporations can contribute to political action committees (PAC), your job is to help see how politicians are being funded, and if that funding is directly translating into bills that politicians [sponsor](https://en.wikipedia.org/wiki/Sponsor_(legislative)).

1. Politicians can receive donations from many PACs.
1. A legislative bill can be categorized to support only one, particular commercial interest.
1. Corporations can donate to multiple PACs, on multiple dates.
1. A bill can be sponsored by one, or more, politicians.
1. PACs can make direct contributions to as many political campaigns as it wants.
1. Corporations can have multiple interests.
1. Corporations **do not disclose** any specific information about a donation, including its interests, when it donates to a PAC. We only know the date of the donation and the amount.

The obvious resources in this system are as follows:

1. Corporation
1. Political Action Committee
1. Donations (either from corporation to PAC, or from PAC to campaign)
1. Politician
1. Legislative Bill

There are other resources that you will need to create to fulfill the requirements and represent the complex relationships. Build an ERD to visualize these relationships.

> **Important:** Before moving on to the next chapter in Honest Abe, you need to review your ERD with a member of the instruction team. It is critical that your ERD is structured correctly, or it will be impossible to complete this application.