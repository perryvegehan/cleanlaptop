#!/bin/bash

set -e

REPO_ROOT="$(git rev-parse --show-toplevel)"

echo "Creating Python virtual environment..."

python3 -m venv "$REPO_ROOT/.venv"

echo "Installing dependencies..."

"$REPO_ROOT/.venv/bin/python" -m pip install -r "$REPO_ROOT/requirements.txt"

echo "Installing Git hook..."

cp "$REPO_ROOT/hooks/pre-commit" "$REPO_ROOT/.git/hooks/pre-commit"

chmod +x "$REPO_ROOT/.git/hooks/pre-commit"

echo "Setup completed successfully!"
