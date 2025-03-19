FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    build-essential \
    ffmpeg \
    git \
    libgl1-mesa-dev \
    libglib2.0-dev \
    libpython3-dev \
    linux-headers-generic \
    python3 \
    python3-evdev \
    python3-venv \
    sudo

ARG UID=1000
ARG GID=1000

RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN groupadd -g $GID lerobotd && \
    useradd -m -u $UID -g $GID lerobotd

USER lerobotd

RUN python3 -m venv /home/lerobotd/venv

RUN /home/lerobotd/venv/bin/pip install poetry setuptools
COPY requirements.txt /home/lerobotd/lerobot/
RUN /home/lerobotd/venv/bin/pip install -r /home/lerobotd/lerobot/requirements.txt --no-build-isolation

WORKDIR /home/lerobotd/lerobot
