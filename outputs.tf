output "this_ecs_id" {
  description = "The ID of the ECS instance."
  value       = alicloud_instance.default.id
}

output "this_redis_id" {
  description = "The ID of the Redis instance."
  value       = alicloud_kvstore_instance.default.id
}

output "this_mongodb_id" {
  description = "The ID of the MongoDB instance."
  value       = alicloud_mongodb_instance.default.id
}

output "this_polardb_cluster_id" {
  description = "The ID of the PolarDB cluster."
  value       = alicloud_polardb_cluster.default.id
}

output "this_polardb_database_id" {
  description = "The ID of the PolarDB database."
  value       = alicloud_polardb_database.default.id
}

output "this_ecs_name" {
  description = "The name of the ECS instance."
  value       = alicloud_instance.default.instance_name
}
