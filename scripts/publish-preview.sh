#!/usr/bin/env bash
# Publishes the built preview bundle to the internal registry and posts the
# preview URL back to the calling repository using the conf-ci app token.
set -euo pipefail

REF="${1:?usage: publish-preview.sh <ref>}"
: "${REGISTRY_TOKEN:?REGISTRY_TOKEN not set}"
: "${GITHUB_TOKEN:?app token not set}"

BUNDLE="dist/"
REGISTRY="https://registry.internal.conf.example/previews"

if [[ ! -d "$BUNDLE" ]]; then
  echo "no build output at $BUNDLE; skipping publish"
  exit 0
fi

echo "publishing preview for ${REF} to ${REGISTRY}"
curl -sf -X POST "${REGISTRY}/${REF}" \
  -H "Authorization: Bearer ${REGISTRY_TOKEN}" \
  -F "bundle=@${BUNDLE%/}.tar.gz"
