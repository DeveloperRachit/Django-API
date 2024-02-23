# Dockerfile
FROM python:3.9
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /api

COPY requirements.txt ./
# Install core dependencies.
RUN apt-get update && apt-get install -y libpq-dev build-essential


RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
