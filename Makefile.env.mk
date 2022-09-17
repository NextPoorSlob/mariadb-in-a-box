# Global variables
CONTAINER_PREFIX?=mariadb-in-a-box

# Postgres-related variables.
DB_VOLUME?=mariadb-data
DB_EXPOSED_PORT?=3306
DB_USERNAME?=root
DB_PASSWORD?=mypass
DB_DB_NAME?=mariadb

# Declare the environmental variables
ENV_VARS := CONTAINER_PREFIX=$(CONTAINER_PREFIX) \
			DB_VOLUME=$(DB_VOLUME) \
			DB_EXPOSED_PORT=$(DB_EXPOSED_PORT) \
            DB_USERNAME=$(DB_USERNAME) \
            DB_PASSWORD=$(DB_PASSWORD) \
            DB_DB_NAME=$(DB_DB_NAME)

