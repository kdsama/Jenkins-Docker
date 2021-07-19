run: down up

build:
        docker build -t jenkins-docker .
up:
        docker run -d --group-add $$(stat -c '%g' /var/run/docker.sock) \
        -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 -p 50000:50000 \
        -v `pwd`/jenkins:/var/jenkins_home --log-opt max-size=50k   --log-opt max-file=5   --name jenkins -P jenkins-docker
down:
        docker stop jenkins
        docker rm jenkins
