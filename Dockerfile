FROM ollama/ollama:latest

COPY Modelfile /Modelfile

RUN ollama pull phi3:mini && \
    ollama create airoater -f /Modelfile

EXPOSE 11434

CMD ["sh", "-c", "ollama serve"]
