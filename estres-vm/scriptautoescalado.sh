sudo apt-get update
sudo apt-get install apache2-utils -y
sudo apt-get install stress
ab -c 1000 -n 50000 -r http://34.159.106.69:80/