#!/usr/bin/bash
# Assumes Debian 12.9:
## Date is April 2nd 2025

sudo apt install cgit python3-markdown

sudo cp -r usr/lib/cgit/* /usr/lib/cgit/
sudo cp -r usr/share/cgit/* /usr/share/cgit/

sudo cp etc/cgitrc /etc
sudo cp etc/cgitrepos /etc

sudo cp etc/nginx/sites-available/cgit.conf /etc/nginx/sites-available/
sudo ln -n /etc/nginx/sites-available/cgit.conf /etc/nginx/sites-enabled/
sudo nginx -t

cd srv/git && bash git.em.sh

echo && echo "Finished." && echo
