# ecswithdockerecsmetadata

docker build -t thecheggtest:dev /home/ec2-user/thecheggtest
docker stop thecheggtest && docker rm thecheggtest && docker run -v /var/lib/docker/containers:/var/lib/docker/containers -v /tmp:/tmp -v /var/run/docker.sock:/var/run/docker.sock -e "LOGZ_IO_URL_1=https://listener.logz.io:8071?token=GeBOSiBWXWgsRPlyGNHpYiQEXRAOXwOg" -d --net="host" --name=thecheggtest thecheggtest:dev

