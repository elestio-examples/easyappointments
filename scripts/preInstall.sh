#set env vars
#set -o allexport; source .env; set +o allexport;

cat /opt/elestio/startPostfix.sh > post.txt
filename="./post.txt"

SMTP_LOGIN=""
SMTP_PASSWORD=""

# Read the file line by line
while IFS= read -r line; do
  # Extract the values after the flags (-e)
  values=$(echo "$line" | grep -o '\-e [^ ]*' | sed 's/-e //')

  # Loop through each value and store in respective variables
  while IFS= read -r value; do
    if [[ $value == RELAYHOST_USERNAME=* ]]; then
      SMTP_LOGIN=${value#*=}
    elif [[ $value == RELAYHOST_PASSWORD=* ]]; then
      SMTP_PASSWORD=${value#*=}
    fi
  done <<< "$values"

done < "$filename"

sed -i "s~SMTP_HOST_TO_CHANGE~tuesday.mxrouting.net~g" ./email.php
sed -i "s~SMTP_USER_TO_CHANGE~${SMTP_LOGIN}~g" ./email.php
sed -i "s~SMTP_PASS_TO_CHANGE~${SMTP_PASSWORD}~g" ./email.php

rm post.txt