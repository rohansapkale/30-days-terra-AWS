locals{
  formatted_project_name= lower(replace(var.project_name," ","-"))
  new_tag = merge(var.default_tags,var.environment_tags)
  formatted_bucket_name=replace(substr(lower(var.bucket_name),0,63)," ","")
  port_lists=split(",",var.allowed_ports)
  sg_rules =[ for port in local.port_lists :
  {
      name="port-${port}"
      port = port
      description="Allowed traffice on port ${port}"
  }
  ]
  instance_size=lookup(var.instance_sizes,var.environment,"t2.micro")

  all_locations= concat(var.user_locations,var.default_locations)
  unique_location=toset(local.all_locations)

  positive_cost =[ for cost in var.monthly_costs: abs(cost)]  
  max_cost = max(local.positive_cost...)
  min_cost=min(local.positive_cost...)

  config_file_exists=fileexists("./config.json")
  config_data = local.config_file_exists ? jsondecode(file("./config.json")) :{}
}

resource "aws_s3_bucket" "first_s3"{
  bucket=local.formatted_bucket_name
  tags=local.new_tag
}

