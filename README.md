# GHGL - Production-Ready Flask API

[![Tests](https://github.com/your-username/ghgl/actions/workflows/test.yml/badge.svg)](https://github.com/your-username/ghgl/actions/workflows/test.yml)
[![Docker Build](https://github.com/your-username/ghgl/actions/workflows/docker-build.yml/badge.svg)](https://github.com/your-username/ghgl/actions/workflows/docker-build.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A production-ready Flask microservice with comprehensive DevOps tooling, Kubernetes support, and modern development practices.

## 🎯 Features

- **Flask REST API** with health checks and configurable endpoints
- **Docker** containerization with security best practices
- **Kubernetes** manifests with HPA, network policies, and RBAC
- **Helm Chart** for easy Kubernetes deployments
- **CI/CD Pipelines** for both GitHub Actions and GitLab CI
- **Comprehensive Testing** with pytest and coverage reporting
- **Code Quality** tools: Black, isort, flake8, mypy
- **Pre-commit Hooks** for automated code validation
- **Development Environment** with VS Code configuration
- **Docker Compose** for local development

## 📋 Requirements

- Python 3.11+
- Docker & Docker Compose (for containerized development)
- Kubernetes 1.20+ (for K8s deployment)
- Helm 3+ (for Helm deployment)

## 🚀 Quick Start

### Local Development

1. **Clone the repository**

   ```bash
   git clone https://github.com/your-username/ghgl.git
   cd ghgl
   ```

2. **Set up virtual environment**

   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**

   ```bash
   pip install -r requirements.txt
   ```

4. **Copy environment file**

   ```bash
   cp .env.example .env
   ```

5. **Run the application**

   ```bash
   flask run
   ```

   The API will be available at `http://localhost:5000`

### Docker

Run the application using Docker Compose:

```bash
docker-compose up -d
```

Access at `http://localhost:5000`

## 📝 API Endpoints

- `GET /` - Welcome message
- `GET /health` - Health check
- `GET /api/version` - API version info
- `GET /api/info` - Application information
- `POST /api/echo` - Echo endpoint for testing

## 🧪 Testing

Run the test suite:

```bash
pytest
```

Run tests with coverage:

```bash
pytest --cov=app --cov-report=html
```

## 📦 Docker Build

Build the Docker image:

```bash
docker build -t ghgl:latest .
```

Run the container:

```bash
docker run -p 5000:5000 ghgl:latest
```

## ☸️ Kubernetes Deployment

### Using kubectl

Apply the base manifests:

```bash
kubectl apply -f kubernetes/
```

### Using Helm

Install the Helm chart:

```bash
helm install ghgl ./helm/ghgl -n ghgl --create-namespace
```

Upgrade existing release:

```bash
helm upgrade ghgl ./helm/ghgl -n ghgl
```

Uninstall:

```bash
helm uninstall ghgl -n ghgl
```

### Verify Deployment

```bash
kubectl get pods -n ghgl
kubectl port-forward -n ghgl svc/ghgl-service 5000:80
```

## 🔄 CI/CD Pipelines

### GitHub Actions

Two workflows are configured:

- **test.yml**: Runs tests, linting, and code quality checks
- **docker-build.yml**: Builds and pushes Docker images to Docker Hub and GitHub Container Registry

Required secrets:

- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`
- `GITHUB_TOKEN`

### GitLab CI

Configured in `.gitlab-ci.yml`:

- **test**: Python linting and tests
- **build**: Docker image build and push to GitLab Registry
- **push_github**: Optional push to GitHub Container Registry
- **tag_release**: Tag releases with version numbers

## � Repository Management

### Push to Multiple Remotes (GitHub & GitLab)

This repository is synced to both GitHub and GitLab. To automatically push to both platforms:

**Check current remotes:**

```bash
git remote -v
```

**Add GitHub as a push destination (if not already configured):**

```bash
git remote set-url --add --push origin git@github.com:username/ghgl.git
```

**Add GitLab as a push destination:**

```bash
git remote set-url --add --push origin git@gitlab.com:username/ghgl.git
```

**Verify both push URLs are configured:**

```bash
git config --get-all remote.origin.pushurl
```

**Now a single push command will push to both remotes:**

```bash
git push origin
```

This setup allows you to maintain both repositories in sync with a single push operation.

## �🛠️ Development Tools

### Code Formatting

```bash
black app tests
isort app tests
```

### Code Linting

```bash
flake8 app tests
```

### Pre-commit Hooks

Install pre-commit hooks:

```bash
pre-commit install
```

Run all checks:

```bash
pre-commit run --all-files
```

## 📚 Project Structure

```
ghgl/
├── app/                      # Application package
│   ├── __init__.py          # App factory
│   ├── config.py            # Configuration
│   └── routes.py            # API routes
├── kubernetes/              # K8s manifests
│   ├── deployment.yaml
│   ├── ingress.yaml
│   └── rbac.yaml
├── helm/ghgl/               # Helm chart
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
├── .github/workflows/       # GitHub Actions
├── .vscode/                 # VS Code settings
├── tests/                   # Test suite
├── .gitlab-ci.yml           # GitLab CI
├── Dockerfile               # Container definition
├── docker-compose.yml       # Local development
├── requirements.txt         # Python dependencies
└── README.md               # This file
```

## 🔐 Security

- Non-root user in Docker container
- Security headers in Helm chart
- Network policies for pod-to-pod communication
- RBAC configured for service accounts
- Health checks and readiness probes

## 📖 Environment Variables

See `.env.example` for all available options:

- `FLASK_ENV`: Environment (development/production)
- `FLASK_APP`: Application entry point
- `SECRET_KEY`: Flask secret key
- `LOG_LEVEL`: Logging level
- `CORS_ORIGINS`: Allowed CORS origins

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

Your Name - [@your-github](https://github.com/your-username)

## 🙋 Support

For support, open an issue in the repository or contact the maintainers.
