/* Security group */
output "sg_cassandra_elbs_id" {
    value = "${aws_security_group.cassandra_elbs.id}"
}

output "sg_cassandra_instances_id" {
    value = "${aws_security_group.cassandra_instances.id}"
}

/* Subnet IDs */
output "subnet_ids" {
    value = "${join(",", aws_subnet.subnet.*.id)}"
}
