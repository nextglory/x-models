#!/bin/bash

echo "Testing different audio file formats..."

cd ..

# Test WAV
sudo -u xdocker ffmpeg -f lavfi -i anullsrc=r=16000:cl=mono -t 1 -y audio/test.wav 2>/dev/null
echo "MODEL=tiny" > .env.test
echo "AUDIO_FILE=test.wav" >> .env.test
echo "DEVICE=cpu" >> .env.test
cp .env.test .env
result=$(sudo -u xdocker podman-compose run --rm whisper 2>&1)
if echo "$result" | grep -q "Detected language"; then
  echo "✓ WAV format works"
else
  echo "✗ WAV format failed"
  rm -f .env.test audio/test.*
  exit 1
fi

# Test MP3
sudo -u xdocker ffmpeg -f lavfi -i anullsrc=r=16000:cl=mono -t 1 -y audio/test.mp3 2>/dev/null
echo "AUDIO_FILE=test.mp3" >> .env.test
cp .env.test .env
result=$(sudo -u xdocker podman-compose run --rm whisper 2>&1)
if echo "$result" | grep -q "Detected language"; then
  echo "✓ MP3 format works"
else
  echo "✗ MP3 format failed"
  rm -f .env.test audio/test.*
  exit 1
fi

rm -f .env.test audio/test.*
echo "All audio formats tested successfully!"
