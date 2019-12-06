FROM ansible-docker:master-ubuntu16.04


# Authorize SSH Host
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan 192.168.0.114  > /root/.ssh/known_hosts

# Add the keys and set permissions
RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
    echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub

RUN echo "===> Install docker python module " && \
    pip install docker


ENV PATH        /usr/local/lib/python2.7/dist-packages/docker:$PATH

ENTRYPOINT ["ansible-playbook"]
