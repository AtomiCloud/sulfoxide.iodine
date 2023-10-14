# sulfoxide-iodine

![Version: 1.5.1](https://img.shields.io/badge/Version-1.5.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.16.3](https://img.shields.io/badge/AppVersion-v0.16.3-informational?style=flat-square)

Helm chart to install virtual cluster on a physical cluster

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.loft.sh | vcluster | v0.16.3 |
| oci://ghcr.io/atomicloud/sulfoxide.bromine | sulfoxide-bromine | 1.1.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| auth | object | `{"name":"pichu-root-token","policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteName":"PICHU_SULFOXIDE_SOS","secretKey":"DOPPLER_TOKEN","secretStore":{"kind":"ClusterSecretStore","name":"doppler"},"upsyncNamespace":"default"}` | Root Doppler token |
| auth.name | string | `"pichu-root-token"` | name of the secret to be created |
| auth.policy.creation | string | `"Owner"` | External Secret creation policy |
| auth.policy.deletion | string | `"Retain"` | External Secret deletion policy |
| auth.refreshInterval | string | `"1h"` | external secret refresh interval |
| auth.remoteName | string | `"PICHU_SULFOXIDE_SOS"` | name of DOPPLER_TOKEN to be stored |
| auth.secretKey | string | `"DOPPLER_TOKEN"` | secret key to store DOPPLER_TOKEN |
| auth.secretStore | object | `{"kind":"ClusterSecretStore","name":"doppler"}` | Secret store to reference |
| auth.secretStore.kind | string | `"ClusterSecretStore"` | kind of the secret store to reference |
| auth.secretStore.name | string | `"doppler"` | name of the secret store to reference |
| auth.upsyncNamespace | string | `"default"` | upsync namespace |
| datastore | object | `{"name":"pichu-root-token","policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteName":"PICHU_K3S_DATASTORE_ENDPOINT","secretKey":"K3S_DATASTORE_ENDPOINT","secretStore":{"kind":"SecretStore","name":"doppler-iodine"}}` | K3S state (postgresql) auth |
| datastore.name | string | `"pichu-root-token"` | name of the secret to be created |
| datastore.policy.creation | string | `"Owner"` | External Secret creation policy |
| datastore.policy.deletion | string | `"Retain"` | External Secret deletion policy |
| datastore.refreshInterval | string | `"1h"` | external secret refresh interval |
| datastore.remoteName | string | `"PICHU_K3S_DATASTORE_ENDPOINT"` | name of the remote secret name |
| datastore.secretKey | string | `"K3S_DATASTORE_ENDPOINT"` | secret key to store the connection string secret |
| datastore.secretStore | object | `{"kind":"SecretStore","name":"doppler-iodine"}` | Secret store to reference |
| datastore.secretStore.kind | string | `"SecretStore"` | kind of the secret store to reference |
| datastore.secretStore.name | string | `"doppler-iodine"` | name of the secret store to reference |
| serviceTree | object | `{"layer":"1","platform":"sulfoxide","service":"iodine"}` | AtomiCloud Service Tree. See [ServiceTree](https://atomicloud.larksuite.com/wiki/OkfJwTXGFiMJkrk6W3RuwRrZs64?theme=DARK&contentTheme=DARK#MHw5d76uDo2tBLx86cduFQMRsBb) |
| sulfoxide-bromine | object | `{"rootSecret":{"ref":"SULFOXIDE_IODINE"},"storeName":"doppler-boron"}` | Create SecretStore via secret of secrets pattern |
| sulfoxide-bromine.rootSecret | object | `{"ref":"SULFOXIDE_IODINE"}` | Secret of Secrets reference |
| sulfoxide-bromine.rootSecret.ref | string | `"SULFOXIDE_IODINE"` | DOPPLER Token Reference |
| sulfoxide-bromine.storeName | string | `"doppler-boron"` | Store name to create |
| tags | object | `{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"}` | Kubernetes labels and annotations, following Service Tree |
| vcluster | object | `{"annotations":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"}},"coredns":{"replicas":3},"enableHA":true,"ingress":{"enabled":true,"host":"kubernetes.atomi.cloud","ingressClassName":"nginx"},"init":{"manifests":"apiVersion: v1\nkind: Namespace\nmetadata:\n  labels:\n    kubernetes.io/metadata.name: sulfoxide\n  name: sulfoxide\n"},"labels":{"<<":{"atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"iodine"}},"plugin":{"secret-syncer":{"image":"ghcr.io/kirinnee/vcluster-secret-syncer/secret-syncer-amd:1.0.0","imagePullPolicy":"IfNotPresent"}},"proxy":{"metricsServer":{"nodes":{"enabled":true},"pods":{"enabled":true}}},"replicas":3,"storage":{"persistence":false},"sync":{"configmaps":{"all":true},"ingresses":{"enabled":true},"nodes":{"enableScheduler":true,"enabled":true,"fakeKubeletIPs":true,"syncAllNodes":true,"syncNodeChanges":true},"pods":{"enabled":true,"ephemeralContainers":true,"status":true},"secrets":{"all":true}},"syncer":{"extraArgs":["--tls-san=https://kubernetes.atomi.cloud"]},"telemetry":{"disabled":true},"vcluster":{"env":[{"name":"K3S_DATASTORE_ENDPOINT","valueFrom":{"secretKeyRef":{"key":"K3S_DATASTORE_ENDPOINT","name":"pichu-root-token"}}}]}}` | Virtual Cluster Configuration. See [vcluster documentation](https://artifacthub.io/packages/helm/loft/vcluster) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.1](https://github.com/norwoodj/helm-docs/releases/v1.11.1)