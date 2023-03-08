#!/bin/bash
# services flags: 
# -m = mongo
# -r = redis
# -p = postgres and pgadmin
# -d = down flag to stop all services
# if no flags are passed, all services will be started

services=""
closing=false

down() {
  docker compose down
  docker ps
}

up() {
  docker compose up -d $services
  docker ps
}

up_all() {
  docker compose up -d
  docker ps
}

while getopts "mrpd" flag
do
  case "${flag}" in
    m) 
      services="mongo"
      ;;
    r) 
      services="${services} redis"
      ;;
    p) 
      services="${services} postgres pgadmin"
      ;;
    d) 
      closing=true 
      down
      ;;
  esac
done

if [ $OPTIND -eq 1 ]; 
then 
echo "Starting all services... "
up_all;
elif [ "$closing" == false ]; 
then 
echo "Starting services... $services"
up;
else 
echo 
"Shutting down services... $services"
down;
fi
