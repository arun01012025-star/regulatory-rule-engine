FROM python:3.11-slim
WORKDIR /app
COPY . .
RUN pip install fastapi uvicorn sqlalchemy "python-jose[cryptography]" "passlib[bcrypt]" python-multipart pydantic-settings aiosqlite bcrypt
EXPOSE 8000
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}"]
