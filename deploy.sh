#! /usr/bin/env bash
export DOCS_DIR=/home/stack
DEPLOY_STORAGE=False

./1_2_2-generate_ocp_roles.sh
./1_2_3-configure_container_registry.sh
./1_2_4-create_ocp_profiles.sh
./1_2_5-define_openshift_environment.sh
./1_2_6-register_overcloud_nodes_to_ocp_repo.sh
./1_2_7-deploy_ocp.sh
