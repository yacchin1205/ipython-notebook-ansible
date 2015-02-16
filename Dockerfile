FROM unfairbanks/docker-ipython-notebook
MAINTAINER https://github.com/nii-clouds/

RUN apt-get update && \
        apt-get -y install python-yaml sshpass openssl curl wget ipmitool && \
        pip install requests paramiko ansible

