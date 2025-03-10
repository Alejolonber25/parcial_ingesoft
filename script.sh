if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

echo $PORT

if ! command -v docker
then
    echo "Docker not installed"
    exit 1
fi

echo "Docker Installed"

IMAGE_NAME="nodei"
CONTAINER_NAME="nodec"

docker build -t $IMAGE_NAME .

docker run -d -p $PORT `:8080 --name $CONTAINER_NAME --env-file .env $IMAGE_NAME

echo "App in http://localhost:$PORT"
