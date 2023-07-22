FROM ubuntu

RUN apt update && apt install -y curl sudo build-essential git

ARG USER=user

RUN useradd -m ${USER} && echo "${USER}:${USER}" | chpasswd && adduser ${USER} sudo
USER ${USER}

WORKDIR /home/${USER}

CMD tail -f /dev/null
