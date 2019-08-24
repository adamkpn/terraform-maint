## TO-DO:
You received a task to power off these three instances on daily basis from 20:00 PM till 8:00 AM
How will you implement this task? (write the relevant code)

## ABSTRACT:
- The solution described below, based on "How do I stop and start Amazon EC2 instances at regular intervals using Lambda?" article (link: https://aws.amazon.com/premiumsupport/knowledge-center/start-stop-lambda-cloudwatch/)\

## SOLUTION:
- Is based on Terraform
- The files in repo:

```
# Python function to stop the Instances (based in known EC2, instance ID's)
start_instances.py
```
```
# Python function to start the Instances (based in known EC2, instance ID's)
start_instances.py
```
- After defining the instances details in a "instances" list ```instances = ['i-00cf4e0582622951d', 'i-0533ab77f2916e724','i-0533ab77f2916e724']```
  Convert the Python files into the Zip, by running the following commands:
  ```zip start_instances start_instances.py```
  ```zip stop_instances stop_instances.py```
  
  
Now, from the root folder, run:
```
terraform init
terraform plan -out tfplan
terraform apply tfplan
```

This will create a new role for Lambda, 2 x Lambda functions, 2 x AWS CloudWatch rules to fire the Lambda function to Start/Stop instances
