variable "name_prefix" {
    default = "tutorial"
    description = "Name prefix for this environment."
}

variable "aws_region" {
    default = "ap-southeast-2"
    description = "Determine AWS region endpoint to access."
}

/* Region settings for AWS provider */
provider "aws" {
    region = "${var.aws_region}"
}
