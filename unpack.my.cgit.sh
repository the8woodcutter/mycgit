#!/usr/bin/bash
# Assumes Debian 12.9:
## Date is April 2nd 2025

sudo apt install cgit python3-markdown

sudo rm -rf /usr/lib/cgit/* /usr/share/cgit/*
sudo cp -r usr/lib/cgit/* /usr/lib/cgit/
sudo cp -r usr/share/cgit/* /usr/share/cgit/

sudo cp etc/cgitrc /etc
sudo cp etc/cgitrepos /etc
sudo cp etc/cgit-auth-secret /etc

echo && echo "Change `/etc/cgit-auth-secret` !" && echo

#sudo cp etc/nginx/sites-available/cgit.conf /etc/nginx/sites-available/
#sudo rm /etc/nginx/sites-enabled/cgit.conf
#sudo ln -s /etc/nginx/sites-available/cgit.conf /etc/nginx/sites-enabled/

cd srv/git && bash git.em.sh
sudo systemctl restart nginx

echo && echo "Finished." && echo
