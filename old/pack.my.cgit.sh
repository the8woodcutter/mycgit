#!/usr/bin/bash
# for packing up from current OS a properly working CGIT and Nginx:
## April 2nd 2025

# creating copy directories in this directory:
sudo mkdir -p etc/nginx/sites-available
sudo mkdir -p usr/share/cgit
sudo mkdir -p usr/lib/cgit

# copying existing local files to this directory:
sudo cp /etc/cgitrc /etc/cgitrepos /etc/cgit-auth-secret etc/
sudo cp -r /usr/share/cgit/* usr/share/cgit/
sudo cp -r /usr/lib/cgit/* usr/lib/cgit/
#sudo cp /etc/nginx/sites-available/cgit.conf etc/nginx/sites-available/
sudo mkdir -p srv/git
cp git.em.sh srv/git

echo && echo "Always keep these updated on their remote repositories!" && echo
