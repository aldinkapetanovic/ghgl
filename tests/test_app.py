"""Test cases for the Flask application."""
import pytest
from app import create_app


@pytest.fixture
def app():
    """Create and configure a test app."""
    app = create_app('testing')
    return app


@pytest.fixture
def client(app):
    """A test client for the app."""
    return app.test_client()


def test_index(client):
    """Test index endpoint."""
    response = client.get('/')
    assert response.status_code == 200
    assert 'message' in response.json


def test_health(client):
    """Test health check endpoint."""
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json['status'] == 'healthy'


def test_api_version(client):
    """Test API version endpoint."""
    response = client.get('/api/version')
    assert response.status_code == 200
    assert 'version' in response.json


def test_api_info(client):
    """Test API info endpoint."""
    response = client.get('/api/info')
    assert response.status_code == 200
    assert response.json['name'] == 'GHGL Flask API'


def test_echo(client):
    """Test echo endpoint."""
    test_data = {'message': 'Hello World'}
    response = client.post('/api/echo', json=test_data)
    assert response.status_code == 200
    assert response.json['echo'] == test_data
