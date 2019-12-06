docker run --rm --name docker-ansible -it \
-v $(pwd):/ansible/playbooks  \
-v ~/.ssh/:/root/.ssh/  \
-v ~/.ssh/id_rsa:/root/.ssh/id_rsa  \
 docker-ansible-intermediate:latest -i hosts docker.yml
