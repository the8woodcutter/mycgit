#!/usr/bin/bash
cd /srv/git
sudo chown -R $USER:$USER /srv/git
git clone git@github.com:the8woodcutter/the8woodcutter
git clone git@github.com:the8woodcutter/pyblog
git clone git@github.com:the8woodcutter/mrbot
git clone git@github.com:the8woodcutter/pubsubtools
