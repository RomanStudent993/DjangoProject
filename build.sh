#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

# Ensure we're in the right directory and set PYTHONPATH
cd "$(dirname "$0")" || cd .
export PYTHONPATH="$(pwd):${PYTHONPATH}"

# Verify django_project module exists
if [ ! -d "django_project" ]; then
    echo "Error: django_project directory not found!"
    ls -la
    exit 1
fi

# Run Django commands
python manage.py collectstatic --no-input
python manage.py migrate

