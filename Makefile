all: help

help: ## Show this help text.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-32s\033[0m %s\n", $$1, $$2}'

build: build-containers install ## Build the project for first time

clean: down ## DANGER! Deletes all files and directories in app folder
	rm -rf ./app/.* ./app/*

build-containers:
	docker-compose build

composer-install: ## Executes composer install from application container
	docker-compose run application composer install

composer-require: ## Executes composer require from application container
	docker-compose run application composer require

composer-require-dev: ## Executes composer require --dev from application container
	docker-compose run application composer require --dev

composer-update: ## Executes composer update from application container
	docker-compose run application composer update

install: ./app/vendor/autoload.php

./app/vendor/autoload.php:
	docker-compose run --rm application composer create-project symfony/website-skeleton /app

up: install ## Starts project using docker-compose up -d
	docker-compose up -d

logs: ## Display logs from containers
	docker-compose logs -f || echo "Closing logs"

down: ## Ends project using docker-compose down
	docker-compose down