FROM ollama/ollama:latest

COPY Modelfile /Modelfile

EXPOSE 11434

# Force shell as entrypoint
ENTRYPOINT ["/bin/sh"]

# Run everything inside a single shell script
CMD ["sh", "-c", "ollama serve"]


