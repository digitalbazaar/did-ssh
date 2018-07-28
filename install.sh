#!/usr/bin/env bash

mkdir /did-ssh
chmod 777 /did-ssh
cd /did-ssh
cp /home/ubuntu/did-ssh/did-authorized-keys .
cp /home/ubuntu/did-ssh/ssh-buffer.js .
cp /home/ubuntu/did-ssh/package.json .
cp /home/ubuntu/did-ssh/users.yml .
su ubuntu -c 'npm install'
cd /
chown -R root:root did-ssh
chmod -R 755 did-ssh
echo AuthorizedKeysCommand /did-ssh/did-authorized-keys >> /etc/ssh/sshd_config
echo AuthorizedKeysCommandUser nobody >> /etc/ssh/sshd_config
