#!/bin/bash

# Requires `npm i -g json`

curl -s -X POST -D - --header "Content-Type: application/json" --data '{
    "token": "ZX00vCB9q-xEySKbDbO_6w",
        "consistent": false,
    "data": {
        "price": "numberFloat|1,24",
        "companyName": "companyName",
        "productName": "productName",
        "_repeat": 20
    }
}' http://app.fakejson.com/q | json -i
