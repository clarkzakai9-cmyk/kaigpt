FROM ollama/ollama:latest

COPY Modelfile /Modelfile

EXPOSE 11434

# Force shell as entrypoint
ENTRYPOINT ["/bin/sh"]

# Run everything inside a single shell script
CMD ["-c", "\
  ollama serve & \
  sleep 4 && \
  ollama pull qwen2.5:1.5b && \
  ollama create airoater -f /Modelfile && \
  tail -f /dev/null \
"]
