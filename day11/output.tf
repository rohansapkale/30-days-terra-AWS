#define what info to display after terraform apply
output "formatted_project_name"{
    value=local.formatted_project_name
}
output "port_list"{
    value=local.port_lists
}
output "sg_rules"{
    value=local.sg_rules
}
output "instance_size"{
    value=local.instance_size
}