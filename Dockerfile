FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    build-essential \
    ffmpeg \
    git \
    git-lfs \
    libgl1-mesa-dev \
    libglib2.0-dev \
    libpython3-dev \
    linux-headers-generic \
    python3 \
    python3-evdev \
    python3-venv \
    sudo

RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER ubuntu

RUN python3 -m venv /home/ubuntu/venv

RUN /home/ubuntu/venv/bin/pip install poetry setuptools
COPY requirements.txt /home/ubuntu/lerobot/
RUN /home/ubuntu/venv/bin/pip install -r /home/ubuntu/lerobot/requirements.txt --no-build-isolation

WORKDIR /home/ubuntu/lerobot
