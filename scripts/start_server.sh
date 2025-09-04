#!/bin/bash
# Navigate to app directory
cd /home/ec2-user/codebuild-demo

# Start Node.js app using PM2
pm2 start index.js --name nodeapp
pm2 save
pm2 startup systemd -u ec2-user --hp /home/ec2-user
