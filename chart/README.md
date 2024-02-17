# sulfoxide-iodine

![Version: 1.16.3](https://img.shields.io/badge/Version-1.16.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.18.1](https://img.shields.io/badge/AppVersion-v0.18.1-informational?style=flat-square)

Helm chart to install virtual cluster on a physical cluster

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.loft.sh | vcluster | v0.18.1 |
| oci://ghcr.io/atomicloud/sulfoxide.bromine | sulfoxide-bromine | 1.3.0 |
| oci://registry-1.docker.io/bitnamicharts | etcd | 9.10.5 |

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
| datastore | object | `{"enable":true,"name":"datastore-endpoint","policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteName":"PICHU_OPAL_K3S_DATASTORE_ENDPOINT","secretKey":"K3S_DATASTORE_ENDPOINT","secretStore":{"kind":"SecretStore","name":"doppler-iodine"}}` | K3S state (postgresql) auth |
| datastore.enable | bool | `true` | Attempt to obtain datastore's connection string |
| datastore.name | string | `"datastore-endpoint"` | name of the secret to be created |
| datastore.policy.creation | string | `"Owner"` | External Secret creation policy |
| datastore.policy.deletion | string | `"Retain"` | External Secret deletion policy |
| datastore.refreshInterval | string | `"1h"` | external secret refresh interval |
| datastore.remoteName | string | `"PICHU_OPAL_K3S_DATASTORE_ENDPOINT"` | name of the remote secret name |
| datastore.secretKey | string | `"K3S_DATASTORE_ENDPOINT"` | secret key to store the connection string secret |
| datastore.secretStore | object | `{"kind":"SecretStore","name":"doppler-iodine"}` | Secret store to reference |
| datastore.secretStore.kind | string | `"SecretStore"` | kind of the secret store to reference |
| datastore.secretStore.name | string | `"doppler-iodine"` | name of the secret store to reference |
| datastoreCa | object | `{"enable":true,"name":"datastore-ca","policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteName":"PICHU_OPAL_K3S_DATASTORE_CA","secretKey":"K3S_DATASTORE_CAFILE","secretStore":{"kind":"SecretStore","name":"doppler-iodine"}}` | K3S state (postgresql) Certificate Authority |
| datastoreCa.enable | bool | `true` | Attempt to obtain datastore's certificate authority |
| datastoreCa.name | string | `"datastore-ca"` | name of the secret to be created |
| datastoreCa.policy.creation | string | `"Owner"` | External Secret creation policy |
| datastoreCa.policy.deletion | string | `"Retain"` | External Secret deletion policy |
| datastoreCa.refreshInterval | string | `"1h"` | external secret refresh interval |
| datastoreCa.remoteName | string | `"PICHU_OPAL_K3S_DATASTORE_CA"` | name of the remote secret name |
| datastoreCa.secretKey | string | `"K3S_DATASTORE_CAFILE"` | secret key to store the certificate authority |
| datastoreCa.secretStore | object | `{"kind":"SecretStore","name":"doppler-iodine"}` | Secret store to reference |
| datastoreCa.secretStore.kind | string | `"SecretStore"` | kind of the secret store to reference |
| datastoreCa.secretStore.name | string | `"doppler-iodine"` | name of the secret store to reference |
| etcd | object | `{"commonAnnotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"},"commonLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"},"persistence":{"enabled":false},"podAnnotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"},"podLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"},"replicaCount":6,"topologySpreadConstraints":[{"labelSelector":{"matchLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"etcd"}},"maxSkew":1,"topologyKey":"topology.kubernetes.io/zone","whenUnsatisfiable":"ScheduleAnyway"}]}` | ETCD Cluster configuration. See [etcd documentation](https://artifacthub.io/packages/helm/bitnami/etcd) |
| k3sSyncToken | object | `{"name":"k3s-sync-token","policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteName":"PIKACHU_K3S_TOKEN","secretKey":"K3S_TOKEN","secretStore":{"kind":"SecretStore","name":"doppler-iodine"}}` | K3S sync token |
| k3sSyncToken.name | string | `"k3s-sync-token"` | name of the secret to be created |
| k3sSyncToken.policy.creation | string | `"Owner"` | External Secret creation policy |
| k3sSyncToken.policy.deletion | string | `"Retain"` | External Secret deletion policy |
| k3sSyncToken.refreshInterval | string | `"1h"` | external secret refresh interval |
| k3sSyncToken.remoteName | string | `"PIKACHU_K3S_TOKEN"` | name of the remote secret name |
| k3sSyncToken.secretKey | string | `"K3S_TOKEN"` | secret key to store the connection string secret |
| k3sSyncToken.secretStore | object | `{"kind":"SecretStore","name":"doppler-iodine"}` | Secret store to reference |
| k3sSyncToken.secretStore.kind | string | `"SecretStore"` | kind of the secret store to reference |
| k3sSyncToken.secretStore.name | string | `"doppler-iodine"` | name of the secret store to reference |
| secretAnnotation | object | `{"argocd.argoproj.io/sync-wave":"-3"}` | Secret Annotations (External Secrets) to control synchronization |
| serviceTree | object | `{"layer":"1","platform":"sulfoxide","service":"iodine"}` | AtomiCloud Service Tree. See [ServiceTree](https://atomicloud.larksuite.com/wiki/OkfJwTXGFiMJkrk6W3RuwRrZs64?theme=DARK&contentTheme=DARK#MHw5d76uDo2tBLx86cduFQMRsBb) |
| sulfoxide-bromine | object | `{"annotations":{"argocd.argoproj.io/sync-wave":"-5"},"rootSecret":{"ref":"SULFOXIDE_IODINE"},"storeName":"doppler-iodine"}` | Create SecretStore via secret of secrets pattern |
| sulfoxide-bromine.rootSecret | object | `{"ref":"SULFOXIDE_IODINE"}` | Secret of Secrets reference |
| sulfoxide-bromine.rootSecret.ref | string | `"SULFOXIDE_IODINE"` | DOPPLER Token Reference |
| sulfoxide-bromine.storeName | string | `"doppler-iodine"` | Store name to create |
| tags | object | `{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"}` | Kubernetes labels and annotations, following Service Tree |
| vcluster | object | `{"annotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"apiserver"},"coredns":{"replicas":1},"enableHA":true,"ingress":{"enabled":true,"host":"kubernetes.atomi.cloud","ingressClassName":"nginx"},"init":{"manifests":"apiVersion: v1\nkind: Namespace\nmetadata:\n  labels:\n    kubernetes.io/metadata.name: sulfoxide\n  name: sulfoxide\n"},"labels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"apiserver"},"mapServices":{"fromHost":[{"from":"sulfoxide/entei-silicon-otlp-collector","to":"sulfoxide/silicon-otlp-collector"}]},"plugin":{"secret-syncer":{"image":"ghcr.io/kirinnee/vcluster-secret-syncer/secret-syncer-amd:1.0.0","imagePullPolicy":"IfNotPresent"}},"podAnnotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"apiserver"},"podLabels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"},"atomi.cloud/module":"apiserver"},"proxy":{"metricsServer":{"nodes":{"enabled":false},"pods":{"enabled":false}}},"replicas":1,"serverToken":{"secretKeyRef":{"key":"K3S_TOKEN","name":"k3s-sync-token"}},"storage":{"persistence":false},"sync":{"configmaps":{"all":true},"ingresses":{"enabled":true},"nodes":{"enableScheduler":true,"enabled":true,"fakeKubeletIPs":true,"syncAllNodes":true,"syncNodeChanges":true},"pods":{"enabled":true,"ephemeralContainers":true,"status":true},"secrets":{"all":true}},"syncer":{"extraArgs":["--tls-san=https://kubernetes.atomi.cloud"]},"telemetry":{"disabled":true}}` | Virtual Cluster Configuration. See [vcluster documentation](https://artifacthub.io/packages/helm/loft/vcluster) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.1](https://github.com/norwoodj/helm-docs/releases/v1.11.1)