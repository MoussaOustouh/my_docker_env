#https://www.jenkins.io/doc/book/installing/docker/

FROM jenkins/jenkins:2.426.2-jdk17
USER root

# Install lsb-release
RUN apt-get update && apt-get install -y lsb-release && apt clean  \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg

RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Install docker-ce-cli
RUN apt-get update && apt-get install -y docker-ce-cli && apt clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

USER jenkins

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"