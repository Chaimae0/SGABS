# SGABS
#build an image from docker file
docker build -t easy:1.0 .
#build container 
 docker-compose up -d
#build an image from the container 
docker commit containerid 
#pull this image into dockerhub
docker tag image:tagname username/image:tagname
docker push username/image:tagname
