# terraform-ecs


```
├── asg
|   ├── task-definition
|   |   ├── ecs_task_webapp.tpl
|   |   └── ... (another task definitions)
|   ├── autoscaling.tf
|   ├── autoscaling_user_data.tpl
|   ├── configuration.tfvars
|   ├── ecs.tf
|   ├── elb.tf
|   ├── output.tf
|   ├── vars.tf
|   └── ... (other ASG related files)
|
├── common
|   ├── configuration.tfvars
|   ├── output.tf
|   ├── security_groups.tf
|   ├── vpc.tf
|   ├── vars.tf
|   └── ... (other common related files)
|
└── static
    ├── iam
    |   ├── configuration.tfvars
    |   ├── iam.tf
    |   ├── output.tf
    |   └── vars.tf  
    └── ... (other AWS services: SQS, DynamoDB, etc)
```


## Deployment steps

For the first step, we need to deploy these environments in order: `1static` --> `2common` --> `3asg`. After first deployment, our changes will usually happen in `asg` category, so we don't need to touch other environments anymore.

The workflow for each part is basically quite the same:

1. Modify configuration.tfvars variables
2. Run `terraform plan -var-file=configuration.tfvars` and confirm changes
3. Run `terraform apply -var-file=configuration.tfvars`
