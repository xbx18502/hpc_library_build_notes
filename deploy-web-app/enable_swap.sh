sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile


sudo swapoff /swapfile
sudo rm /swapfile