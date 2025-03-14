# Scalable & Automated Node.js App Deployment with AWS ECS, Terraform & CI/CD

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/4cb39552838cda7618e8392644c541a2cb7b8436/img/Screenshot%202025-03-13%20192135.png)


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
You are Cloud Engeiner at Up The Chels Corp, they run a e-commerce website and at the end of the they have a black friday sale and as the Cloud Engineer you are tasked with the Automation of the website using CI/CD,ensure that there is zero downtime of the to  the website and the wesite must handle high traffic during surges and goes back to normal after when traffic is not high.


## Prerequisites
AWS Account with necessary permissions.

Terraform installed `(terraform >= 1.x)`.

Docker installed `(docker >= 20.x)`.

GitHub Repository for CI/CD.

AWS CLI configured (aws configure).

## Step 1: Clone the Repository

1.1.Clone this repository to your local machine.
```language
git clone https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions.git

```
## Build & Push Docker Image to Amazon ECR
Before Terraform provisons AWS resources we need to push your application Docker image to ECR:

```language
aws ecr create-repository --repository-name your-repository-name

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <YOUR ACCOUNT ID>.dkr.ecr.us-east-1.amazonaws.com

docker build -t my-node-app .

docker tag my-node-app:latest <ECR_URI>:latest

docker push <ECR_URI>:latest
```

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/4bf66b56dc66376574c8c495852b6d56d30ab303/img/Screenshot%202025-03-13%20192429.png)


## Step 2 : Run Terraform workflow to initialize, validate, plan then apply

2.1.Terraform will provision:

1.ECS Cluster, Task Definition, and Service

2.Load Balancer & Target Group

3.ECR Repository for container storage

4.IAM roles for security

5.Auto Scaling for ECS tasks


2.2.In your local terraform visual code environment terminal, to initialize the necessary providers, execute the following command in your environment terminal.

```language
terraform init
```

Upon completion of the initialization process, a successful prompt will be displayed, as shown 

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/b0bce6f0b65f6542218afa46b4c79ebdbf712d7d/img/Screenshot%202025-03-13%20121756.png)


2.3.Next, let’s ensure that our code does not contain any syntax errors by running the following command

```language
terraform validate
```

The command should generate a success message, confirming that it is valid, as demonstrated below.

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/eae155bbb76da4f3ef42d198fd7707b0e3456578/img/Screenshot%202025-03-13%20121908.png)


2.4.Let’s now execute the following command to generate a list of all the modifications that Terraform will apply.

```language
terraform plan
```

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/227e556286883d68fe4a0f066befb28117e5e6a0/img/Screenshot%202025-03-13%20122134.png)

The list of changes that Terraform is anticipated to apply to the infrastructure resources should be displayed. The “+” sign indicates what will be added, while the “-” sign indicates what will be removed.


2.5.Now, let’s deploy this infrastructure! Execute the following command to apply the changes and deploy the resources. Note — Make sure to type “yes” to agree to the changes after running this command.

```language
terraform apply
```
Terraform will initiate the process of applying all the changes to the infrastructure. Kindly wait for a few seconds for the deployment process to complete.

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/d7d6e80e29ced8adcc8cd7c173580ea486044c29/img/Screenshot%202025-03-13%20122620.png)


## Success
The process should now conclude with a message indicating “Apply complete”, stating the total number of added, modified, and destroyed resources, accompanied by several resources.
Please copy and save the ALB’s DNS URL, which will be required to access the web page from the browser.


![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/5503e978e1c15eba149a22b92fc416729d8fba37/img/Screenshot%202025-03-13%20123037.png)



## Step 3: Verify creation of our resources
3.1.In the AWS Management Console, head to the ECS Console and verify that there are two Tasks running as show below

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/f03fd97d329e1edd418ec255d1b4bb2b578ef376/img/Screenshot%202025-03-13%20124437.png)


3.2.In the AWS Management Console, head to the EC2 dashboard and verify that the ECS load Balancer was successfull created.

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/20676d9665083adffa36bc0d546b3f1fbcff94eb/img/Screenshot%202025-03-13%20124530.png)


Also, navigate to the left pane, scroll down and select Target groups. Select the created Target group, scroll down, then verify that the instances Health status is healthy, as shown below.

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/8bef32e630d275bac1b2b60e35fceea1123e9d17/img/Screenshot%202025-03-13%20124548.png)


Great! We’ve successfully confirmed that our ECS has 2 task running instances, and all of our Target groups’ health statuses are displaying as healthy. Let’s now verify that we can access our ASG’s web servers through our ALB.


## Lets verify the reachability to the website using its URL in browser

1.Open up your desired browser and paste the ALB’s DNS URL in your browser.

2.Note — Make sure to use the “http://” protocol and not https:// to reach the ALB.

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/47ab15c2f7da27210ec77f4f5194f6e184ee2ff3/img/Screenshot%202025-03-13%20125142.png)



3.4.Verify the Auto Scaling group if it was successfully created.

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/381a010ad371d2de2212bda7dc4a03f424dea4e3/img/Screenshot%202025-03-13%20142419.png)



