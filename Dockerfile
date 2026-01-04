# Use a lightweight base image
FROM debian:bookworm-slim

# Install Ollama
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    curl -fsSL https://ollama.com/install.sh | sh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Optional: create model directory (if using volumes)
RUN mkdir -p /models

# Expose Ollama port
EXPOSE 11434

# Start Ollama server only — no model loading
CMD ["sh", "-c", "ollama serve"]
