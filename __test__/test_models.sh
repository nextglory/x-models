#!/bin/bash

echo "Testing Whisper model downloads..."

# Check if models exist
models=("tiny.pt" "small.pt" "medium.pt" "base.pt")
for model in "${models[@]}"; do
  if [ -f "../whisper-models/$model" ]; then
    echo "✓ $model exists"
  else
    echo "✗ $model missing"
    exit 1
  fi
done

echo "All models downloaded successfully!"
