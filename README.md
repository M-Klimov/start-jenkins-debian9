For start use the command:

sudo apt-get install git -y && 
mkdir /var/jenkins_home &&
git clone https://github.com/M-Klimov/start-jenkins-debian9.git /var/jenkins_home &&
chmod +x /var/jenkins_home/start.sh &&
sudo /var/jenkins_home/start.sh
