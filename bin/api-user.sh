#!/bin/sh
# Simplify the reporting on the user accounts we care about on
# staging:

# These are just pulled from the API calls that only expected the
# access token (.com/developer/reference/access-tokens)

# user: https://www.wepay.com/developer/reference/user (modification,
# registration, confirmation)

for E in user account/find
do
    echo
    echo $E
    curl https://stage.wepayapi.com/v2/$E \
        -H "Authorization: Bearer $TOKEN"

done

# Output: Sample output for the user should look something like
# {"user_id":168222854,"first_name":"Jason",
#  "last_name":"Walsh","user_name":"Jason Walsh",
#  "email":"jwalsh@booster.com","state":"registered"}

# These calls require additional parameters in addition to the
# authorization header

for E in account
do
    echo
    echo $E
    curl --data "account_id=$ACCOUNT" https://stage.wepayapi.com/v2/$E \
        -H "Authorization: Bearer $TOKEN"
done
