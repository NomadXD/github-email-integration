# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Create a Python script that prints "Hello, World!"
RUN echo "print('Hello, World!')" > hello.py

# Define the command to run when the container starts
CMD ["python", "hello.py"]
