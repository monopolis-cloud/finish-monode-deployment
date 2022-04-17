#!/bin/ash -xe

get_from_event() {
  jq -r "$1" "${GITHUB_EVENT_PATH}"
}

if [ -z "${INPUT_STATUS}" ]; then
  echo "Missing input status"
  exit 1
fi
INPUT_STATUS=$(echo "$INPUT_STATUS" | tr '[:upper:]' '[:lower:]')

if jq --exit-status '.inputs.deployment_id' "$GITHUB_EVENT_PATH" >/dev/null; then
  MONOPOLIS_URL="https://github-api.monopolis.cloud/deploy/finish/$(get_from_event '.repository.full_name')/$(get_from_event '.inputs.deployment_id')/${INPUT_STATUS}"

  curl --fail -X POST "${MONOPOLIS_URL}" -H "Authorization: Bearer ${GITHUB_TOKEN}"
fi
