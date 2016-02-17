#!/bin/bash

set -eu

echo "POSTing to https://api.buildkite.com/v2/organizations/${TRIGGER_ORG_SLUG}/pipelines/${TRIGGER_PIPELINE_SLUG}/builds"

curl \
  "https://api.buildkite.com/v2/organizations/${TRIGGER_ORG_SLUG}/pipelines/${TRIGGER_PIPELINE_SLUG}/builds" \
  -X POST \
  --fail \
  -H "Authorization: Bearer ${TRIGGER_API_ACCESS_TOKEN}" \
  -d "{
    \"commit\": \"${TRIGGER_COMMIT}\",
    \"branch\": \"${TRIGGER_BRANCH}\",
    \"message\": \"${TRIGGER_MESSAGE}\"
  }"
