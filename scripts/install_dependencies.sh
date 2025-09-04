
#!/bin/bash
# Install Node.js and npm
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Navigate to app directory
cd /home/ec2-user/codebuild-demo

# Install app dependencies
npm install

# Install PM2 globally
sudo npm install -g pm2
