#! /usr/bin/env bash
# Create the openshift_env.yaml file
cat << EOF > $DOCS_DIR/openshift_env.yaml
parameter_defaults:
# by default Director assigns the VIP random from the allocation pool
# by using the FixedIPs we can set the VIPs to predictable IPs before starting the deployment

CloudName: openshift.localdomain
PublicVirtualFixedIPs: [{'ip_address':'192.168.122.100'}]

CloudNameInternal: internal.openshift.localdomain
InternalApiVirtualFixedIPs: [{'ip_address':'172.17.1.100'}]

CloudDomain: openshift.localdomain

## Required for CNS deployments only
  OpenShiftInfraParameters:
    OpenShiftGlusterDisks:
      - /dev/vdb

## Required for CNS deployments only
  OpenShiftWorkerParameters:
    OpenShiftGlusterDisks:
      - /dev/vdb
      - /dev/vdc

NtpServer: ["clock.redhat.com","clock2.redhat.com"]

ControlPlaneDefaultRoute: 192.168.122.1
EC2MetadataIp: 192.168.122.253
ControlPlaneSubnetCidr: 24

# The DNS server below should have entries for resolving {internal,public,apps}.openshift.localdomain names
DnsServers:
   - 172.16.0.21

OpenShiftGlobalVariables:

    openshift_master_identity_providers:
    - name: 'htpasswd_auth'
      login: 'true'
      challenge: 'true'
      kind: 'HTPasswdPasswordIdentityProvider'
    openshift_master_htpasswd_users:
      sysadmin: '$apr1$jpBOUqeU$X4jUsMyCHOOp8TFYtPq0v1'

    #openshift_master_cluster_hostname should match the CloudNameInternal parameter
    openshift_master_cluster_hostname: internal.openshift.localdomain

    #openshift_master_cluster_public_hostname should match the CloudName parameter
    openshift_master_cluster_public_hostname: public.openshift.localdomain

    openshift_master_default_subdomain: apps.openshift.localdomain
EOF
