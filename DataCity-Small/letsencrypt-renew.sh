#!/bin/bash

set -e #stop on error

if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: docker-compose is not installed.' >&2
  exit 1
fi

# PLEASE REVISE AND MODIFY domains and email
domains=(dashboard)
rsa_key_size=4096
data_path="./certbot"
email="" # Adding a valid address is strongly recommended
staging=0 # Set to 1 if you're testing your setup to avoid hitting request limits

echo "### Requesting Let's Encrypt certificate for $domains ..."
#Join $domains to -d args
domain_args=""
for domain in "${domains[@]}"; do
  domain_args="$domain_args -d $domain"
done

# Select appropriate email arg
case "$email" in
  "") email_arg="--register-unsafely-without-email" ;;
  *) email_arg="--email $email" ;;
esac

# Enable staging mode if needed
if [ $staging != "0" ]; then staging_arg="--staging"; fi

docker-compose run --user=1000:1000 --rm --entrypoint "certbot renew" certbot
echo

echo "### Reloading nginx ..."
docker-compose exec -T proxy nginx -s reload

