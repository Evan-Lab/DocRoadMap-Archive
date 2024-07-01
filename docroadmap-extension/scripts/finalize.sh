#!/bin/sh

set -e

echo 'Building project...'
next build

# Vérifiez si le répertoire out existe et contient index.html
if [ -f "out/index.html" ]; then
  echo 'Moving index.html...'
  mv out/index.html extension
else
  echo 'index.html does not exist'
  exit 1
fi

if [ -d "out/_next" ]; then
  echo 'Moving _next to next...'
  mv out/_next out/next
fi

echo 'Running sed...'
find out -type f -name '*.html' -exec sed -i 's|/next|./next|g' {} +

echo 'Creating next directory...'
rm -rf extension/next
mkdir -p extension/next

echo 'Syncing files...'
rsync -va --delete-after out/next/ extension/next/
rm -rf out
rsync -va --delete-after public/next-assets extension/
