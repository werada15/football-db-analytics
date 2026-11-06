FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY 3_dashboard ./3_dashboard

EXPOSE 8050

CMD ["python", "3_dashboard/dashboard.py"]