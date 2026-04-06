FROM python:3.13-slim-bullseye

ENV DEBIAN_FRONTEND=noninteractive
ENV EXIFTOOL_PATH=/usr/bin/exiftool
ENV FFMPEG_PATH=/usr/bin/ffmpeg
ENV MARKITDOWN_ENABLE_PLUGINS=True

# Runtime dependency
# NOTE: Add any additional MarkItDown plugins here
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    exiftool

# Cleanup
RUN rm -rf /var/lib/apt/lists/*

COPY . /app
RUN pip --no-cache-dir install /app

WORKDIR /workdir

# Add a shell for debugging
RUN apt-get update && apt-get install -y --no-install-recommends bash

# Run as root
USER 0:0

ENTRYPOINT ["uvicorn", "markitdown_mcp.__main__:create_starlette_app()", "--host", "0.0.0.0", "--port", "8000", "--lifespan", "on"]
