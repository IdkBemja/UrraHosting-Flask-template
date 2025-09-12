# Python Flask on urrahost.app / urrahost.cl

This template helps you deploy a Python Flask application using Docker and environment variables managed by `.env`. The port and other settings are configured via `.env`, making it easy to adapt for urrahost.app or urrahost.cl.

## Project Structure
```
main.py
requirements.txt
.env
Dockerfile
app/
  utils/config/env_config.py
  ...
```

## 1. Environment Configuration
Create a `.env` file in the project root:
```env
PORT=5000
```
You can change the port as needed. The app will read this value automatically.

## 2. Dockerfile Example
Your Dockerfile should look like this (remove the EXPOSE line if urrahost manages ports):
```Dockerfile
FROM python:3.11-slim
WORKDIR /app
RUN apt-get update && apt-get install -y curl
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "main.py"]
```

## 3. requirements.txt
Make sure to include `python-dotenv` and `flask`:
```
flask
python-dotenv
```

## 4. Notes for urrahost.app / urrahost.cl
- The port is managed via `.env` and not hardcoded in Dockerfile.
- You can add other environment variables to `.env` as needed.
- Make sure your app listens on `0.0.0.0` for compatibility with Docker and hosting platforms.

## 5. Example main.py
```python
from app import app
from app.controllers import app_controller
from app.utils.config.env_config import get_port

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=get_port())
```

---

Feel free to adapt this template for your deployment on urrahost.app or urrahost.cl.
