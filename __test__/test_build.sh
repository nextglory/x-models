#!/bin/bash

echo "Testing Docker build..."

cd ..
sudo -u xdocker podman-compose build

if [ $? -eq 0 ]; then
  echo "✓ Docker build successful"
else
  echo "✗ Docker build failed"
  exit 1
fi
