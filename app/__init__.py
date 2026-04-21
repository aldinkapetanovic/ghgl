"""Flask application factory."""
from flask import Flask
from flask_cors import CORS


def create_app(config_name='development'):
    """Create and configure the Flask application."""
    app = Flask(__name__)
    
    # Load configuration
    if config_name == 'production':
        from app.config import ProductionConfig
        app.config.from_object(ProductionConfig)
    elif config_name == 'testing':
        from app.config import TestingConfig
        app.config.from_object(TestingConfig)
    else:
        from app.config import DevelopmentConfig
        app.config.from_object(DevelopmentConfig)
    
    # Enable CORS
    CORS(app)
    
    # Register blueprints
    from app.routes import api_bp
    app.register_blueprint(api_bp, url_prefix='/api')
    
    # Register health check route
    @app.route('/health')
    def health():
        return {'status': 'healthy'}, 200
    
    @app.route('/')
    def index():
        return {'message': 'Welcome to GHGL Flask API'}, 200
    
    return app
