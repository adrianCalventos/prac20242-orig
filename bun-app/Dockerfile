FROM oven/bun:latest
WORKDIR /app
COPY ../app /app
COPY server.py /app/server.py

RUN if [ -f package.json ]; then bun install; fi

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    python3 -m pip install --break-system-packages --no-cache-dir aiohttp asyncpg

EXPOSE 3000

CMD ["python3","/app/server.py"]