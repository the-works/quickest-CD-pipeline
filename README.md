# The Quickest CD Pipeline setup

Fully automated, git push-driven CD pipeline proof of concept.

1. Private DockerHub repo monitoring this GitHub repo - Docker container build triggers on `git push`

2. If the Dockerfile in this repo is built correctly, a webhook is fired against an AWS API Gateway triggering a Lambda

3. The Lambda executes the code found in `function.py` -> it executes a deploy script via an SSH tunnel using [Paramiko](http://www.paramiko.org/) on a target IP

4. `deploy.sh` runs a simple set of docker container update sequence commands

5. Once the container is up, a simple nginx server hosts and displays this README.md on the target machine

