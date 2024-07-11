#!/bin/sh

set -euo pipefail

# for backwards compatibility, separate host and port from URL
export FRONTEND_DOMAIN=${FRONTEND_DOMAIN:-${FRONTEND_HOST%:*}}
export BACKEND_DOMAIN=${BACKEND_DOMAIN:-${BACKEND_HOST%:*}}

# strip https:// or http:// from domain if necessary
FRONTEND_DOMAIN=${FRONTEND_DOMAIN##*://}
BACKEND_DOMAIN=${BACKEND_DOMAIN##*://}

echo using frontend: ${FRONTEND_DOMAIN}
echo using backend: ${BACKEND_DOMAIN}

exec caddy run --config Caddyfile --adapter caddyfile 2>&1
