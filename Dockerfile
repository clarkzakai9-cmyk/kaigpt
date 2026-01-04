FROM ollama/ollama:latest

COPY Modelfile /Modelfile

EXPOSE 11434

# Override the default entrypoint so we can run shell commands
ENTRYPOINT ["/bin/sh", "-c"]

CMD "ollama serve & sleep 3 && ollama pull phi3:mini && ollama create airoater -f /Modelfile && tail -f /dev/null"
