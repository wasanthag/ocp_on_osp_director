#! /usr/bin/env bash
# Your overcloud nodes require access to the OpenShift repository to install OCP packages. For information on how to configure RHSM in your director-based deployment, see https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/13/html/advanced_overcloud_customization/ansible-based-registration. To make the OpenShift packages available to your nodes, add an entry for rhel-7-server-ose-3.11-rpms to your rhsm.yml file
cat << EOF > $DOCS_DIR/rhsm.yml
resource_registry:
  OS::TripleO::Services::Rhsm: /usr/share/openstack-tripleo-heat-templates/extraconfig/services/rhsm.yaml
parameter_defaults:
  RhsmVars:
  rhsm_repos:
    - rhel-7-server-rpms
    - rhel-7-server-extras-rpms
    - rhel-7-server-ose-3.11-rpms
  rhsm_pool_ids: "8a85f37c63842fef0166949e5f9c4be0"
  rhsm_method: "portal"
  rhsm_username: yourusername
  rhsm_password: yourpassword
  rhsm_autosubscribe: true
EOF
