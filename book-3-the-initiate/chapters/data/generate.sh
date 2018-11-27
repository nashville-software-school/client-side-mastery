#!/bin/bash

# Requires `npm i -g json`

curl -s -X POST -D - --header "Content-Type: application/json" --data '{
    "token": "ZX00vCB9q-xEySKbDbO_6w",
    "data": {
        "_repeat": 30,
        "first_name": "nameFirst",
        "last_name": "nameLast",
        "location": {
            "street": "addressStreetName",
            "city": "addressCity",
            "state": "addressState",
            "country": "addressCountry"
        },
        "contacts": {
            "email": "functionArray|3|internetEmail",
            "mobile": "phoneMobile"
        },
        "job": {
            "company": "companyName",
            "department": "companyDepartment",
            "position": "personTitle",
            "phone_number": "phoneHome"
        }
    }
}' http://app.fakejson.com/q | json -i
