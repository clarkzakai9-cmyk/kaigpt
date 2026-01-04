FROM ollama/ollama:latest

COPY Modelfile /Modelfile

EXPOSE 11434

CMD ["sh", "-c", "ollama serve & sleep 3 && ollama pull qwen2.5:1.5b && ollama create airoater -f /Modelfile && tail -f /dev/null"]
