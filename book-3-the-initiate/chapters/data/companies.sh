#!/bin/bash

# Requires `npm i -g json`

curl -s -X POST -D - --header "Content-Type: application/json" --data '{
    "token": "ZX00vCB9q-xEySKbDbO_6w",
    "data": {
        "orders": "functionArray|5|numberFloat|5000,10000",
        "companyName": "companyName",
        "companyIndustry": "companyIndustry",
        "addressCity": "addressCity",
        "addressStateCode": "addressStateCode",
        "addressZipCode": "addressZipCode",
        "addressFullStreet": "addressFullStreet",
        "phoneHome": "phoneHome",
        "purchasingAgent": {
            "nameFirst": "nameFirst",
            "nameLast": "nameLast"
        },
        "_repeat": 15
    }
}' http://app.fakejson.com/q | json -i
