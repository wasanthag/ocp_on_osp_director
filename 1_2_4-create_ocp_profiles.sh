#!/usr/bin/env bash
# Create a flavor for each OCP role. Adjust this values to suit your requirements:
openstack flavor create --id auto --ram 4096 --disk 40 --vcpus 1 --swap 500 m1.OpenShiftMaster
openstack flavor create --id auto --ram 4096 --disk 40 --vcpus 1 --swap 500 m1.OpenShiftWorker
openstack flavor create --id auto --ram 4096 --disk 40 --vcpus 1 --swap 500 m1.OpenShiftInfra
# Map the flavors to the required profile:
openstack flavor set --property "capabilities:profile"="OpenShiftMaster" --property "capabilities:boot_option"="local" m1.OpenShiftMaster
openstack flavor set --property "capabilities:profile"="OpenShiftWorker" --property "capabilities:boot_option"="local" m1.OpenShiftWorker
openstack flavor set --property "capabilities:profile"="OpenShiftInfra" --property "capabilities:boot_option"="local" m1.OpenShiftInfra
# Add your nodes to instackenv.json. You must define them to use the capabilities field.
cat << EOF > $DOCS_DIR/instackenv.json
{
  "nodes": [
    {
      "pm_user": "admin",
      "mac": [
        "52:54:00:3f:12:6f"
      ],
      "pm_type": "pxe_ipmitool",
      "pm_password": "redhat",
      "pm_addr": "192.168.1.7",
      "capabilities":"profile:OpenShiftMaster",
      "name": "OpenShiftMaster_1"
    },
    {
      "pm_user": "admin",
      "mac": [
        "52:54:00:0b:11:fa"
      ],
      "pm_type": "pxe_ipmitool",
      "pm_password": "redhat",
      "pm_addr": "192.168.1.8",
      "capabilities":"profile:OpenShiftMaster",
      "name": "OpenShiftMaster_2"
    },
    {
      "pm_user": "admin",
      "mac": [
        "52:54:00:d0:4e:0a"
      ],
      "pm_type": "pxe_ipmitool",
      "pm_password": "redhat",
      "pm_addr": "192.168.1.9",
      "capabilities":"profile:OpenShiftMaster",
      "name": "OpenShiftMaster_3"
    },
    {
      "pm_user": "admin",
      "mac": [
        "52:54:00:72:90:34"
      ],
      "pm_type": "pxe_ipmitool",
      "pm_password": "redhat",
      "pm_addr": "192.168.1.5",
      "capabilities":"profile:OpenShiftWorker",
      "name": "OpenShiftWorker_1"
    },
    {
      "pm_user": "admin",
      "mac": [
        "52:54:00:3c:6a:79"
      ],
      "pm_type": "pxe_ipmitool",
      "pm_password": "redhat",
      "pm_addr": "192.168.1.6",
      "capabilities":"profile:OpenShiftWorker",
      "name": "OpenShiftWorker_2"
    },
    {
      "pm_user": "admin",
      "mac": [
        "52:54:00:d4:08:38"
      ],
      "pm_type": "pxe_ipmitool",
      "pm_password": "redhat",
      "pm_addr": "192.168.1.1",
      "capabilities":"profile:OpenShiftInfra",
      "name": "OpenShiftInfra_1"
    },
    {
      "pm_user": "admin",
      "mac": [
        "52:54:00:0d:aa:e4"
      ],
      "pm_type": "pxe_ipmitool",
      "pm_password": "redhat",
      "pm_addr": "192.168.1.2",
      "capabilities":"profile:OpenShiftInfra",
      "name": "OpenShiftInfra_2"
    },
    {
      "pm_user": "admin",
      "mac": [
        "52:54:00:ef:b7:f7"
      ],
      "pm_type": "pxe_ipmitool",
      "pm_password": "redhat",
      "pm_addr": "192.168.1.3",
      "capabilities":"profile:OpenShiftInfra",
      "name": "OpenShiftInfra_3"
    }
  ]
}
EOF
# Import and introspect the OCP nodes as your normally would for your deployment. For example:
openstack overcloud node import $DOCS_DIR/instackenv.json
openstack overcloud node introspect --all-manageable --provide
# Verify the overcloud nodes have assigned the correct profile:
openstack overcloud profiles list
