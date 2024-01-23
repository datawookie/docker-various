export NAME=jupyter

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  [The default login credentials are jupyter for both Username and Password.]"
	@echo "  build			to build a docker container and configure jupyter local volume"
	@echo "  run 			to run pre-built jupyter container"
	@echo "  start  		to start an existing jupyter container"
	@echo "  stop   		to stop an existing jupyter container"
	@echo "  clean      		to stop and delete jupyter container"
	@echo "  log      		to see the logs of a running container"
	@echo "  shell      		to execute a shell on jupyter container"

build:
	@docker build -t jupyterhub:latest .
run:
	@docker run --name ${NAME} -v ${PWD}:/home/${NAME} -d -p 8000:8000 "datawookie/${NAME}hub"

start:
	@docker start ${NAME}

stop:
	@docker stop ${NAME} || true

clean: stop
	@docker rm -v ${NAME}|| true

log:
	@docker logs -f ${NAME}

shell:
	@docker exec -it ${NAME} /bin/bash
