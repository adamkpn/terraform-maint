import boto3
region = 'us-east-1'
instances = ['i-00cf4e0582622951d', 'i-0533ab77f2916e724','i-0533ab77f2916e724']

def handler(event, context):
    ec2 = boto3.client('ec2', region_name=region)
    ec2.start_instances(InstanceIds=instances)
    print 'started your instances: ' + str(instances)
