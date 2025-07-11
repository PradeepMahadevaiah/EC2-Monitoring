#!/bin/bash

sudo yum update -y
sudo yum install -y amazon-cloudwatch-agent

sudo mkdir -p /opt/aws/amazon-cloudwatch-agent/etc
sudo cp cloudwatch-agent-config.json /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json \
  -s
