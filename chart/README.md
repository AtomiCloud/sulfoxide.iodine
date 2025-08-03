# sulfoxide-iodine

![Version: 1.31.0](https://img.shields.io/badge/Version-1.31.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.26.10](https://img.shields.io/badge/AppVersion-v0.26.10-informational?style=flat-square)

Helm chart to install virtual cluster on a physical cluster

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.loft.sh | vcluster(vcluster) | v0.26.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| auth | object | `{"clientId":{"remoteName":"PICHU_SULFOXIDE_SOS_CLIENT_ID","secretKey":"CLIENT_ID"},"clientSecret":{"remoteName":"PICHU_SULFOXIDE_SOS_CLIENT_SECRET","secretKey":"CLIENT_SECRET"},"name":"root-token","policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1m","secretStore":{"kind":"ClusterSecretStore","name":"infisical"},"upsyncNamespace":"sulfoxide"}` | Root Infisical token |
| auth.clientId | object | `{"remoteName":"PICHU_SULFOXIDE_SOS_CLIENT_ID","secretKey":"CLIENT_ID"}` | Upsync secret of secrets reference for client ID |
| auth.clientId.remoteName | string | `"PICHU_SULFOXIDE_SOS_CLIENT_ID"` | remote reference of the CLIENT_ID in the secret of secrets store |
| auth.clientId.secretKey | string | `"CLIENT_ID"` | secret key to store CLIENT_ID |
| auth.clientSecret | object | `{"remoteName":"PICHU_SULFOXIDE_SOS_CLIENT_SECRET","secretKey":"CLIENT_SECRET"}` | Upsync secret of secrets reference for client secret |
| auth.clientSecret.remoteName | string | `"PICHU_SULFOXIDE_SOS_CLIENT_SECRET"` | remote reference of the CLIENT_SECRET in the secret of secrets store |
| auth.clientSecret.secretKey | string | `"CLIENT_SECRET"` | secret key to store CLIENT_SECRET |
| auth.name | string | `"root-token"` | name of the secret to be created |
| auth.policy.creation | string | `"Owner"` | External Secret creation policy |
| auth.policy.deletion | string | `"Retain"` | External Secret deletion policy |
| auth.refreshInterval | string | `"1m"` | external secret refresh interval |
| auth.secretStore | object | `{"kind":"ClusterSecretStore","name":"infisical"}` | Secret store to reference |
| auth.secretStore.kind | string | `"ClusterSecretStore"` | kind of the secret store to reference |
| auth.secretStore.name | string | `"infisical"` | name of the secret store to reference |
| auth.upsyncNamespace | string | `"sulfoxide"` | upsync namespace |
| secretAnnotation | object | `{"argocd.argoproj.io/sync-wave":"-3"}` | Secret Annotations (External Secrets) to control synchronization |
| serviceTree | object | `{"layer":"1","platform":"sulfoxide","service":"iodine"}` | AtomiCloud Service Tree. See [ServiceTree](https://atomicloud.larksuite.com/wiki/OkfJwTXGFiMJkrk6W3RuwRrZs64?theme=DARK&contentTheme=DARK#MHw5d76uDo2tBLx86cduFQMRsBb) |
| tags | object | `{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"}` | Kubernetes labels and annotations, following Service Tree |
| vcluster | object | `{"controlPlane":{"backingStore":{"etcd":{"deploy":{"enabled":true,"statefulSet":{"annotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd","drop_log":"true"},"labels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"},"persistence":{"volumeClaim":{"enabled":false}},"pods":{"annotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd","drop_log":"true"},"labels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd","drop_log":"true"}},"resources":{"limits":{"cpu":"1000m","memory":"1.5Gi"},"requests":{"cpu":"500m","memory":"512Mi"}},"scheduling":{"affinity":{"podAntiAffinity":{"preferredDuringSchedulingIgnoredDuringExecution":[]}},"topologySpreadConstraints":[{"labelSelector":{"matchLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"}},"maxSkew":1,"topologyKey":"topology.kubernetes.io/zone","whenUnsatisfiable":"ScheduleAnyway"}]}}}}},"coredns":{"deployment":{"annotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"coredns","drop_log":"true"},"labels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"coredns","drop_log":"true"},"pods":{"annotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"coredns","drop_log":"true"},"labels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"coredns"}},"replicas":1},"enabled":true},"distro":{"k8s":{"enabled":true}},"ingress":{"enabled":true,"host":"kubernetes.atomi.cloud","spec":{"ingressClassName":"nginx"}},"proxy":{"extraSANs":["https://kubernetes.atomi.cloud"]},"statefulSet":{"annotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"syncer"},"highAvailability":{"replicas":1},"labels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"syncer"},"pods":{"annotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"syncer"},"labels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"syncer"}},"resources":{"limits":{"cpu":"1000m","ephemeral-storage":"8Gi","memory":"2Gi"},"requests":{"cpu":"200m","ephemeral-storage":"400Mi","memory":"256Mi"}},"scheduling":{"podManagementPolicy":"OrderedReady"}}},"experimental":{"deploy":{"vcluster":{"manifests":"apiVersion: v1\nkind: Namespace\nmetadata:\n  labels:\n    kubernetes.io/metadata.name: sulfoxide\n  name: sulfoxide\n"}}},"integrations":{"metricsServer":{"enabled":true,"nodes":false,"pods":false}},"networking":{"replicateServices":{"fromHost":[{"from":"sulfoxide/entei-silicon-otlp-collector","to":"sulfoxide/silicon-otlp-collector"}]}},"plugin":{"secret-syncer":{"image":"ghcr.io/kirinnee/vcluster-secret-syncer/secret-syncer:1.1.0","imagePullPolicy":"IfNotPresent","resources":{"limits":{"cpu":"125m","memory":"128Mi"},"requests":{"cpu":"31m","memory":"32Mi"}}}},"sync":{"fromHost":{"ingressClasses":{"enabled":true},"nodes":{"enabled":true,"selector":{"all":true},"syncBackChanges":true}},"toHost":{"configMaps":{"all":true},"ingresses":{"enabled":true},"secrets":{"all":true}}},"telemetry":{"enabled":false}}` | Virtual Cluster Configuration. See [vcluster documentation](https://artifacthub.io/packages/helm/loft/vcluster) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
