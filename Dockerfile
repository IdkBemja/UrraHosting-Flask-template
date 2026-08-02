FROM python:3.12-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# APP_PORT is injected by the platform at container start and is the ONLY
# port that will ever receive traffic; it changes per instance, so the app
# must bind to it at runtime (shell form CMD expands $APP_PORT). Do not
# hardcode a port.
USER 10001:10001
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:$PORT app:app"]
