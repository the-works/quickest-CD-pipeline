import json
import paramiko
import time
import os

def lambda_handler(event, context):
    ip = os.environ['target_ip']
    user = os.environ['deployer_user']
    pw = os.environ['deployer_pass']
    path = os.environ['deploy_script_path']
    docker_user = os.environ['docker_user']
    docker_pw = os.environ['docker_pass']

    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.WarningPolicy())
    ssh.connect(ip, username=user, password=pw, look_for_keys=False, allow_agent=False)
    stdin, stdout, stderr = ssh.exec_command(path + ' ' + docker_user + ' ' + docker_pw + ' &')

    return {
        'statusCode': 200,
        'body': json.dumps("Deployment started successfully.")
    }


