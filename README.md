# Scalable & Automated Node.js App Deployment with AWS ECS, Terraform & CI/CD

![image_alt]()


## Project Overview
This project sets up a highly available, scalable, and automated e-commerce application using AWS ECS (Fargate), ECR, ALB, Terraform, and GitHub Actions CI/CD. It ensures zero-downtime deployments, automatic scaling, and secure networking, making it a great real-world cloud engineering challenge.

## Project Objective
1.Deploy a containerized Node.js app on AWS ECS (Fargate).

2.Automate the build, push, and deployment of Docker images via GitHub Actions.

3.Ensure auto-scaling and high availability using ECS Service Auto Scaling.

4.Secure the application using AWS IAM roles and security best practices.

5.Monitor logs and metrics using AWS CloudWatch.

6.Load balance traffic using AWS ALB.


## Features
1.Fully Containerized: The application runs inside a Docker container for consistency.

2.AWS Fargate (Serverless Compute): No need to manage EC2 instances.

3.Auto-Scaling: Automatically increases/decreases instances based on demand.

4.CI/CD Pipeline: GitHub Actions automates build & deployment.

5.Load Balancing: ALB distributes traffic to healthy containers.

6.Logging & Monitoring: AWS CloudWatch tracks system logs and metrics.

7.Infrastructure as Code: Terraform provisions and manages AWS resources.

## Technologies Used

1.AWS ECS (Fargate) – Serverless container orchestration

2.AWS ECR – Private container registry

3.AWS ALB – Distributes traffic across containers

4.Terraform – Infrastructure as Code (IaC)

5.GitHub Actions – CI/CD automation

6.CloudWatch – Logging and monitoring

7.Node.js – Web application

8.Docker – Containerization

## Use Case
You are Cloud Engeiner at Up The Chels Corp,run a e-commerce website and at the end of the they have a black friday sale and as the Cloud Engineer you are tasked with the Automation of the website using CI/CD,ensure that there is zero downtime of the to  the website and the wesite must handle high traffic during surges and goes back to normal after when traffic is not high.


## Prerequisites
AWS Account with necessary permissions.

Terraform installed `(terraform >= 1.x)`.

Docker installed `(docker >= 20.x)`.

GitHub Repository for CI/CD.

AWS CLI configured (aws configure).

## Step 1: Clone the Repository

