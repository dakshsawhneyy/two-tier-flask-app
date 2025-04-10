FROM python:3.9-slim

WORKDIR /app

# Install system deps for mysqlclient
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    gcc \
    python3-dev \
    pkg-config \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install mysqlclient
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
