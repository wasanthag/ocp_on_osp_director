#! /usr/bin/env bash
# Generate a containers-prepare-parameter.yaml file
openstack tripleo container image prepare default --local-push-destination --output-env-file $DOCS_DIR/containers-prepare-parameter.yaml
# For example, edit /home/stack/containers-prepare-parameter.yaml and add the following settings. Adapt these settings to suit your deployment
cat << EOF > $DOCS_DIR/containers-prepare-parameter.yaml
parameter_defaults:
  ContainerImagePrepare:
  - push_destination: true
    set:
      ceph_image: rhceph-3-rhel7
      ceph_namespace: registry.access.redhat.com/rhceph
      ceph_tag: latest
      name_prefix: openstack-
      name_suffix: ''
      namespace: registry.access.redhat.com/rhosp14
      neutron_driver: null
      openshift_cluster_monitoring_image: ose-cluster-monitoring-operator
      openshift_cluster_monitoring_namespace: registry.access.redhat.com/openshift3
      openshift_cluster_monitoring_tag: v3.11
      openshift_cockpit_image: registry-console
      openshift_cockpit_namespace: registry.access.redhat.com/openshift3
      openshift_cockpit_tag: v3.11
      openshift_configmap_reload_image: ose-configmap-reloader
      openshift_configmap_reload_namespace: registry.access.redhat.com/openshift3
      openshift_configmap_reload_tag: v3.11
      openshift_etcd_image: etcd
      openshift_etcd_namespace: registry.access.redhat.com/rhel7
      openshift_etcd_tag: latest
      openshift_gluster_block_image: rhgs-gluster-block-prov-rhel7
      openshift_gluster_image: rhgs-server-rhel7
      openshift_gluster_namespace: registry.access.redhat.com/rhgs3
      openshift_gluster_tag: latest
      openshift_grafana_namespace: registry.access.redhat.com/openshift3
      openshift_grafana_tag: v3.11
      openshift_heketi_image: rhgs-volmanager-rhel7
      openshift_heketi_namespace: registry.access.redhat.com/rhgs3
      openshift_kube_rbac_proxy_image: ose-kube-rbac-proxy
      openshift_kube_rbac_proxy_namespace: registry.access.redhat.com/openshift3
      openshift_kube_rbac_proxy_tag: v3.11
      openshift_kube_state_metrics_image: ose-kube-state-metrics
      openshift_kube_state_metrics_namespace: registry.access.redhat.com/openshift3
      openshift_kube_state_metrics_tag: v3.11
      openshift_namespace: registry.access.redhat.com/openshift3
      openshift_oauth_proxy_tag: v3.11
      openshift_prefix: ose
      openshift_prometheus_alertmanager_tag: v3.11
      openshift_prometheus_config_reload_image: ose-prometheus-config-reloader
      openshift_prometheus_config_reload_namespace: registry.access.redhat.com/openshift3
      openshift_prometheus_config_reload_tag: v3.11
      openshift_prometheus_node_exporter_tag: v3.11
      openshift_prometheus_operator_image: ose-prometheus-operator
      openshift_prometheus_operator_namespace: registry.access.redhat.com/openshift3
      openshift_prometheus_operator_tag: v3.11
      openshift_prometheus_tag: v3.11
      openshift_tag: v3.11
      tag: latest
    tag_from_label: '{version}-{release}'
EOF
