DOCKER := $(shell which docker)

.PHONY: build
build: ver=tip
build: ## Build a specific version of the tools
	${DOCKER} build -t graze/golang-tools:${ver} -f Dockerfile.${ver} .
ifeq (${ver},tip)
	${DOCKER} build -t graze/golang-tools:latest -f Dockerfile.tip .
endif

.DEFAULT: all
.PHONY: all
all: ## Build all the versions of the tools
	make build ver=tip
	make build ver=1.7
	make build ver=1.6

# Build targets
.SILENT: help
.PHONY: help
help: ## Show this help message
	set -x
	echo "Usage: make [target] ..."
	echo ""
	echo "Available targets:"
	egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#' | sort
