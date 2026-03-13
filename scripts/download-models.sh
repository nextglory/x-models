#!/bin/bash

MODELS="${@:-tiny small medium}"

echo "Building image..."
podman-compose build

for model in $MODELS; do
  echo "Downloading model: $model"
  podman-compose run --rm whisper --model $model /dev/null
done

echo ""
echo "Downloaded models:"
ls -lh whisper-models/
