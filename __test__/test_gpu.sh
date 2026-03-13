#!/bin/bash

echo "Testing GPU availability..."

cd ..
result=$(sudo -u xdocker podman-compose run --rm whisper --help 2>&1 | grep -i "cuda\|gpu")

if [ -n "$result" ]; then
  echo "✓ GPU support detected"
  echo "$result"
else
  echo "⚠ No GPU support (CPU mode)"
fi
