#!/bin/bash

# Script to create a python virtual environment
# Prompts for confirmation
# Exits if .venv already exists


create_venv() {
    if [ -d ".venv" ]; then
        echo "'.venv' already exists. Aborting."
        return
    fi

    echo "Creating '.venv'..."
    python3 -m venv .venv

    if [ $? -eq 0 ]; then
        echo "'.venv' created successfully!"
    else
        echo "Failed to create '.venv'."
    fi
}

python_version=$(python3 --version 2>/dev/null)
if [ $? -ne 0 ]; then
    echo "Python3 is not installed or not found in your PATH."
    exit 1
fi

echo "$python_version"
read -p "Create '.venv'? (y/n): " response
case "$response" in
    [Yy]* ) create_venv ;;
esac
