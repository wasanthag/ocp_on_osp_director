#! /usr/bin/env bash
# deploy OCP
if [ "$DEPLOY_STORAGE" = "True" ]
  openstack overcloud deploy \
  --stack openshift \
  --templates \
  -r $DOCS_DIR/openshift_roles_data.yaml \
  -n /usr/share/openstack-tripleo-heat-templates/network_data_openshift.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/openshift.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/openshift-cns.yaml \
  -e $DOCS_DIR/openshift_env.yaml \
  -e $DOCS_DIR/containers-prepare-parameter.yaml \
  -e $DOCS_DIR/rhsm.yaml
else
  openstack overcloud deploy \
  --stack openshift \
  --templates \
  -r $DOCS_DIR/openshift_roles_data.yaml \
  -n /usr/share/openstack-tripleo-heat-templates/network_data_openshift.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/openshift.yaml \
  -e $DOCS_DIR/openshift_env.yaml \
  -e $DOCS_DIR/containers-prepare-parameter.yaml \
  -e $DOCS_DIR/rhsm.yaml
fi
