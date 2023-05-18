FROM ubuntu:23.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y  \
      git  \
      curl  \
      wget  \
      build-essential \
      pkg-config \
      libssh-dev \
      cmake \
      ffmpeg

RUN curl https://sh.rustup.rs -sSf -o cargo.sh && \
    bash ./cargo.sh -y && \
    rm cargo.sh

RUN git clone https://github.com/crunchy-labs/crunchy-cli

RUN cd crunchy-cli && \
    /root/.cargo/bin/cargo build --release && \
    /root/.cargo/bin/cargo install --force --path .

ADD ./crunchy-cli.sh /crunchy-cli.sh
RUN chmod +x /crunchy-cli.sh