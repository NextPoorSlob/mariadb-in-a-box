include ./Makefile.env.mk

up:
	@$(ENV_VARS) docker-compose up --remove-orphans -d

down:
	@$(ENV_VARS) docker-compose down

stop:
	@$(ENV_VARS) docker-compose stop

clear:
	docker volume rm "${CONTAINER_PREFIX}_${DB_VOLUME}"

reset: down clear

.PHONY: up \
	down \
	stop \
	clear \
	reset
