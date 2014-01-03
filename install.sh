#!/bin/bash

echo "Check for distro..."
distro=`lsb_release -i | awk '{print $3}'`

if [ "$distro" != "SUSE" ]; then
  sudo apt-get update
fi

echo "Check for git..."
git=`which git`
if ! test -f "$git"; then
  sudo apt-get install git-core --yes --force-yes
fi

if ! test -d ./chef
then
  echo "Checkout chef-repo..."
  git clone git@github.com:kr1sp1n/chef-repo.git chef
fi

if ! test -f ./.chef/solo.pem
then
  echo "Generate solo.pem..."
  ssh-keygen -f .chef/solo.pem
fi

chef_solo=`which chef-solo`
if ! test -f "$chef_solo";
then
  curl=`which curl`
  if ! test -f "$curl"; then
    echo "Install curl..."
    sudo apt-get install curl --yes --force-yes
  fi
  echo "Install chef-solo..."
  sudo apt-get update --yes --force-yes
  curl -L https://www.opscode.com/chef/install.sh | sudo bash
fi

sudo "$chef_solo" -c ./solo.rb -j ./solo.json
