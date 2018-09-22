# Could go with Alpine here as well, but that requires more preparation.
#
FROM ubuntu:16.04

RUN \
	apt-get update && \
	apt-get install -y git cmake build-essential jq \
		liblua5.2-dev libboost-all-dev libprotobuf-dev libtbb-dev libstxxl-dev libbz2-dev

RUN \
	git clone --branch v5.12.0 https://github.com/Project-OSRM/osrm-backend.git /osrm-backend && \
	cd /osrm-backend && \
	mkdir build && \
	cd build/ && \
	echo "disk=/tmp/stxxl,50000,syscall" > .stxxl && \
	cmake .. && \
	make && \
	make install

RUN \
	mkdir /data

WORKDIR /osrm-backend
ADD start.sh start.sh

ENTRYPOINT ["/osrm-backend/start.sh"]
EXPOSE 5000
