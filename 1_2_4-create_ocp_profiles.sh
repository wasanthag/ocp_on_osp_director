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
  "arch":"x86_64",
  "cpu":"4",
  "disk":"60",
  "mac":[
          "00:0c:29:9f:5f:05"
  ],
  "memory":"16384",
  "pm_type":"ipmi",
  "capabilities":"profile:OpenShiftMaster",
  "name": "OpenShiftMaster_1"
},
{
  "arch":"x86_64",
  "cpu":"4",
  "disk":"60",
  "mac":[
          "00:0c:29:91:b9:2d"
  ],
  "memory":"16384",
  "pm_type":"ipmi",
  "capabilities":"profile:OpenShiftWorker",
  "name": "OpenShiftWorker_1"
}
{
  "arch":"x86_64",
  "cpu":"4",
  "disk":"60",
  "mac":[
          "00:0c:29:91:b9:6a"
  ],
  "memory":"16384",
  "pm_type":"ipmi",
  "capabilities":"profile:OpenShiftInfra",
  "name": "OpenShiftInfra_1"
}
EOF
# Import and introspect the OCP nodes as your normally would for your deployment. For example:
openstack overcloud node import $DOCS_DIR/instackenv.json
openstack overcloud node introspect --all-manageable --provide
# Verify the overcloud nodes have assigned the correct profile:
openstack overcloud profiles list
