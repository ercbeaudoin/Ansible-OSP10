#!/bin/bash
cat << EOF > ~/my_templates/firstboot-environment.yaml
resource_registry:
  OS::TripleO::NodeUserData: /home/stack/my_templates/firstboot-config.yaml
EOF
