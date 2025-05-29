FROM ghcr.io/open-webui/open-webui:main

# Install required packages: Node.js, npm, Python build tools, tini
RUN apt update && \
    apt upgrade -y && \
    apt install -y curl python3-pip python3-venv git tini && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt install -y nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

WORKDIR /app

# Copy frontend and backend source code
COPY frontend/ ./frontend/
COPY backend/ ./backend/

# Build frontend
WORKDIR /app/frontend
RUN npm install && npm run build

# Install backend dependencies
WORKDIR /app/backend
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose ports: 8080 for OpenWebUI, 8081 for FastAPI backend
EXPOSE 8080 8081

# Copy the startup script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Use tini as init system and run the startup script
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/app/start.sh"]
