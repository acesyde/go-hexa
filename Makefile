.DEFAULT_GOAL := help

## Path
OUTPUT_DIR ?= $(abspath output/)

## TOOLS
GO ?= $(shell which go)
DOCKER ?= $(shell which docker)


#########################################
# Show this help.
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


#########################################
#@ Golang CLI
.PHONE: build
build: ## build
	rm -rf $(OUTPUT_DIR)
	$(GO) build -o $(OUTPUT_DIR)/app ./cmd/runner.go

#########################################
#@ Docker CLI
.PHONE: docker-build
docker-build: ## docker-build
	$(DOCKER) build -t hexaproject:latest .