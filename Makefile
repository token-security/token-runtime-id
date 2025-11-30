.PHONY: setup lint tests pyright validate clean help

help:
	@echo "Available commands:"
	@echo "  make setup     - Install dependencies"
	@echo "  make lint      - Run pylint"
	@echo "  make tests     - Run pytest with coverage"
	@echo "  make pyright   - Run pyright type checker"
	@echo "  make validate  - Run lint, tests, and pyright"

setup:
	uv sync --all-extras --dev

lint:
	pylint src/ tests/

tests:
	pytest --cov=token_runtime_id --cov-report=term-missing --cov-report=html --cov-fail-under=100

pyright:
	pyright

validate: lint pyright tests
	@echo "All validation checks passed!"
