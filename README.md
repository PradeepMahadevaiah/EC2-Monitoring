# 📊 EC2 Monitoring with AWS CloudWatch (CPU, Memory, Disk, Alarms & Dashboards)

![AWS](https://img.shields.io/badge/Cloud-AWS-orange?style=flat-square)
![Monitoring](https://img.shields.io/badge/Monitoring-CloudWatch-blue?style=flat-square)
![IaC](https://img.shields.io/badge/Infra-Scripted-success?style=flat-square)

---

## 📌 Project Overview

This project sets up system-level **monitoring** for an EC2 instance using the **CloudWatch Agent**. It collects and visualizes:

- CPU usage (idle/system/user)
- Memory used %
- Disk used %
- Custom Alarms and Dashboard widgets

💡 Ideal for DevOps and Cloud Engineers to demonstrate observability skills.

---

## 🛠️ Tools & Services Used

- Amazon EC2 (Amazon Linux 2)
- Amazon CloudWatch Agent
- CloudWatch Metrics, Alarms & Dashboards
- AWS CLI (optional: Terraform or CFN)

---

## 📁 Folder Structure
```
.
├── cloudwatch-agent-config.json   # Agent config file
├── cloudwatch-setup.sh            # Setup script for EC2
├── alarm-cpu.json                 # Alarm for CPU usage
└── README.md
```

---

## 🚀 Setup Instructions

### 1. 🖥️ Launch EC2
- Use **Amazon Linux 2**
- Attach IAM Role with `CloudWatchAgentServerPolicy`

### 2. 📦 Install and Configure CloudWatch Agent
```bash
scp cloudwatch-agent-config.json ec2-user@<EC2_PUBLIC_IP>:
scp cloudwatch-setup.sh ec2-user@<EC2_PUBLIC_IP>:
ssh ec2-user@<EC2_PUBLIC_IP>
chmod +x cloudwatch-setup.sh
sudo ./cloudwatch-setup.sh
```

### 3. 📈 Verify Metrics
- Go to AWS Console → CloudWatch → Metrics → CWAgent → InstanceId

### 4. 🚨 Create CPU Alarm
Update `alarm-cpu.json` with your instance ID:
```json
"Value": "i-xxxxxxxxxxxxxxxxx"
```
Then run:
```bash
aws cloudwatch put-metric-alarm --cli-input-json file://alarm-cpu.json
```

---

## 📊 Example Dashboard Widgets

- Line chart: `CPUUtilization`
- Gauge: `mem_used_percent`
- Bar: `disk_used_percent`
- Text widget: last alarm state

🧠 Use AWS Console → CloudWatch → Dashboards → Create New

---

## 📸 Recommended Screenshots

- CWAgent metrics appearing in CloudWatch
- Alarm turning RED when threshold crossed
- Custom dashboard widgets for CPU/mem/disk

---

## 💡 Optional Enhancements

- SNS Alert on Alarm (email/Slack)
- Log streaming to CloudWatch Logs
- Export as CloudFormation or Terraform

---

## 👨‍💻 Author
**Pradeep Mahadevaiah**  
AWS & DevOps Enthusiast | GitHub: [PradeepMahadevaiah](https://github.com/PradeepMahadevaiah)

---

## 📝 License
MIT License
