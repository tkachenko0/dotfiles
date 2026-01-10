#!/bin/bash
curl -s \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $AUTH_TOKEN" \
  "$BASE_URL/posts" | jq .
