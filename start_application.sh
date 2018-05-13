
echo "*************Docker running in $1 mode******************"

# Replace with your app cloned path
APPLICATION_PATH=/home/gklsan/workspace/practice
APP_NAME=hospital_management_frontend
APP_ENV=$1
RUN_TYPE=$2
FRONT_END=172.17.0.3:8000

#Stop the docker 
docker stop $APP_NAME

#Remove the docker 
docker rm $APP_NAME

#Build the docker 
docker build -t $APP_NAME -f docker/Dockerfile .

#Run the docker 
docker run -it -p 5000:5000 --rm -e RAILS_ENV=$APP_ENV -e FRONT_END=$FRONT_END -e RACK_ENV=$APP_ENV -e RUN_TYPE=$RUN_TYPE --volume=$APPLICATION_PATH/$APP_NAME:/opt/$APP_NAME/ --volume=$APPLICATION_PATH/hospital_management_frontend_gems:/usr/local/bundle/ --name $APP_NAME $APP_NAME

echo "*************Docker End******************"