#!/bin/bash

echo "Testing all models..."

cd ..
models=("tiny" "small" "medium")

for model in "${models[@]}"; do
  echo "Testing $model model..."
  result=$(sudo -u xdocker podman-compose run --rm whisper --model $model --help 2>&1)
  
  if [ $? -eq 0 ]; then
    echo "✓ $model model works"
  else
    echo "✗ $model model failed"
    exit 1
  fi
done

echo "All models tested successfully!"
