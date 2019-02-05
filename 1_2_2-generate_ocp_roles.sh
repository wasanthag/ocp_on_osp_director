# /usr/bin/env bash
# create the roles yaml file
cat << EOF > $DOCS_DIR/openshift_roles_data.yaml
- name: OpenShiftMaster
  description: The control plane of the OpenShift cluster
  ServicesDefault:
  - OS::TripleO::Services::ContainerImagePrepare
  - OS::TripleO::Services::Docker
  - OS::TripleO::Services::HAproxy
  - OS::TripleO::Services::Keepalived
  - OS::TripleO::Services::Ntp
  - OS::TripleO::Services::OpenShift::Master
  - OS::TripleO::Services::Rhsm
  - OS::TripleO::Services::Sshd
  - OS::TripleO::Services::TripleoFirewall
  - OS::TripleO::Services::TripleoPackages
- name: OpenShiftWorker
  description: Application node running OpenShift infrastructure services
  ServicesDefault:
  - OS::TripleO::Services::Docker
  - OS::TripleO::Services::Ntp
  - OS::TripleO::Services::OpenShift::GlusterFS
  - OS::TripleO::Services::OpenShift::Worker
  - OS::TripleO::Services::Rhsm
  - OS::TripleO::Services::Sshd
  - OS::TripleO::Services::TripleoFirewall
- name: OpenShiftInfra
  description: Application node running OpenShift infrastructure services
  ServicesDefault:
  - OS::TripleO::Services::Docker
  - OS::TripleO::Services::Ntp
  - OS::TripleO::Services::OpenShift::GlusterFS
  - OS::TripleO::Services::OpenShift::Infra
  - OS::TripleO::Services::Rhsm
  - OS::TripleO::Services::Sshd
  - OS::TripleO::Services::TripleoFirewall
EOF
# Generate the OCP roles:
openstack overcloud roles generate -o $DOCS_DIR/openshift_roles_data.yaml OpenShiftMaster OpenShiftWorker OpenShiftInfra
# View the OCP roles
openstack overcloud role list
