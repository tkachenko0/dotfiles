#!/bin/bash
curl -s \
  -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $AUTH_TOKEN" \
  -d @"$(dirname "$0")/body.json" \
  "$BASE_URL/posts" | jq .
