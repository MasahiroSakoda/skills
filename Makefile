.DEFAULT_GOAL := help
.PHONY: help docs

help:
	@echo "make docs		Generate Documentation from skills"

docs:
	./scripts/docs.sh
