#!/bin/sh

curl https://stage.wepayapi.com/v2/user/ \
    -H "Authorization: Bearer $TOKEN"

# {"user_id":168222854,"first_name":"Jason","last_name":"Walsh","user_name":"Jason Walsh","email":"jwalsh@booster.com","state":"registered"}%
