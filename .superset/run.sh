#!/usr/bin/env bash
# Superset Run: serve the static site on a per-workspace port.
# The port is derived from the workspace name so it is stable across restarts,
# then bumped upward until a free one is found, so parallel workspaces never collide.
set -eu
cd "$(dirname "$0")/.."

NAME="${SUPERSET_WORKSPACE_NAME:-$(basename "$PWD")}"
BASE=8100
RANGE=900
start=$(( BASE + $(printf '%s' "$NAME" | cksum | cut -d' ' -f1) % RANGE ))

port_free() {
    python3 -c 'import socket,sys
s=socket.socket(); s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
try: s.bind(("127.0.0.1", int(sys.argv[1])))
except OSError: sys.exit(1)' "$1"
}

PORT="${PORT:-}"
if [ -z "$PORT" ]; then
    for i in $(seq 0 $(( RANGE - 1 ))); do
        p=$(( BASE + (start - BASE + i) % RANGE ))
        if port_free "$p"; then PORT=$p; break; fi
    done
fi
[ -n "$PORT" ] || { echo "No free port in $BASE-$(( BASE + RANGE - 1 ))." >&2; exit 1; }

echo "$PORT" > .superset/.port
echo $$ > .superset/.server.pid
echo "Serving $NAME at http://127.0.0.1:$PORT/"
exec python3 -m http.server "$PORT" --bind 127.0.0.1
