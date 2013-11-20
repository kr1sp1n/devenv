echo "I am provisioning..."
sudo apt-get update --yes --force-yes
sudo apt-get install curl --yes --force-yes
curl -L https://www.opscode.com/chef/install.sh | sudo bash