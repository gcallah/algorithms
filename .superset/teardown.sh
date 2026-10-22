#!/usr/bin/env bash
# Superset workspace teardown: stop the dev server started by run.sh, if still alive.
set -u
cd "$(dirname "$0")/.."

PIDFILE=.superset/.server.pid
if [ -f "$PIDFILE" ]; then
    pid=$(cat "$PIDFILE")
    # Only kill it if it is still our http.server (guards against PID reuse).
    if kill -0 "$pid" 2>/dev/null && ps -p "$pid" -o command= | grep -q 'http.server'; then
        kill "$pid" && echo "Stopped dev server (pid $pid)."
    fi
fi
rm -f "$PIDFILE" .superset/.port
exit 0
