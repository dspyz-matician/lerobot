docker build -t "${USER}_lerobot" $(dirname "$0")
docker run -dit --gpus all --name "${USER}_lerobot_container" -v "$(dirname "$0")":/home/ubuntu/lerobot "${USER}_lerobot" bash -l
