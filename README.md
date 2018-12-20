# Work in progress
This Docker image contains a number of DevOps tools such as Maven, JDK 1.8, Ansible, Terraform, etc

Run this command to build the image locally:
- `docker image build --no-cache --tag shazchaudhry/docker-centos:latest --build-arg GIT_COMMIT=$(git log -1 --format=%H) .`

Once the image has been build using the above command then run this command below to find git commit:
- `docker inspect shazchaudhry/docker-centos:latest | jq '.[].ContainerConfig.Labels'`
