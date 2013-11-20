# YOU NEED vagrant 1.3.5
# YOU NEED virtualbox 4.2.x 

if ! test -d ./chef
then
  git clone git@github.com:kr1sp1n/chef-repo.git chef
fi

ssh-keygen -f .chef/solo.pem