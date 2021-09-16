Alicloud ECS&Redis&MongoDB&PolarDB Terraform Module On Alibaba Cloud

terraform-alicloud-ecs-redis-mongodb-polardb
---

English | [简体中文](README-CN.md)

This module is used to create a lightweight web service under Alibaba Cloud VPC, including ECs, Redis and RDS.

These types of resources are supported:

* [alicloud_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/instance)
* [alicloud_kvstore_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/kvstore_instance)
* [alicloud_mongodb_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/mongodb_instance)
* [alicloud_polardb_cluster](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_cluster)
* [alicloud_polardb_database](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/polardb_database)

## Usage

```hcl
module "example" {
  source                 = "terraform-alicloud-modules/ecs-redis-mongodb-polardb/alicloud"
  name                   = "ecs-redis-mongodb-polardb"
  instance_type          = "ecs.n4.large"
  redis_instance_class   = "redis.master.large.default"
  mongodb_engine_version = "3.4"
  db_instance_class      = "dds.mongo.mid"
  db_version             = "8.0"
  db_node_class          = "polar.mysql.x4.large"
}
```

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.66.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.66.0 |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
