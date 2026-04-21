# Makefile for GHGL Flask Application

.PHONY: help install dev test lint format clean docker-build docker-run k8s-deploy helm-deploy

help:
	@echo "GHGL Flask Application - Available Commands"
	@echo "============================================"
	@echo "make install       - Install dependencies"
	@echo "make dev           - Run development server"
	@echo "make test          - Run tests"
	@echo "make test-cov      - Run tests with coverage"
	@echo "make lint          - Run linting checks"
	@echo "make format        - Format code"
	@echo "make format-check  - Check code formatting"
	@echo "make clean         - Clean up generated files"
	@echo "make docker-build  - Build Docker image"
	@echo "make docker-run    - Run Docker container"
	@echo "make docker-stop   - Stop Docker container"
	@echo "make compose-up    - Start with Docker Compose"
	@echo "make compose-down  - Stop Docker Compose"
	@echo "make k8s-deploy    - Deploy to Kubernetes"
	@echo "make helm-deploy   - Deploy with Helm"
	@echo "make help          - Show this help message"

install:
	pip install --upgrade pip setuptools wheel
	pip install -r requirements.txt

dev:
	flask run --host=0.0.0.0 --reload

test:
	pytest tests/ -v

test-cov:
	pytest tests/ -v --cov=app --cov-report=html --cov-report=term-missing

lint:
	black --check app tests
	isort --check-only app tests
	flake8 app tests

format:
	black app tests
	isort app tests

format-check:
	black --check app tests
	isort --check-only app tests

clean:
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -delete
	find . -type d -name '.pytest_cache' -delete
	find . -type d -name '.mypy_cache' -delete
	find . -type d -name 'htmlcov' -delete
	rm -f .coverage
	rm -rf build/ dist/ *.egg-info/

docker-build:
	docker build -t ghgl:latest .

docker-run:
	docker run -p 5000:5000 --env-file .env ghgl:latest

docker-stop:
	docker stop $$(docker ps -q --filter "ancestor=ghgl:latest")

compose-up:
	docker-compose up -d

compose-down:
	docker-compose down

k8s-deploy:
	kubectl apply -f kubernetes/

k8s-delete:
	kubectl delete -f kubernetes/

helm-deploy:
	helm install ghgl ./helm/ghgl -n ghgl --create-namespace

helm-upgrade:
	helm upgrade ghgl ./helm/ghgl -n ghgl

helm-delete:
	helm uninstall ghgl -n ghgl

pre-commit-install:
	pre-commit install

pre-commit-run:
	pre-commit run --all-files
