# /usr/bin/env bash
# create the roles yaml file
cat << EOF > $DOCS_DIR/openshift_roles_data.yaml
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
ServicesDefault:
- OS::TripleO::Services::Docker
- OS::TripleO::Services::Ntp
- OS::TripleO::Services::OpenShift::GlusterFS
- OS::TripleO::Services::OpenShift::Worker
- OS::TripleO::Services::Rhsm
- OS::TripleO::Services::Sshd
- OS::TripleO::Services::TripleoFirewall
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
