FROM amazonlinux:2023.4.20240416.0

RUN dnf update & dnf upgrade 
RUN dnf install -y --allowerasing curl 

RUN dnf install -y vim wget
RUN dnf install -y git 
RUN dnf install -y docker

WORKDIR /home
