This CentOS 7 based Docker image contains a number of DevOps tools such as Maven, JDK 1.8, Ansible, Terraform, etc. The purpose of this image is to use it in a Jenkins' declarative pipeline as an agent. This means the host running Jenkins does not require installing the DevOps tools mentioned previously.

As an example on how this image is used in a Jenkins based CI / CD pipeline, see this DevOps repo: [https://github.com/shazChaudhry/docker-devops](https://github.com/shazChaudhry/docker-devops/blob/master/Jenkinsfile)

NOTE:
> This image has been tested on Windows 10 pro machine and in a VirtualBox only. It is assumed you already have installed VirtualBox, Vagrant and Git Bash on your machine.

1. Start a Git Bash shell and change to a suitable directory _(e.g. $HOME/github)_
1. Clone this repo: `git clone https://github.com/shazChaudhry/docker-centos.git` and change the directory _(e.g. $HOME/github/docker-centos)_
1. Run this command to build the image locally: `docker image build --no-cache --tag shazchaudhry/docker-centos:latest --build-arg GIT_COMMIT=$(git log -1 --format=%H) .`
1. List the images to ensure our image has been built: `docker image ls`
1. Run this command to find the git commit from which this image is built: `docker inspect shazchaudhry/docker-centos:latest | jq '.[].ContainerConfig.Labels'`
