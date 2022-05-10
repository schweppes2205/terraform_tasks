[
  {
    "name": "${td_name}",
    "image": "${td_image}",
    "cpu": ${td_cpu},
    "memory": ${td_memory},
    "portMappings": [
      {
        "hostPort": ${td_pm_hostPort},
        "protocol": "${td_pm_protocol}",
        "containerPort": ${td_pm_containerPort}
      }
    ]
  }
]
