#!/bin/bash

set -e

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "Creating virtual environment..."
python3 -m venv "$REPO_ROOT/.venv"

echo "Installing dependencies..."
"$REPO_ROOT/.venv/bin/python" -m pip install -r "$REPO_ROOT/requirements.txt"

echo "Installing Git hook..."
cp "$REPO_ROOT/hooks/pre-commit" "$REPO_ROOT/.git/hooks/pre-commit"
chmod +x "$REPO_ROOT/.git/hooks/pre-commit"

echo "Executing Python script for initial setup..."
"$REPO_ROOT/.venv/bin/python" "$REPO_ROOT/scripts/script.py"

echo "Setup completed!"
