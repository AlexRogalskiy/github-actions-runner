FROM ubuntu:18.04
RUN useradd -ms /bin/bash actions-runner
WORKDIR /home/actions-runner
RUN apt update && apt install -y curl
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && apt install -y git git-lfs make
RUN curl -O https://githubassets.azureedge.net/runners/2.160.0/actions-runner-linux-x64-2.160.0.tar.gz && tar xzf ./actions-runner-linux-x64-2.160.0.tar.gz && rm ./actions-runner-linux-x64-2.160.0.tar.gz && ./bin/installdependencies.sh
COPY start.sh ./start.sh
RUN chmod +x ./start.sh
RUN chown -R actions-runner:actions-runner ./
USER actions-runner
CMD ./start.sh 
