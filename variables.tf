#alicloud_instance
variable "name" {
  description = "The specification of module name."
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "The available zone to launch modules."
  type        = string
  default     = ""
}

variable "security_group_ids" {
  description = "A list of security group ids to associate with."
  type        = list(string)
  default     = []
}

variable "vswitch_id" {
  description = "VSwitch variables, if vswitch_id is empty, then the net_type = classic."
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The specification of the instance type."
  type        = string
  default     = ""
}

variable "system_disk_category" {
  description = "The specification of the system disk category."
  type        = string
  default     = "cloud_efficiency"
}

variable "system_disk_name" {
  description = "The specification of the system disk name."
  type        = string
  default     = ""
}

variable "system_disk_description" {
  description = "The specification of the system disk description."
  type        = string
  default     = ""
}

variable "image_id" {
  description = "The specification of the image id."
  type        = string
  default     = ""
}

variable "internet_max_bandwidth_out" {
  description = "The specification of the internet max bandwidth out."
  type        = number
  default     = 10
}

variable "data_disks_name" {
  description = "The name of the data disk."
  type        = string
  default     = ""
}

variable "ecs_size" {
  description = "The specification of the ecs size."
  type        = number
  default     = 1200
}

variable "category" {
  description = "The specification of the category."
  type        = string
  default     = "cloud_efficiency"
}

variable "description" {
  description = "The specification of module description."
  type        = string
  default     = ""
}

variable "encrypted" {
  description = "Encrypted the data in this disk."
  type        = bool
  default     = false
}

#alicloud_kvstore_instance
variable "security_ips" {
  description = "The specification of the security ips."
  type        = list(string)
  default     = ["127.0.0.1"]
}

variable "redis_instance_type" {
  description = "The specification of the redis instance type."
  type        = string
  default     = "Redis"
}

variable "redis_engine_version" {
  description = "The specification of the redis engine version."
  type        = string
  default     = "4.0"
}

variable "redis_appendonly" {
  description = "The specification of the redis appendonly."
  type        = string
  default     = "yes"
}

variable "redis_lazyfree_lazy_eviction" {
  description = "The specification of the redis lazyfree-lazy-eviction."
  type        = string
  default     = "yes"
}

variable "redis_resource_group_id" {
  description = "The specification of the redis resource group id."
  type        = string
  default     = ""
}

variable "redis_instance_class" {
  description = "The specification of the redis resource instance class."
  type        = string
  default     = ""
}

#alicloud_mongodb_instance
variable "mongodb_engine_version" {
  description = "The specification of the mongodb engine version."
  type        = string
  default     = "3.4"
}

variable "db_instance_class" {
  description = "The specification of the db instance class."
  type        = string
  default     = ""
}

variable "db_instance_storage" {
  description = "The specification of the db instance storage."
  type        = number
  default     = 10
}

#alicloud_polardb_cluster
variable "db_type" {
  description = "Database type.Value options: MySQL, Oracle, PostgreSQL."
  type        = string
  default     = "MySQL"
}

variable "db_version" {
  description = "The specification of the db version."
  type        = string
  default     = "8.0"
}

variable "pay_type" {
  description = "The specification of the pay type."
  type        = string
  default     = "PostPaid"
}

variable "db_node_class" {
  description = "The specification of the db node class."
  type        = string
  default     = ""
}

variable "polardb_cluster_description" {
  description = "The description of cluster."
  type        = string
  default     = ""
}

#alicloud_polardb_database
variable "db_name" {
  description = "Name of the database requiring a uniqueness check."
  type        = string
  default     = ""
}

variable "available_resource_creation" {
  description = "The specification of available resource creation."
  type        = string
  default     = "PolarDB"
}