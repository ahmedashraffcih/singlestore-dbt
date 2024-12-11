# Use an official Python image as the base image
FROM python:3.9-slim

# Install necessary tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install dbt and SingleStore adapter using pip
RUN pip install dbt-core dbt-mysql dbt-singlestore

# Set working directory
WORKDIR /usr/app/dbt_project
