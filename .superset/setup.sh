#!/usr/bin/env bash
# Superset workspace setup: copy untracked local files from the main checkout
# and make sure dependencies are present. Safe to re-run.
set -u
cd "$(dirname "$0")/.."

ROOT="${SUPERSET_ROOT_PATH:-}"

# 1. Copy untracked/gitignored local files (env, secrets) from the main checkout.
if [ -n "$ROOT" ] && [ -d "$ROOT" ] && [ "$ROOT" != "$PWD" ]; then
    for f in "$ROOT"/.env "$ROOT"/.env.* "$ROOT"/.superset/config.local.json; do
        [ -f "$f" ] || continue
        rel="${f#"$ROOT"/}"
        if [ ! -e "$rel" ]; then
            mkdir -p "$(dirname "$rel")"
            cp "$f" "$rel" && echo "Copied $rel from main checkout."
        fi
    done
else
    echo "SUPERSET_ROOT_PATH not set (or is this checkout); skipping file copy."
fi

# 2. Submodules (utils/, Algocynfas/) are needed only for `make local`.
#    Initialize them only if the main checkout has them initialized, to keep setup fast.
if [ -n "$ROOT" ] && [ -f "$ROOT/utils/html_include.awk" ]; then
    git submodule update --init --recursive \
        || echo "warn: submodule init failed; 'make local' will not work."
fi

# 3. Ruby test dependency (minitest). Never run a bare `bundle install` here:
#    with the system Ruby it may prompt for sudo and hang setup.
if command -v bundle >/dev/null 2>&1; then
    bundle check >/dev/null 2>&1 \
        || echo "warn: Ruby gems missing; run 'bundle install' manually if you need the Ruby tests."
fi

command -v python3 >/dev/null 2>&1 \
    || echo "warn: python3 not found; the Run command needs it."

echo "Workspace setup complete."
exit 0
