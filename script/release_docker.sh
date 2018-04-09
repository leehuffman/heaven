set -ex

USERNAME=rsanheim
IMAGE=heaven

version=`git rev-parse HEAD`
echo "Tagging as $version"

# run build
./script/build_docker.sh

docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version

# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version
