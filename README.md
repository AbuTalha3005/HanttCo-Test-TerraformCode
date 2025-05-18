# HanttCo AWS Windows EC2 Terraform Deployment

## Purpose  
This project automates the deployment of a **Windows EC2 instance in AWS** using **Terraform**, ensuring security, scalability, and modularity. The setup includes private networking, IAM roles for access control, and best practices for AWS resource management.

## Author: AbuTalha  

## Project Overview  
This Terraform-based infrastructure sets up a **Windows EC2 instance within a private AWS subnet**, ensuring **secure access and controlled traffic routing** via a **Network Load Balancer (NLB)**. The deployment follows **AWS best practices**, including:  
**VPC with Public & Private Subnets**  
**Windows EC2 instance in private subnet**  
**Security Group allowing RDP (3389) & HTTPS (443)**  
**IAM Role & Instance Profile for AWS SSM access**  
**Network Load Balancer (NLB) handling inbound traffic**  

## Technology Used
**Terraform** (Infrastructure as Code)  
**AWS EC2 (Windows Server 2022 Base AMI)**  
**AWS VPC (Networking)**  
**AWS IAM (Access Control)**  
**AWS Security Groups (Firewall Rules)**  
**AWS NLB (Load Balancer)**  

## Project Structure
![image](https://github.com/user-attachments/assets/1ce3308f-d458-4827-b1c3-a0f1bf8f4e62)

## Architecture
![Untitled Diagram drawio](https://github.com/user-attachments/assets/d51e160c-3264-4c2a-8cc8-223a195a1a21)

## Project Successfully Implemented Screenshot
**No Error While Running Deployment TerraForm Plan**
![image](https://github.com/user-attachments/assets/06807034-34eb-4a4f-9e72-73b9be1589d8)

**Deployed Successfully With Nop Errors**
![image](https://github.com/user-attachments/assets/26050173-8338-47a9-9fdb-cfe4c41d7592)

**Destroyed Successfully with No Errors**
![image](https://github.com/user-attachments/assets/f29c4f7e-0f52-4e69-a610-ca02d8d5c174)


