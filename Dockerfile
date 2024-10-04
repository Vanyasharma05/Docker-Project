# Define the Python version as an argument
ARG PYTHON_VERSION=3.9

# Use the defined Python version in the base image
FROM python:${PYTHON_VERSION}-slim as base

# Prevent Python from writing pyc files
ENV PYTHONDONTWRITEBYTECODE=1

# Prevent Python from buffering stdout/stderr
ENV PYTHONUNBUFFERED=1

# Copy the application code to the container
COPY . /app

# Set the working directory
WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the app
CMD ["python", "app.py"]
