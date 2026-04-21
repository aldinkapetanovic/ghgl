# API Documentation

## Overview

GHGL Flask API provides RESTful endpoints for application health checks and information retrieval.

## Base URL

```
http://localhost:5000
```

## Authentication

Currently no authentication required. Implement as needed.

## Response Format

All responses are JSON:

```json
{
  "status": "success",
  "data": {},
  "message": "Operation successful"
}
```

## Endpoints

### 1. Welcome

**Request**

```http
GET /
```

**Response**

```json
{
  "message": "Welcome to GHGL Flask API"
}
```

**Status Code**: 200

---

### 2. Health Check

**Request**

```http
GET /health
```

**Response**

```json
{
  "status": "healthy"
}
```

**Status Code**: 200

---

### 3. API Version

**Request**

```http
GET /api/version
```

**Response**

```json
{
  "version": "1.0.0",
  "api": "GHGL API"
}
```

**Status Code**: 200

---

### 4. API Info

**Request**

```http
GET /api/info
```

**Response**

```json
{
  "name": "GHGL Flask API",
  "description": "Production-ready Flask microservice",
  "environment": "development"
}
```

**Status Code**: 200

---

### 5. Echo

**Request**

```http
POST /api/echo
Content-Type: application/json

{
  "message": "Hello World"
}
```

**Response**

```json
{
  "echo": {
    "message": "Hello World"
  },
  "received_at": "2024-04-21T12:00:00.000000"
}
```

**Status Code**: 200

---

## Error Responses

### 404 Not Found

```json
{
  "error": "Endpoint not found"
}
```

### 500 Internal Server Error

```json
{
  "error": "Internal server error"
}
```

## Example Usage

### Using curl

```bash
# Health check
curl http://localhost:5000/health

# API version
curl http://localhost:5000/api/version

# Echo request
curl -X POST http://localhost:5000/api/echo \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello"}'
```

### Using Python

```python
import requests

# Health check
response = requests.get('http://localhost:5000/health')
print(response.json())

# Echo
response = requests.post('http://localhost:5000/api/echo', 
                        json={'message': 'Hello'})
print(response.json())
```

### Using JavaScript

```javascript
// Health check
fetch('http://localhost:5000/health')
  .then(r => r.json())
  .then(data => console.log(data));

// Echo
fetch('http://localhost:5000/api/echo', {
  method: 'POST',
  headers: {'Content-Type': 'application/json'},
  body: JSON.stringify({message: 'Hello'})
})
  .then(r => r.json())
  .then(data => console.log(data));
```

## Rate Limiting

Not currently implemented. Add as needed for production.

## CORS

CORS is enabled. Configure `CORS_ORIGINS` environment variable.

## Versioning

API versions follow semantic versioning: `MAJOR.MINOR.PATCH`

Current version: 1.0.0

## Changelog

### 1.0.0 (Initial Release)

- Basic health check endpoint
- Welcome endpoint
- API info endpoint
- Echo endpoint for testing
