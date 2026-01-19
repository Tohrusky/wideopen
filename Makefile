.DEFAULT_GOAL := default

.PHONY: lint
lint:
	pre-commit install
	pre-commit run --all-files
