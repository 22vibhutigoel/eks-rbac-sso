FROM amazonlinux:latest

# update  
RUN dnf -y update 
# Install OpenJDK11, docker, aws-cli
RUN dnf -y install java-11-amazon-corretto-devel  
RUN yum install -y      aws-cli \
    wget  \
    tar \
    gzip \
    jq gettext bash-completion vim

#install kubectl and eksctl
COPY install-kubectl.sh /root/
RUN bash /root/install-kubectl.sh -i

# OktaAWSCLI bash sell setup
COPY bash_profile /root/.bashrc 
RUN yum clean all
RUN export AWS_PAGER=""
