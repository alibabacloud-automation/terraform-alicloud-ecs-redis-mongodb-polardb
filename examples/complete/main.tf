data "alicloud_resource_manager_resource_groups" "default" {
}

data "alicloud_polardb_zones" "default" {
}

data "alicloud_images" "default" {
  name_regex = "^centos_6"
}

data "alicloud_instance_types" "default" {
  availability_zone = data.alicloud_polardb_zones.default.zones.0.id
}

data "alicloud_kvstore_instance_classes" "default" {
  zone_id        = data.alicloud_polardb_zones.default.zones.0.id
  engine         = "Redis"
  engine_version = var.redis_engine_version
}

data "alicloud_polardb_node_classes" "default" {
  pay_type   = var.pay_type
  db_type    = "MySQL"
  db_version = "5.6"
  zone_id    = data.alicloud_polardb_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = module.vpc.this_vpc_id
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_name           = var.name
  vpc_cidr           = "172.16.0.0/16"
  vswitch_name       = var.name
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_polardb_zones.default.zones.0.id]
}

module "example" {
  source             = "../.."
  name               = var.name
  vswitch_id         = module.vpc.this_vswitch_ids[0]
  availability_zone  = data.alicloud_polardb_zones.default.zones.0.id
  security_group_ids = [alicloud_security_group.default.id]

  #alicloud_instance
  instance_type              = data.alicloud_instance_types.default.instance_types.0.id
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = data.alicloud_images.default.images.0.id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  data_disks_name            = "data_disks_name"
  ecs_size                   = 1200
  category                   = "cloud_efficiency"
  description                = "tf-test-ecs-redis-mongodb-polardb-description"
  encrypted                  = true

  #alicloud_kvstore_instance
  security_ips                 = var.security_ips
  redis_instance_type          = "Redis"
  redis_engine_version         = var.redis_engine_version
  redis_appendonly             = var.redis_appendonly
  redis_lazyfree_lazy_eviction = var.redis_lazyfree_lazy_eviction
  redis_resource_group_id      = data.alicloud_resource_manager_resource_groups.default.ids.0
  redis_instance_class         = data.alicloud_kvstore_instance_classes.default.instance_classes.0

  #alicloud_mongodb_instance
  mongodb_engine_version = "4.2"
  db_instance_class      = var.db_instance_class
  db_instance_storage    = var.db_instance_storage

  #alicloud_polardb_cluster
  db_type                     = "MySQL"
  db_version                  = "5.6"
  pay_type                    = var.pay_type
  db_node_class               = data.alicloud_polardb_node_classes.default.classes.0.supported_engines.0.available_resources.0.db_node_class
  polardb_cluster_description = var.polardb_cluster_description

  #alicloud_polardb_database
  db_name = "tf-db-name"

}