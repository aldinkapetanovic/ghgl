"""API routes."""
from flask import Blueprint, jsonify, request

api_bp = Blueprint('api', __name__)


@api_bp.route('/version', methods=['GET'])
def get_version():
    """Get API version."""
    return jsonify({
        'version': '1.0.0',
        'api': 'GHGL API'
    }), 200


@api_bp.route('/info', methods=['GET'])
def get_info():
    """Get API information."""
    return jsonify({
        'name': 'GHGL Flask API',
        'description': 'Production-ready Flask microservice',
        'environment': 'development'
    }), 200


@api_bp.route('/echo', methods=['POST'])
def echo():
    """Echo endpoint for testing."""
    data = request.get_json() or {}
    return jsonify({
        'echo': data,
        'received_at': str(__import__('datetime').datetime.utcnow())
    }), 200
