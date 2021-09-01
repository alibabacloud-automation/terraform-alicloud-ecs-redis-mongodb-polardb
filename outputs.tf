output "this_ecs_id" {
  value = alicloud_instance.default.id
}

output "this_redis_id" {
  value = alicloud_kvstore_instance.default.id
}

output "this_mongodb_id" {
  value = alicloud_mongodb_instance.default.id
}

output "this_polardb_cluster_id" {
  value = alicloud_polardb_cluster.default.id
}

output "this_polardb_database_id" {
  value = alicloud_polardb_database.default.id
}

output "this_ecs_name" {
  value = alicloud_instance.default.instance_name
}
