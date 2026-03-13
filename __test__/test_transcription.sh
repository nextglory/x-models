#!/bin/bash

echo "Testing transcription with tiny model..."

cd ..

# Create test audio (1 second silence)
sudo -u xdocker ffmpeg -f lavfi -i anullsrc=r=16000:cl=mono -t 1 -y audio/test.wav 2>/dev/null

# Run transcription
echo "MODEL=tiny" > .env.test
echo "AUDIO_FILE=test.wav" >> .env.test
echo "DEVICE=cpu" >> .env.test
cp .env.test .env
result=$(sudo -u xdocker podman-compose run --rm whisper 2>&1)

if echo "$result" | grep -q "Detected language"; then
  echo "✓ Transcription successful"
  rm -f .env.test audio/test.wav
  exit 0
else
  echo "✗ Transcription failed"
  echo "$result"
  rm -f .env.test audio/test.wav
  exit 1
fi
