FROM golang:1.19

ARG STARGAZE_RELEASE=v8.0.0

ENV TZ=America/Detroit
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      make \
      build-essential \
      curl \
      gcc \
      git \
      jq \
      chrony

RUN git clone -b ${STARGAZE_RELEASE} https://github.com/public-awesome/stargaze

RUN cd stargaze \
    && make install

RUN useradd -m stargaze
USER stargaze
WORKDIR /home/stargaze

COPY state-sync.sh .
ENV CHAIN_ID="stargaze-1"
ENV MONIKER_NAME="Validatron 9001"

CMD ["starsd", "start"]

