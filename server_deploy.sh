#!/bin/sh
set -e
 
echo "Deploying application ..."
 
# Update codebase
git fetch origin main
git reset --hard origin/main

# Install dependencies based on lock file
composer install --no-interaction --prefer-dist --optimize-autoloader

# Install npm and build
npm i
npm run build

# Migrate database
php artisan migrate --force

# Note: If you're using queue workers, this is the place to restart them.
# ...

# Clear cache
php artisan optimize
 
echo "Application deployed!"