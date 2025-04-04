#!/usr/bin/python3
import os

for repo in os.listdir('/srv/git'):
    if os.path.isdir(repo):
        if os.path.exists(repo + "/.git"):
            cmd = f"cd /srv/git/{repo} && git pull"
            os.system(cmd)
