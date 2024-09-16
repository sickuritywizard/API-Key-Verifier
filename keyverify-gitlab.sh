#!/bin/bash

while getopts "u:t:" opt; do
  case "${opt}" in
    u)
      URL=${OPTARG}
      ;;
    t)
      TOKEN=${OPTARG}
      ;;
    \?)
      echo "Usage: $0 -t <token> -u <company.gitlab.com>"
      exit 1
      ;;
  esac
done

if [ -z "$URL" ] || [ -z "$TOKEN" ]; then
  echo "Usage: $0 -t <token> -u <company.gitlab.com>"
  exit 1
fi

if [[ $URL == https://* ]]; then
  curl "$URL/api/v4/projects?private_token=${TOKEN}"
else
  curl "https://$URL/api/v4/projects?private_token=${TOKEN}"
fi