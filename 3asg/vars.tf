variable "name_prefix" {
    default = "Tao-test"
    description = "Name prefix for this environment."
}

variable "aws_region" {
    default = "ap-southeast-2"
    description = "Determine AWS region endpoint to access."
}

/* ECS optimized AMIs per region */
variable "ecs_image_id" {
  # ami-2015.09.g with ECS Agent 1.8.1 and Docker 1.9.1
  default = {
    ap-southeast-2 = "ami-42e9f921"
  }
}

variable "cassandra_docker_image_name" {
    default = "training/cassandra_docker_image"
    description = "Docker image from Docker Hub"
}

variable "cassandra_docker_image_tag" {
    default = "latest"
    description = "Docker image version to pull (from tag)"
}

variable "count_cassandra" {
    default = 2
    description = "Number of cassandra tasks to run"
}

variable "desired_capacity_on_demand" {
    default = 2
    description = "Number of instance to run"
}

variable "ec2_key_name" {
    default = "Tao-test"
    description = "EC2 key name to SSH to the instance, make sure that you have this key if you want to access your instance via SSH"
}

variable "instance_type" {
    default = "t2.small"
    description = "EC2 instance type to use"
}

variable "minimum_healthy_percent_cassandra" {
    default = 50
    description = "ECS minimum_healthy_percent configuration, set it lower than 100 to allow rolling update without adding new instances"
}

/* Consume common outputs */
variable "sg_cassandra_elbs_id" {}
variable "sg_cassandra_instances_id" {}
variable "subnet_ids" {}

/* Consume static outputs */
variable "ecs_instance_profile" {}
variable "ecs_service_role" {}

/* Region settings for AWS provider */
provider "aws" {
    region = "${var.aws_region}"
}
