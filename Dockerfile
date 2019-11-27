FROM ubuntu:18.04
RUN useradd -ms /bin/bash actions-runner
WORKDIR /home/actions-runner
RUN apt update && apt install -y curl vim iputils-ping
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && apt install -y git git-lfs make
ARG RUNNER_VERSION=2.161.0
RUN mkdir temp
WORKDIR /home/actions-runner/temp
RUN curl -O https://githubassets.azureedge.net/runners/$RUNNER_VERSION/actions-runner-linux-x64-$RUNNER_VERSION.tar.gz && tar xzf ./actions-runner-linux-x64-$RUNNER_VERSION.tar.gz && rm ./actions-runner-linux-x64-$RUNNER_VERSION.tar.gz && ./bin/installdependencies.sh
RUN chown -R actions-runner:actions-runner /home/actions-runner/temp
COPY start.sh /home/actions-runner/start.sh
RUN chmod +x /home/actions-runner/start.sh
USER actions-runner
WORKDIR /home/actions-runner
CMD ./start.sh 
