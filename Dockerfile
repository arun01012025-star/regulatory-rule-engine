FROM python:3.11-slim
WORKDIR /app
RUN pip install fastapi uvicorn sqlalchemy "python-jose[cryptography]" "passlib[bcrypt]" python-multipart pydantic-settings aiosqlite bcrypt
COPY main.py .
RUN python -c "from main import app; print('App loaded OK')"
EXPOSE 8000
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}"]
