#!/bin/bash
# Stop Node.js app using PM2 if running
isExistNode="$(pm2 list | grep nodeapp)"
if [[ -n $isExistNode ]]; then
    pm2 stop nodeapp
fi
