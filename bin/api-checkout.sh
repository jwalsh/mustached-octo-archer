#!/bin/sh

echo Validating the staging setup for WePay

curl https://stage.wepayapi.com/v2/checkout/create \
    -H "Authorization: Bearer $TOKEN" \
    -d "account_id=$ACCOUNT" \
    -d "amount=24.95" \
    -d "short_description=A brand new soccer ball" \
    -d "type=GOODS"
