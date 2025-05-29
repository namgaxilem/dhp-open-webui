FROM ghcr.io/open-webui/open-webui:main

RUN apt update && \
    apt upgrade -y && \
    apt install -y curl nodejs npm tini && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

WORKDIR /dhp-open-webui

# Copy frontend and backend code
COPY frontend/ ./frontend/
COPY backend/ ./backend/

# Build frontend
WORKDIR /dhp-open-webui/frontend
RUN npm install && npm run build

# Install backend dependencies
WORKDIR /dhp-open-webui/backend
RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8080 8081

# Copy your custom start script
COPY my_start.sh /dhp-open-webui/my_start.sh
RUN chmod +x /dhp-open-webui/my_start.sh

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/dhp-open-webui/my_start.sh"]
