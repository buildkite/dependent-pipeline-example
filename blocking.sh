#!/bin/bash

set -euo pipefail

echo "--- :package: Creating a build"

NEW_BUILD_JSON=$(
  curl \
    "https://api.buildkite.com/v2/organizations/${TRIGGER_ORG_SLUG}/pipelines/${TRIGGER_PIPELINE_SLUG}/builds" \
    -X POST \
    --fail \
    -s \
    -H "Authorization: Bearer ${TRIGGER_API_ACCESS_TOKEN}" \
    -d "{
      \"commit\": \"${TRIGGER_COMMIT}\",
      \"branch\": \"${TRIGGER_BRANCH}\",
      \"message\": \"${TRIGGER_MESSAGE}\"
    }"
)

echo "$NEW_BUILD_JSON"

BUILD_URL=$(echo "$NEW_BUILD_JSON" | ruby -rjson -e 'puts JSON.parse($<.read)["url"]')

echo "Build URL: $BUILD_URL"

echo "--- :stopwatch: Waiting for build to finish"

while :
do
  BUILD_JSON=$( curl "$BUILD_URL" -s --fail -H "Authorization: Bearer ${TRIGGER_API_ACCESS_TOKEN}" )
  BUILD_FINISHED=$( echo "$BUILD_JSON" | ruby -rjson -e 'puts JSON.parse($<.read)["finished_at"]' )
  BUILD_STATE=$( echo "$BUILD_JSON" | ruby -rjson -e 'puts JSON.parse($<.read)["state"]' )
  
  echo "Build is $BUILD_STATE"

  if [[ "$BUILD_FINISHED" != "" ]]; then
    break;
  fi

  echo "Waiting 5 seconds..."

  sleep 5
done

if [[ "$BUILD_STATE" == "passed" ]]; then
  echo "+++ :thumbsup: Build was a great success"
  exit 0
else
  echo "+++ :thumbsdown: Build $BUILD_STATE"
  exit 1
fi
