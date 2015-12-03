FROM centos:centos6
MAINTAINER Greg Trahair <greg.trahair@gmail.com>

# Install packages and set up sshd
RUN yum -y install openssh-server openssh-clients which sudo rsync tar cronie
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/#UseDNS.*/UseDNS no/g" /etc/ssh/sshd_config; mkdir /root/.ssh; chmod 700 /root/.ssh

# Fix TTY for sudo
RUN sed -i 's/\(Defaults.*requiretty\)/# \1 /g' /etc/sudoers

# Vagrant user and key
RUN useradd vagrant
RUN echo vagrant:vagrant|chpasswd

RUN mkdir ~vagrant/.ssh -m 700
RUN curl -o ~vagrant/.ssh/authorized_keys -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
RUN chown -R vagrant. ~vagrant/.ssh

# Add scripts
ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
ADD vagrant /etc/sudoers.d/vagrant
RUN chmod +x /*.sh

EXPOSE 22
CMD ["/run.sh"]
