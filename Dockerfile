FROM python:3.8-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev

# Install pip packages
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy app files
COPY . /app
WORKDIR /app

# Run the app
CMD ["streamlit", "run", "app.py"]
