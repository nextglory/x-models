ARG DEVICE=cpu

FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y ffmpeg && \
    if [ "$DEVICE" = "gpu" ]; then \
        pip install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 && \
        pip install --no-cache-dir openai-whisper; \
    else \
        pip install --no-cache-dir torch --index-url https://download.pytorch.org/whl/cpu && \
        pip install --no-cache-dir openai-whisper; \
    fi

WORKDIR /data

ENTRYPOINT ["whisper"]
