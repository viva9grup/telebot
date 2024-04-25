#!/bin/bash
sudo apt install curl -y
sudo apt-get install build-essential git -y

# cehck if nvm already install
if command -v nvm &> /dev/null
then
    echo "NVM OK!"
else
    echo "Installing NVM."
    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
    source ~/.bashrc
    nvm install 18
fi

if command -v nvm &> /dev/null; then
    echo Installing SSH Bot."
fi

git clone https://github.com/botgram/shell-bot.git 
cd shell-bot
npm install

echo "prepare your bot token get it from @botfather after that copy the bot token"

echo -n "Is your bot token ready : (y/n)"
read token

if [ "$token" = "y" ];then
node server
else
echo ""Try again from begining"
exhi 1;
fi

npm install pm2 -g
sudo ln -s /usr/local/lib/nodejs/18.16.0/lib/node_modules/pm2/bin/pm2 /usr/bin/pm2
pm2 start server.js
pm2 startup systemd

echo "Finished! try to run /run ls -la to bot via chat or group"
echo ""
