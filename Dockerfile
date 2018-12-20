FROM centos:latest

LABEL Author="Shahzad Chaudhry"
LABEL LinkedIn="https://www.linkedin.com/in/shahzad-chaudhry/"

# Run this command to build the image locally:
## docker image build --no-cache --tag shazchaudhry/docker-centos:latest --build-arg GIT_COMMIT=$(git log -1 --format=%H) .
# Once the image has been build using the above command then run this command below to find git commit:
## docker inspect shazchaudhry/docker-centos:latest | jq '.[].ContainerConfig.Labels'
ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT

RUN  yum update --nogpgcheck --assumeyes && \
yum install --nogpgcheck --assumeyes \
epel-release \
which \
wget \
unzip \
git \
java-1.8.0-openjdk-devel \
ansible

# Install Terraform
ENV TERRAFORM_VERSION=0.11.11
RUN mkdir -p /opt/terraform-${TERRAFORM_VERSION} && \
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /opt/terraform-${TERRAFORM_VERSION} && \
rm -f terraform*

# Install Maven
ENV MAVEN_VERSION=3.6.0
RUN wget https://www-us.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -P /tmp && \
tar xf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt && \
rm -rf /tmp/apache-maven*

ENV PATH=/opt/terraform-${TERRAFORM_VERSION}:/opt/apache-maven-${MAVEN_VERSION}/bin:$PATH
