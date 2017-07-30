/* Cluster definition, which is used in autoscaling.tf */
resource "aws_ecs_cluster" "cassandra_cluster" {
    name = "${var.name_prefix}_cassandra_cluster"
}

/* ECS service definition */
resource "aws_ecs_service" "cassandra_service" {
    name = "${var.name_prefix}_cassandra_service"
    cluster = "${aws_ecs_cluster.cassandra_cluster.id}"
    task_definition = "${aws_ecs_task_definition.cassandra_definition.arn}"
    desired_count = "${var.count_cassandra}"
    deployment_minimum_healthy_percent = "${var.minimum_healthy_percent_cassandra}"
    iam_role = "${var.ecs_service_role}"

    load_balancer {
        elb_name = "${aws_elb.main.id}"
        container_name = "cassandra"
        container_port = 5000
    }

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_ecs_task_definition" "cassandra_definition" {
    family = "${var.name_prefix}_cassandra"
    container_definitions = "${template_file.task_cassandra.rendered}"

    lifecycle {
        create_before_destroy = true
    }
}

resource "template_file" "task_cassandra" {
    template= "${file("task-definitions/ecs_task_cassandra.tpl")}"

    vars {
        cassandra_docker_image = "${var.cassandra_docker_image_name}:${var.cassandra_docker_image_tag}"
    }

    lifecycle {
        create_before_destroy = true
    }
}
