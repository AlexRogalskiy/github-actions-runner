FROM ubuntu:18.04
RUN useradd -ms /bin/bash actions-runner
WORKDIR /home/actions-runner
RUN apt update && apt install -y curl vim iputils-ping
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && apt install -y git git-lfs make
ARG RUNNER_VERSION=2.161.0
RUN curl -O https://githubassets.azureedge.net/runners/$RUNNER_VERSION/actions-runner-linux-x64-$RUNNER_VERSION.tar.gz && tar xzf ./actions-runner-linux-x64-$RUNNER_VERSION.tar.gz && rm ./actions-runner-linux-x64-$RUNNER_VERSION.tar.gz && ./bin/installdependencies.sh
COPY start.sh ./start.sh
RUN chmod +x ./start.sh
RUN chown -R actions-runner:actions-runner ./
USER actions-runner
CMD ./start.sh 
