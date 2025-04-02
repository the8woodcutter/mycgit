#!/usr/bin/bash
# for packing up from current OS a properly working CGIT and Nginx:
## April 2nd 2025

sudo mkdir -p etc/nginx/sites-available
sudo mkdir -p usr/share/cgit
sudo mkdir -p usr/lib/cgit
sudo cp /etc/cgitrc /etc/cgitrepos etc/
sudo cp -r /usr/share/cgit/* usr/share/cgit/
sudo cp -r /usr/lib/cgit/* usr/lib/cgit/
sudo cp /etc/nginx/sites-available/cgit.conf etc/nginx/sites-available/
sudo mkdir -p srv/git
cd srv/git
echo "#!/usr/bin/bash\r\ngit clone git@github.com:the8woodcutter/the8woodcutter\r\ngit clone git@github:the8woodcutter/pyblog\r\ngit clone git@github:the8woodcutter/mrbot\r\ngit clone git@github:the8woodcutter/pubsubtools" > git.em.sh
echo && echo "Always keep these updated on their remote repositories!" && echo