FROM ruby:2.1.9
#======================
# Install OpenSSH server (sshd)
#======================
RUN apt-get update -qqy \
  && apt-get -qqy install \
    openssh-server \
  && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
  && echo "export VISIBLE=now" >> /etc/profile \
  && mkdir -p /var/run/sshd \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y rsync

COPY sshd.conf /etc/ssh/sshd_config

COPY src /var/www
RUN cd /var/www && bundle install

RUN echo "root:root" | chpasswd

EXPOSE 22