## Step 4: lets Set up CI/CD Workflow (GitHub Actions)
4.1.Every time you push changes to the `master` branch:

1.GitHub Actions triggers the workflow.

2.Builds a new Docker image from the updated code.

3.Pushes the image to AWS ECR.

4.Deploys a new task to ECS, replacing the old one.

GitHub Actions Workflow:

```language
name: Deploy to AWS ECS

on:
  push:
    branches:
      - master  # Trigger on push to master

jobs:
  deploy:
    name: Build, Push, and Deploy to ECS
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v3

      - name: Verify Dockerfile exists
        run: |
          if [ ! -f app/Dockerfile ]; then
            echo " Dockerfile missing! Exiting..."
            exit 1
          fi

      - name: Set up AWS Credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1  # Change to your AWS region

      - name: Login to Amazon ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v1

      - name: Build, Tag, and Push Docker Image
        env:
          ECR_URI: ${{ secrets.ECR_URI }}
        run: |
          IMAGE_TAG=$(echo $GITHUB_SHA | cut -c1-7)
          docker build -t $ECR_URI:$IMAGE_TAG -f app/Dockerfile app/
          docker push $ECR_URI:$IMAGE_TAG
          echo "IMAGE_TAG=$IMAGE_TAG" >> $GITHUB_ENV

      - name: Register New ECS Task Definition
        id: task-def
        env:
          TASK_FAMILY: ${{ secrets.TASK_FAMILY }}  # Set this in GitHub Secrets
        run: |
          # Fetch the latest task definition JSON
          aws ecs describe-task-definition --task-definition $TASK_FAMILY --query taskDefinition > task-def.json
          
          # Remove unnecessary fields
          jq 'del(.taskDefinitionArn, .requiresAttributes, .compatibilities, .revision, .status, .registeredAt, .registeredBy)' task-def.json > new-task-def.json
          
          # Update the container image in the task definition
          jq --arg IMAGE_URI "${{ secrets.ECR_URI }}:$IMAGE_TAG" '.containerDefinitions[0].image = $IMAGE_URI' new-task-def.json > updated-task-def.json
          
          # Register the new task definition
          NEW_TASK_DEF_ARN=$(aws ecs register-task-definition --cli-input-json file://updated-task-def.json --query 'taskDefinition.taskDefinitionArn' --output text)
          echo "NEW_TASK_DEF_ARN=$NEW_TASK_DEF_ARN" >> $GITHUB_ENV

      - name: Deploy Updated Task Definition to ECS
        env:
          ECS_CLUSTER_NAME: ${{ secrets.ECS_CLUSTER_NAME }}  # Set this in GitHub Secrets
          ECS_SERVICE_NAME: ${{ secrets.ECS_SERVICE_NAME }}  # Set this in GitHub Secrets
        run: |
          aws ecs update-service \
            --cluster $ECS_CLUSTER_NAME \
            --service $ECS_SERVICE_NAME \
            --task-definition $NEW_TASK_DEF_ARN \
            --force-new-deployment

```


4.2.Manage Secrets in GitHub:

1.Environment Variables: 

The `env`section within the steps that require AWS credentials pulls the values from the secrets stored in the GitHub repository.

2.Navigate to Your Repository on GitHub

3.Add Secrets `Settings > Secrets and variables > Actions`.

4.Add the following secrets:

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/57961d8061726e2ad74ca61e6525684f9706dc73/img/Screenshot%202025-03-13%20162644.png)




## Step 5: Testing the CI/CD Pipeline
5.1.Push a Code Change to Trigger Deployment on your app homepage.

```language

git add .

git commit -m "Updated Node.js app Homepage"

git push origin master
```
![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/396c7b5245558bfe977b1a47bd99adb2a2d43bab/img/Screenshot%202025-03-13%20131556.png)


5.2.Monitor GitHub Actions Workflow:

1.Go to GitHub → Actions and check the pipeline logs.

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/f6d55afd472a28aa8ff22007749c2b59799ee13c/img/Screenshot%202025-03-13%20131801.png)


![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/2f2324e9b71622c41cde7c0c73d86991cc05ac98/img/Screenshot%202025-03-13%20131841.png)


5.3.Verify in AWS ECS Console:

1.Check ECS Task Definition to see the new revision.


2.Verify ECS Service is running the new task.

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/5d2dec9ca60cbe670bdb03dc4fdf592a488e973c/img/Screenshot%202025-03-13%20131940.png)


3.Also verify if the website homepage was updated successfully.

![image_alt](https://github.com/Tatenda-Prince/Auto-Scaling-Node.js-App-with-AWS-ECS-ECR-GitHub-Actions/blob/e9b2b40d3ae59d7e1132c9b5d0813722fe3931a5/img/Screenshot%202025-03-13%20132038.png)


## Future Enhancements

1.Implement Blue-Green Deployment for seamless updates.

2.Enhance Security with AWS WAF and fine-tuned IAM roles.

3.Add CloudFront for better global performance.


## Congratulations
We have succesfully created a Scalable & Automated Node.js App Deployment Cloud automation with Terraform & AWS,CI/CD best practices using GitHub Actions and Auto-scaling containerized application.
























