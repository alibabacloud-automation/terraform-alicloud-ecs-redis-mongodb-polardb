output "this_vpc_id" {
  value = alicloud_vpc.default.id
}

output "this_vswitch_id" {
  value = alicloud_vswitch.default.id
}

output "this_security_group_id" {
  value = alicloud_security_group.default.id
}

output "this_ecs_id" {
  value = alicloud_instance.default.id
}

output "this_redis_id" {
  value = alicloud_kvstore_instance.default.id
}

output "this_zone_id" {
  value = data.alicloud_zones.default.zones[0].id
}

output "this_ecs_name" {
  value = alicloud_instance.default.instance_name
}

output "this_ecs_instance_type" {
  value = alicloud_instance.default.instance_type
}

output "this_redis_instance_type" {
  value = alicloud_kvstore_instance.default.instance_type
}

output "this_mongodb_instance_class" {
  value = alicloud_mongodb_instance.default.db_instance_class
}

output "this_polardb_version" {
  value = alicloud_polardb_cluster.default.db_version
}