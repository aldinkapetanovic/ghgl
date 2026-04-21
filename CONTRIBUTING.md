# Contributing to GHGL

Thank you for your interest in contributing to GHGL! This document provides guidelines for contributing to the project.

## Code of Conduct

Please be respectful and constructive in all interactions.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/your-username/ghgl.git`
3. Create a virtual environment: `python -m venv venv`
4. Activate it: `source venv/bin/activate` (or `venv\Scripts\activate` on Windows)
5. Install dependencies: `pip install -r requirements.txt`
6. Create a feature branch: `git checkout -b feature/my-feature`

## Development Workflow

### Code Style

We use:
- **Black** for code formatting
- **isort** for import sorting
- **flake8** for linting

Run code quality checks:

```bash
make lint
make format
```

### Testing

Write tests for new features:

```bash
pytest tests/ -v --cov=app
```

All tests must pass before submitting a PR.

### Pre-commit Hooks

We use pre-commit hooks to ensure code quality:

```bash
pre-commit install
pre-commit run --all-files
```

## Submitting Changes

1. Commit with clear messages: `git commit -m "Add feature description"`
2. Push to your fork: `git push origin feature/my-feature`
3. Create a Pull Request with:
   - Clear description of changes
   - Reference to related issues
   - Test coverage information
   - Screenshots if UI changes

## Pull Request Guidelines

- Keep PRs focused on a single feature/fix
- Update README if needed
- Add/update tests for new functionality
- Ensure all CI checks pass
- Request review from maintainers

## Reporting Bugs

Use GitHub Issues and include:
- Python version and OS
- Steps to reproduce
- Expected vs actual behavior
- Error messages/logs

## Feature Requests

Describe the desired behavior and use case. We'll discuss feasibility together.

## Questions?

Feel free to open an issue for questions or discussions!
