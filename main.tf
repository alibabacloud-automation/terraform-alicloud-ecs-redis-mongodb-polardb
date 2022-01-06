resource "alicloud_instance" "default" {
  availability_zone          = var.availability_zone
  instance_name              = var.name
  security_groups            = var.security_group_ids
  vswitch_id                 = var.vswitch_id
  instance_type              = var.instance_type
  system_disk_category       = var.system_disk_category
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = var.image_id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  data_disks {
    name        = var.data_disks_name
    size        = var.ecs_size
    category    = var.category
    description = var.description
    encrypted   = var.encrypted
  }
}

resource "alicloud_kvstore_instance" "default" {
  vswitch_id       = var.vswitch_id
  zone_id          = var.availability_zone
  db_instance_name = var.name
  security_ips     = var.security_ips
  instance_type    = var.redis_instance_type
  engine_version   = var.redis_engine_version
  config = {
    appendonly = var.redis_appendonly, lazyfree-lazy-eviction = var.redis_lazyfree_lazy_eviction,
  }
  resource_group_id = var.redis_resource_group_id
  instance_class    = var.redis_instance_class
}

resource "alicloud_mongodb_instance" "default" {
  vswitch_id          = var.vswitch_id
  security_ip_list    = var.security_ips
  engine_version      = var.mongodb_engine_version
  db_instance_class   = var.db_instance_class
  db_instance_storage = var.db_instance_storage
}

resource "alicloud_polardb_cluster" "default" {
  vswitch_id    = var.vswitch_id
  db_type       = var.db_type
  db_version    = var.db_version
  pay_type      = var.pay_type
  db_node_class = var.db_node_class
  description   = var.polardb_cluster_description
}

resource "alicloud_polardb_database" "default" {
  db_cluster_id = alicloud_polardb_cluster.default.id
  db_name       = var.db_name
}
