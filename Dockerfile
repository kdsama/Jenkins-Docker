FROM jenkins/jenkins

# Docker install
USER root
RUN apt-get update && apt-get install -y \
       apt-transport-https \
       ca-certificates \
       curl \
       wget \
       gnupg2 \
       software-properties-common \
       libgtk2.0-0 \
       libgtk-3-0 \
       libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb




RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"

RUN apt-get update && apt-get install python3-pip -y && \
    pip3 install ansible --upgrade &&\
    apt-get upgrade -y && apt-get update

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

RUN apt-get install -y fonts-liberation xdg-utils
RUN dpkg -i google-chrome-stable_current_amd64.deb

RUN curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
&& chmod +x /usr/local/bin/docker-compose

RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins
