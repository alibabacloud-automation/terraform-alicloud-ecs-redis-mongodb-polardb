#alicloud_instance
name                       = "update-tf-test-ecs-redis-mongodb-polardb"
system_disk_name           = "test_system_disk"
system_disk_description    = "test_system_disk_description"
internet_max_bandwidth_out = "20"

#alicloud_kvstore_instance
security_ips                 = ["10.23.12.24"]
redis_engine_version         = "5.0"
redis_appendonly             = "no"
redis_lazyfree_lazy_eviction = "no"

#alicloud_mongodb_instance
db_instance_class   = "dds.mongo.standard"
db_instance_storage = 20

#alicloud_polardb_cluster
polardb_cluster_description = "update_polardb_cluster_description"