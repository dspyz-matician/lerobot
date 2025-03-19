docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t "${USER}_lerobot" $(dirname "$0")
docker run -dit --gpus all --name "${USER}_lerobot_container" -v "$(dirname "$0")":/home/lerobotd/lerobot "${USER}_lerobot" bash -l
