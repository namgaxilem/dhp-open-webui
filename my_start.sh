#!/bin/bash

whoami

ls -l /  # check root folder
ls -l /dhp-open-webui  # or other common folders

# Start OpenWebUI start.sh at correct path (adjust path based on what you find)
bash /app/backend/start.sh &

# Start FastAPI app on port 8081
uvicorn app.main:app --host 0.0.0.0 --port 8081 --reload

wait
