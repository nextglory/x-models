#!/bin/bash

echo "Running all tests..."
echo "===================="

./test_models.sh
echo ""

./test_build.sh
echo ""

./test_gpu.sh
echo ""

./test_all_models.sh
echo ""

./test_audio_formats.sh
echo ""

./test_transcription.sh
echo ""

echo "===================="
echo "All tests completed!"
