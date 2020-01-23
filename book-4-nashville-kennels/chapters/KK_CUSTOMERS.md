# Kandy Korner Customers

In this chapter, you are going to create a login form where customers can provide their authentication and personal information so that they can make purchases online.

* Create an `components/auth/Login.js` that is nearly identical to the one you made for Kennel. The only change is that the local storage key to create should be `kandy_customer` which will store the user's primary key.
* Users can always see the list of locations.
* Update **`ApplicationViews`** so that users can only see the list of products if they have authenticated.