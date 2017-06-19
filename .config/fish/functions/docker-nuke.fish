function docker-nuke
  docker rm -vf (docker ps -a -q);
  docker volume rm (docker volume ls -qf dangling=true);
  docker rmi -f (docker images -q);
end
