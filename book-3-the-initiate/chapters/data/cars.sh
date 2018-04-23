#!/bin/bash

# Requires `npm i -g json`

curl -s -X POST -D - --header "Content-Type: application/json" --data '{
    "token": "ZX00vCB9q-xEySKbDbO_6w",
    "data": {
        "_repeat": 5000,
        "sales_id": "cryptoUUID",
        "purchase_date": "date",
        "gross_profit": "numberFloat",
        "sales_agent": {
            "first_name": "nameFirst",
            "last_name": "nameLast",
            "email": "internetEmail",
            "mobile": "phoneMobile"
        },
        "vehicle": {
            "make": "companyName",
            "model": "productName",
            "year": "numberInt|2008,2018",
            "color": "colorText"
        },
        "credit" : {
            "credit_provider": "bankName",
            "account": "bankCCNumber"
        }
    }
}' http://app.fakejson.com/q | json -i
