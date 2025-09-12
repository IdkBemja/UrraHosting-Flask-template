## Use official Python base image
FROM python:3.11-slim

## Set working directory
WORKDIR /app

## Install curl
RUN apt-get update && apt-get install -y curl

## Copy dependency files
COPY requirements.txt ./

## Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

## Copy the rest of the application
COPY . .

## Expose default Flask port
EXPOSE 5000

## Command to run the app
CMD ["python", "main.py"]
