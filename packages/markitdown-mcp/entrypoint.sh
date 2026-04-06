#!/bin/bash
set -x
echo "PATH: $PATH"
which uvicorn
ls -l /usr/local/bin/uvicorn
exec uvicorn markitdown_mcp.__main__:asgi --factory --host 0.0.0.0 --port 8000 --lifespan on
