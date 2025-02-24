FROM python:3-slim

EXPOSE 8090

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY . /app
# read this line 
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser
ARG GIT_COMMIT_HASH=unknown
LABEL git_commit_hash="${GIT_COMMIT_HASH}"
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8090"]

