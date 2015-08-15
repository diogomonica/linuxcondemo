#! /bin/sh

#docker build --rm --force-rm -t diogomonica/notarytest .
#docker push diogomonica/notarytest
#docker build --rm --force-rm -t registry:5000/demo -f Dockerfile.alpine .
#docker build --rm --force-rm -t registry:5000/demo_malicious -f Dockerfile_malicious.alpine .
#docker push registry:5000/demo_malicious
#docker push registry:5000/demo
docker build --rm --force-rm -t registry:5000/dolly -f Dockerfile.nginx .
docker push registry:5000/dolly
docker build --rm --force-rm -t registry:5000/dolly_malicious -f Dockerfile_malicious.nginx .
docker push registry:5000/dolly_malicious
#docker images | grep demo | awk '{print $3}' | xargs docker rmi -f
docker images | grep dolly | awk '{print $3}' | xargs docker rmi -f
docker run -it -v /var/run/docker.sock:/var/run/docker.sock --link notary_notaryserver_1:notaryserver --link registry:registry diogomonica/notarytest
