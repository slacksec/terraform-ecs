##
# Some of these variables may be removed from this file if the default value exists
# For better understanding, let's specify all variables explicitly here
##
name_prefix = "Tao-test"
aws_region = "ap-southeast-2"
ecs_image_id.ap-southeast-2 = "ami-42e9f921"
count_cassandra = 2
desired_capacity_on_demand = 2
ec2_key_name = "Tao-test"
instance_type = "t2.small"
minimum_healthy_percent_cassandra = 50

##
# This is a sample (public) Docker image from which can be accessed at https://github.com/docker-training/cassandra
# This sample image utilizes Flask and it's not RECOMMENDED to run it directly in production (performance degradation)
# This web server binds to port 5000
##
cassandra_docker_image_name = "training/cassandra"
cassandra_docker_image_tag = "latest"

##
# These variables are required, please fill it out with your environment outputs
##
sg_cassandra_elbs_id = "sg-2a65714d"
sg_cassandra_instances_id = "sg-e07b6f87"
subnet_ids = "subnet-bc0b3fca,subnet-8d7670e9"

ecs_instance_profile = "arn:aws:iam::885593814922:instance-profile/Tao-test_ecs_instance_profile"
ecs_service_role = "Tao-test_ecs_service_role"
