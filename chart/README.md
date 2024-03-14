# sulfoxide-iodine

![Version: 1.21.1](https://img.shields.io/badge/Version-1.21.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.18.1](https://img.shields.io/badge/AppVersion-v0.18.1-informational?style=flat-square)

Helm chart to install virtual cluster on a physical cluster

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.loft.sh | vcluster(vcluster-k8s) | v0.19.0 |
| oci://ghcr.io/atomicloud/sulfoxide.bromine | sulfoxide-bromine | 1.3.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| auth | object | `{"name":"root-token","policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteName":"PICHU_SULFOXIDE_SOS","secretKey":"DOPPLER_TOKEN","secretStore":{"kind":"ClusterSecretStore","name":"doppler"},"upsyncNamespace":"sulfoxide"}` | Root Doppler token |
| auth.name | string | `"root-token"` | name of the secret to be created |
| auth.policy.creation | string | `"Owner"` | External Secret creation policy |
| auth.policy.deletion | string | `"Retain"` | External Secret deletion policy |
| auth.refreshInterval | string | `"1h"` | external secret refresh interval |
| auth.remoteName | string | `"PICHU_SULFOXIDE_SOS"` | name of DOPPLER_TOKEN to be stored |
| auth.secretKey | string | `"DOPPLER_TOKEN"` | secret key to store DOPPLER_TOKEN |
| auth.secretStore | object | `{"kind":"ClusterSecretStore","name":"doppler"}` | Secret store to reference |
| auth.secretStore.kind | string | `"ClusterSecretStore"` | kind of the secret store to reference |
| auth.secretStore.name | string | `"doppler"` | name of the secret store to reference |
| auth.upsyncNamespace | string | `"sulfoxide"` | upsync namespace |
| etcd | object | `{"auth":{"client":{"enableAuthentication":false},"peer":{"enableAuthentication":false},"rbac":{"create":false},"token":{"enabled":false}},"commonAnnotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"},"commonLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"},"persistence":{"enabled":false},"podAnnotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"},"podLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"},"removeMemberOnContainerTermination":false,"replicaCount":3,"topologySpreadConstraints":[{"labelSelector":{"matchLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"}},"maxSkew":1,"topologyKey":"topology.kubernetes.io/zone","whenUnsatisfiable":"ScheduleAnyway"}]}` | ETCD Cluster configuration. See [etcd documentation](https://artifacthub.io/packages/helm/bitnami/etcd) |
| secretAnnotation | object | `{"argocd.argoproj.io/sync-wave":"-3"}` | Secret Annotations (External Secrets) to control synchronization |
| serviceTree | object | `{"layer":"1","platform":"sulfoxide","service":"iodine"}` | AtomiCloud Service Tree. See [ServiceTree](https://atomicloud.larksuite.com/wiki/OkfJwTXGFiMJkrk6W3RuwRrZs64?theme=DARK&contentTheme=DARK#MHw5d76uDo2tBLx86cduFQMRsBb) |
| sulfoxide-bromine | object | `{"annotations":{"argocd.argoproj.io/sync-wave":"-5"},"rootSecret":{"ref":"SULFOXIDE_IODINE"},"storeName":"doppler-iodine"}` | Create SecretStore via secret of secrets pattern |
| sulfoxide-bromine.rootSecret | object | `{"ref":"SULFOXIDE_IODINE"}` | Secret of Secrets reference |
| sulfoxide-bromine.rootSecret.ref | string | `"SULFOXIDE_IODINE"` | DOPPLER Token Reference |
| sulfoxide-bromine.storeName | string | `"doppler-iodine"` | Store name to create |
| tags | object | `{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"}` | Kubernetes labels and annotations, following Service Tree |
| vcluster | object | `{"coredns":{"podAnnotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"coredns","drop_log":"true"},"podLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"coredns"},"replicas":1,"resources":{"limits":{"cpu":"500m","memory":"512Mi"},"requests":{"cpu":"125m","memory":"128Mi"}}},"etcd":{"annotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd","drop_log":"true"},"labels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"},"podAnnotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd","drop_log":"true"},"podLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"},"resources":{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"250m","memory":"256Mi"}},"storage":{"persistence":false},"topologySpreadConstraints":[{"labelSelector":{"matchLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"}},"maxSkew":1,"topologyKey":"topology.kubernetes.io/zone","whenUnsatisfiable":"ScheduleAnyway"}]},"ingress":{"enabled":true,"host":"kubernetes.atomi.cloud","ingressClassName":"nginx"},"init":{"manifests":"apiVersion: v1\nkind: Namespace\nmetadata:\n  labels:\n    kubernetes.io/metadata.name: sulfoxide\n  name: sulfoxide\n"},"mapServices":{"fromHost":[{"from":"sulfoxide/entei-silicon-otlp-collector","to":"sulfoxide/silicon-otlp-collector"}]},"plugin":{"secret-syncer":{"image":"ghcr.io/kirinnee/vcluster-secret-syncer/secret-syncer:1.1.0","imagePullPolicy":"IfNotPresent","resources":{"limits":{"cpu":"125m","memory":"128Mi"},"requests":{"cpu":"31m","memory":"32Mi"}}}},"proxy":{"metricsServer":{"nodes":{"enabled":false},"pods":{"enabled":false}}},"replicas":1,"sync":{"configmaps":{"all":true},"ingresses":{"enabled":true},"nodes":{"enableScheduler":false,"enabled":true,"fakeKubeletIPs":true,"syncAllNodes":true,"syncNodeChanges":true},"pods":{"enabled":true,"ephemeralContainers":true,"status":true},"secrets":{"all":true}},"syncer":{"annotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"syncer","drop_log":"true"},"extraArgs":["--tls-san=https://kubernetes.atomi.cloud"],"labels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"syncer"},"podAnnotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"syncer","drop_log":"true"},"podLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"syncer"},"resources":{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"250m","memory":"512Mi"}},"topologySpreadConstraints":[{"labelSelector":{"matchLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"syncer"}},"maxSkew":1,"topologyKey":"topology.kubernetes.io/zone","whenUnsatisfiable":"ScheduleAnyway"}]},"telemetry":{"disabled":true}}` | Virtual Cluster Configuration. See [vcluster documentation](https://artifacthub.io/packages/helm/loft/vcluster) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.2](https://github.com/norwoodj/helm-docs/releases/v1.11.2)
