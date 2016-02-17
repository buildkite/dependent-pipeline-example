#!/bin/bash

set -eu

[[ "$TRIGGER_API_ACCESS_TOKEN" == "change-me" ]] && echo "You need to set \$TRIGGER_API_ACCESS_TOKEN" && exit 1
[[ "$TRIGGER_ORG_SLUG" == "change-me" ]] && echo "You need to set \$TRIGGER_ORG_SLUG" && exit 1
[[ "$TRIGGER_PIPELINE_SLUG" == "change-me" ]] && echo "You need to set \$TRIGGER_PIPELINE_SLUG" && exit 1

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
