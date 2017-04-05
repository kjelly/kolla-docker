#!/usr/bin/env python
import os
import argparse


parser = argparse.ArgumentParser()
parser.add_argument('version')

args = parser.parse_args()

with open('Dockerfile.tpl', 'r') as f:
    template = f.read()


data = {
    "version": args.version
}

dockerfile = template.format(**data)

with open('Dockerfile', 'w') as f:
    f.write(dockerfile)

os.system('docker build -t kolla-docker .')
