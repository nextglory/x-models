# Whisper Runner

Transcribe audio files using OpenAI Whisper in Docker/Podman.

## Setup

1. Download models:
```bash
./scripts/download-models.sh tiny small medium
```

2. Configure `.env`:
```bash
MODEL=small
AUDIO_FILE=audio.mp3
DEVICE=cpu  # or 'gpu' for GPU acceleration
```

## Usage

Place audio file in `audio/` folder and run:
```bash
podman-compose up
```

Or override variables:
```bash
AUDIO_FILE=myfile.wav MODEL=tiny podman-compose up
```

### GPU Usage

To use GPU acceleration:
1. Set `DEVICE=gpu` in `.env`
2. Rebuild: `podman-compose build`
3. Run with GPU profile: `podman-compose --profile gpu up`

## Available Models

- `tiny` (73M) - Fastest
- `small` (462M) - Balanced
- `medium` (1.5G) - High accuracy
- `base` (139M) - Default

## Testing

Run all tests:
```bash
cd __test__
./run_all_tests.sh
```

Individual tests:
- `./test_models.sh` - Check downloaded models
- `./test_transcription.sh` - Test transcription
- `./test_audio_formats.sh` - Test WAV/MP3 formats
- `./test_gpu.sh` - Check GPU support
