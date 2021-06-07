.DEFAULT_GOAL := help

.PHONY: build
build: ## Build the service Docker images
	docker-compose build

.PHONY: shell.consumer
shell.consumer:
	docker-compose run consumer bash

.PHONY: shell.provider
shell.provider:
	docker-compose run provider bash

.PHONY: generate-consumer-pacts
generate-consumer-pacts: ## Generate consumer pacts
	echo "Hi"

.PHONY: verify-provider-pacts
verify-provider-pacts: ## Verify the generated consumer pacts by running them against the provider
	echo "Hi"

.PHONY: help
help: ## View help
	@echo Available targets:
	@awk -F ':|##' '/^[^\t].+?:.*?##/ {\
		printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
		}' $(MAKEFILE_LIST)
