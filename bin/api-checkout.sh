#!/bin/sh

echo Validating the staging setup for WePay

curl https://stage.wepayapi.com/v2/checkout/create \
    -H "Authorization: Bearer $TOKEN" \
    -d "account_id=$ACCOUNT" \
    -d "amount=24.95" \
    -d "short_description=A brand new soccer ball" \
    -d "type=GOODS" | python -mjson.tool | tee /tmp/api-checkout.txt

export CHECKOUT_ID=$(grep "checkout_id" /tmp/api-checkout.txt | cut -d ',' -f 1 | cut -d ':' -f 2)
echo checkout_id: $CHECKOUT_ID



for E in checkout
do
    echo
    echo $E
    curl --data "checkout_id=$CHECKOUT_ID" https://stage.wepayapi.com/v2/$E \
        -H "Authorization: Bearer $TOKEN" | python -mjson.tool
done
