module "ecs-redis-mongodb-polardb" {
  source                 = "../"
  name                   = "ecs-redis-mongodb-polardb"
  instance_type          = "ecs.n4.large"
  redis_instance_class   = "redis.master.large.default"
  mongodb_engine_version = "3.4"
  db_instance_class      = "dds.mongo.mid"
  db_version             = "8.0"
  db_node_class          = "polar.mysql.x4.large"
}
