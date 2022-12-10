#!/bin/bash

while getopts 'hu:' OPTION; do

  case "$OPTION" in
    h)
      echo -e "[*] Sample Webhook URL: https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
      echo -e "[*] If Valid Webhook, Response = no_text [OR] missing_text_or_fallback_or_attachments"
      echo -e "\n[-] Usage: slack-webhook-verify.sh -u <WebhookURL>"
      ;;
    u)
      URL="$OPTARG"
      curl -s -X POST -H "Content-type: application/json" -d '{"text":""}' "$URL"
      ;;
    ?)
      echo "[-]Usage: slack-webhook-verify.sh -u <WebhookURL>" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"


#Exploitation: https://medium.com/perimeterx/propagating-phishing-via-slack-webhooks-fc8a9a115abe
#curl -s -X POST -H "Content-type: application/json" -d '{"text":""}' "$1"