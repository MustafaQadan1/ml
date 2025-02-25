FROM python:3-slim

EXPOSE 8001

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY . /app
# read this line 
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

ARG githash
LABEL "githash"=${githash}
LABEL   "version"="versionmustafa"
LABEL "mdata"="mdatamustafa"

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8001"]
