#!/bin/bash
cat << EOF > ~/my_templates/firstboot-config.yaml
heat_template_version: 2014-10-16

resources:
  userdata:
    type: OS::Heat::MultipartMime
    properties:
      parts:
      - config: {get_resource: repo_config}

  repo_config:
    type: OS::Heat::SoftwareConfig
    properties:
      config: |
        #!/bin/bash
#        rpm -ivh http://rhos-release.virt.bos.redhat.com/repos/rhos-release/rhos-release-latest.noarch.rpm
#        rhos-release -p Y1 7-director
#        rhos-release -p Z2 7

outputs:
  OS::stack_id:
    value: {get_resource: userdata}
EOF
