## Security & Compliance [<img src="https://cloudposse.com/wp-content/uploads/2020/11/bridgecrew.svg" width="250" align="right" />](https://bridgecrew.io/)

Security scanning is graciously provided by Bridgecrew. Bridgecrew is the leading fully hosted, cloud-native solution providing continuous Terraform security and compliance.

| Benchmark | Description |
|--------|---------------|
| [![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-route53-cluster-hostname/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-route53-cluster-hostname&benchmark=INFRASTRUCTURE+SECURITY) | Infrastructure Security Compliance |
| [![CIS KUBERNETES](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-route53-cluster-hostname/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-route53-cluster-hostname&benchmark=CIS+KUBERNETES+V1.5) | Center for Internet Security, KUBERNETES Compliance |
| [![CIS AWS](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-route53-cluster-hostname/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-route53-cluster-hostname&benchmark=CIS+AWS+V1.2) | Center for Internet Security, AWS Compliance |
| [![CIS AZURE](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-route53-cluster-hostname/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-route53-cluster-hostname&benchmark=CIS+AZURE+V1.1) | Center for Internet Security, AZURE Compliance |
| [![PCI-DSS](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-route53-cluster-hostname/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-route53-cluster-hostname&benchmark=PCI-DSS+V3.2) | Payment Card Industry Data Security Standards Compliance |
| [![NIST-800-53](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-route53-cluster-hostname/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-route53-cluster-hostname&benchmark=NIST-800-53) | National Institute of Standards and Technology Compliance |
| [![ISO27001](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-route53-cluster-hostname/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-route53-cluster-hostname&benchmark=ISO27001) | Information Security Management System, ISO/IEC 27001 Compliance |
| [![SOC2](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-route53-cluster-hostname/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-route53-cluster-hostname&benchmark=SOC2)| Service Organization Control 2 Compliance |
| [![CIS GCP](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-route53-cluster-hostname/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-route53-cluster-hostname&benchmark=CIS+GCP+V1.1) | Center for Internet Security, GCP Compliance |
| [![HIPAA](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-route53-cluster-hostname/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-route53-cluster-hostname&benchmark=HIPAA) | Health Insurance Portability and Accountability Compliance |


## Usage


**IMPORTANT:** The `master` branch is used in `source` just as an example. In your code, do not pin to `master` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`) of one of our [latest releases](https://github.com/cloudposse/terraform-aws-cloudwatch-flow-logs/releases).


```terraform
module "flow_logs" {
  source    = "git::https://github.com/cloudposse/terraform-aws-cloudwatch-flow-logs.git?ref=master"
  vpc_id    = "${var.vpc_id}"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `policy` or `role`) | list | `<list>` | no |
| delimiter | Delimiter to be used between `name`, `namespace`, `stage`, etc. | string | `-` | no |
| enabled | Set to false to prevent the module from creating anything | string | `true` | no |
| encryption_type | GUID for the customer-managed KMS key to use for encryption. The only acceptable values are NONE or KMS | string | `NONE` | no |
| eni_ids | IDs of ENIs | list | `<list>` | no |
| filter_pattern | Valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events | string | `[version, account, eni, source, destination, srcport, destport, protocol, packets, bytes, windowstart, windowend, action, flowlogstatus]` | no |
| kms_key_id | ID of KMS key | string | `` | no |
| name | Name  (e.g. `bastion` or `db`) | string | `` | no |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| region | AWS region | string | `` | no |
| retention_in_days | Number of days you want to retain log events in the log group | string | `30` | no |
| retention_period | Length of time data records are accessible after they are added to the stream | string | `48` | no |
| shard_count | Number of shards that the stream will use | string | `1` | no |
| shard_level_metrics | List of shard-level CloudWatch metrics which can be enabled for the stream | list | `<list>` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| subnet_ids | IDs of subnets | list | `<list>` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map | `<map>` | no |
| traffic_type | Type of traffic to capture. Valid values: ACCEPT,REJECT, ALL | string | `ALL` | no |
| vpc_id | ID of VPC | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| eni_flow_ids | Flow Log IDs of ENIs |
| kinesis_arn | Kinesis Stream ARN |
| kinesis_id | Kinesis Stream ID |
| kinesis_name | Kinesis Stream name |
| kinesis_shard_count | Kinesis Stream Shard count |
| log_group_arn | ARN of the log group |
| subnet_flow_ids | Flow Log IDs of subnets |
| vpc_flow_id | VPC Flow Log ID |


