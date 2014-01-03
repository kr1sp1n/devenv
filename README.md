devenv
======

My development environment


## Run with vagrant

Requirements
  * vagrant 1.3.5
  * virtualbox 4.2.x 

```bash
vagrant up
```

## Copy ssh keys

```bash
vagrant ssh-config > ./vagrant.ssh.config
scp -F vagrant.ssh.config ~/.ssh/id_rsa default:/home/vagrant/.ssh/
scp -F vagrant.ssh.config ~/.ssh/id_rsa.pub default:/home/vagrant/.ssh/
```
