FROM debian:bookworm-slim

# Install Ollama
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    curl -fsSL https://ollama.com/install.sh | sh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Railway exposes $PORT, but Ollama uses 11434
EXPOSE 11434

# Start Ollama, wait, then pull phi-2
CMD ["sh", "-c", "ollama serve & sleep 5 && ollama pull phi:2"]
