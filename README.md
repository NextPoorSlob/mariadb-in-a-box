# MariaDB In A Box

## Description
This project is simply a MariaDB database that runs in a Docker container.  While it can be used as a stand-alone
database for testing projects locally, it can also be added to a Docker Compose file to run as part of a project.

## To Use
There are three ways to run the database.
- [Docker](#docker)
- [Docker Compose](#docker-compose)
- [GNU Make](#gnu-make)

### Docker
This is a standard Docker build file.  It does create a default administrator account (username: root).  There is no
need to create a Dockerfile since the company provides pre-build images.

With persistent data:
```shell
docker run --name mariadb \
    -e MYSQL_ROOT_PASSWORD=mypass \
    -v /persistence/mariadb:/var/lib/mysql/data \
    -p 3306:3306 \
    -d docker.io/library/mariadb:latest
```


Without persistent data:
```shell
docker run --name mariadb \
    -e MYSQL_ROOT_PASSWORD=mypass \
    -p 3306:3306 \
    -d docker.io/library/mariadb:latest
```

However, using this with persistent data is made a little difficult with figuring out how to drop the database volume.
You have to delete all the volumes with ```docker volume prune```.
### Docker Compose

The vanilla docker-compose.yml file works with Docker Compose.  Because the file specifies a volume, any data written 
to the database is persistent.

To Start:
```shell
docker-compose up
```

To Stop:
```shell
docker-compose down
```

To reset the data by dropping the volume:
```shell
docker volume rm "postgresql-in-a-box_postgres-data"
```
Note that this is a _docker_ command, not a _docker-compose_ command!

### GNU Make

Uses the GNU Make utility to control the Docker containers.  Note that this only works on Windows machines with a WSL2
environment installed.

**Commands**

Syntax: **make _command_**

| Command | Action                                                      |
|---------|-------------------------------------------------------------|
| up      | Run the Docker Compose file.                                |
| stop    | Stop the running containers, leaving the containers intact. |
| down    | Stop and destroy the containers, etc.                       |
| clear   | Remove the volume containing the database.                  |
| reset   | Stop and destroy the containers and the database volume.    |

These command names are not magical.  You can change them in the Makefile.