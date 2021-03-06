<<<<<<< HEAD
FROM centos
RUN yum -y install openssh-server

ENV TZ Europe/London

RUN useradd remote_user && \
    echo "1234" | passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 400 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

RUN yum -y install mysql

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install awscli --upgrade

CMD /usr/sbin/sshd -D
 
=======
FROM jenkins/jenkins

ENV TZ Europe/London

USER root  

RUN  curl -O https://bootstrap.pypa.io/get-pip.py && \
     python get-pip.py && \
     pip install ansible --upgrade

USER jenkins


>>>>>>> 7f2e09dbd7b5d0709c3772605d83bd4355e7a9fb
