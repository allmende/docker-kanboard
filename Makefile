image:
	@ docker build -t kanboard/kanboard:stable -f Dockerfile.alpine .

centos6-dev:
	@ docker build -t kanboard/kanboard:centos6-dev -f Dockerfile.centos6 .

centos7-dev:
	@ docker build -t kanboard/kanboard:centos7-dev -f Dockerfile.centos7 .

precise-dev:
	@ docker build -t kanboard/kanboard:precise-dev -f Dockerfile.precise .

trusty-dev:
	@ docker build -t kanboard/kanboard:trusty-dev -f Dockerfile.trusty .

xenial-dev:
	@ docker build -t kanboard/kanboard:xenial-dev -f Dockerfile.xenial .

xenial-postgres-beanstalk-dev:
	@ docker build -t kanboard/kanboard:xenial-postgres-beanstalk-dev -f Dockerfile-postgres-beanstalk.xenial .

alpine-postgres-beanstalk-dev:
	@ docker build -t kanboard/kanboard:alpine-postgres-beanstalk-dev -f Dockerfile-postgres-beanstalk.alpine .

push:
	@ docker push kanboard/kanboard

run:
	@ docker run -d --name kanboard -p 80:80 -t kanboard/kanboard:stable

destroy:
	@ docker rmi kanboard/kanboard:stable \
		kanboard/kanboard:latest \
		kanboard/kanboard:centos6-dev \
		kanboard/kanboard:centos7-dev \
		kanboard/kanboard:precise-dev \
		kanboard/kanboard:trusty-dev \
		kanboard/kanboard:xenial-dev
all:
	destroy image centos6-dev centos7-dev precise-dev trusty-dev xenial-dev push
