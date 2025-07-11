# EC2 Monitoring with AWS CloudWatch

This project sets up detailed monitoring for an EC2 instance using the Amazon CloudWatch Agent.

## Features

- CPU, memory, and disk usage metrics
- CloudWatch alarms (CPU > 60%)
- Dashboard (manual or scripted)
- SNS notification support (optional)

## Setup Instructions

### 1. Launch an EC2 instance (Amazon Linux 2)
Make sure you assign a role with `CloudWatchAgentServerPolicy`.

### 2. SSH and install agent
```bash
scp cloudwatch-agent-config.json ec2-user@<EC2_PUBLIC_IP>:
scp cloudwatch-setup.sh ec2-user@<EC2_PUBLIC_IP>:
ssh ec2-user@<EC2_PUBLIC_IP>
chmod +x cloudwatch-setup.sh
sudo ./cloudwatch-setup.sh
```

### 3. Verify Metrics
Go to CloudWatch > Metrics > CWAgent namespace

### 4. Create CPU Alarm
Replace your instance ID in `alarm-cpu.json` and run:
```bash
aws cloudwatch put-metric-alarm --cli-input-json file://alarm-cpu.json
```

## 📸 Recommended Screenshots

- CWAgent metrics in CloudWatch
- Alarm triggered (red status)
- Custom dashboard (line charts for CPU/mem/disk)

## Optional

- Add SNS topic + email subscription
- Use CloudFormation or Terraform for IaC

## Author

Pradeep Mahadevaiah — DevOps & Cloud Engineer
