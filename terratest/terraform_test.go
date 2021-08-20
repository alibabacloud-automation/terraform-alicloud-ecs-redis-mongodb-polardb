package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
// Make sure you have the dep binary, https://github.com/golang/dep
// Run 'dep ensure' before run test cases.

func TestTerraformBasicExampleNew(t *testing.T) {
	t.Parallel()
	name := "tf-ecs-redis-mongodb-polardb"
	description := "tf-ecs-redis-mongodb-polardb-description"
	availableDiskCategory := "cloud_efficiency"
	availableResourceCreation := "PolarDB"
	vpcCidrBlock := "192.168.0.0/16"
	vswitchCidrBlock := "192.168.1.0/24"
	instanceType := "ecs.n4.large"
	systemDiskCategory := "cloud_efficiency"
	systemDiskName := "system_disk"
	systemDiskDescription := "system_disk_description"
	imageId := "ubuntu_18_04_64_20G_alibase_20190624.vhd"
	internetMaxBandwidthOut := 10
	ecsSize := 10
	category := "cloud_efficiency"
	securityIps := []string{"127.0.0.1"}
	redisInstanceType := "Redis"
	redisEngineVersion := "4.0"
	redisAppendonly := "yes"
	redisLazyfreeLazyEviction := "yes"
	redisResourceGroupId := "rg-123456"
	redisInstanceClass := "redis.master.large.default"
	mongodbEngineVersion := "3.4"
	dbInstanceClass := "dds.mongo.mid"
	dbInstanceStorage := 10
	dbVersion := "8.0"
	payType := "PostPaid"
	dbNodeClass := "polar.mysql.x4.large"

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "./basic/",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"name":                         name,
			"description":                  description,
			"available_disk_category":      availableDiskCategory,
			"available_resource_creation":  availableResourceCreation,
			"vpc_cidr_block":               vpcCidrBlock,
			"vswitch_cidr_block":           vswitchCidrBlock,
			"instance_type":                instanceType,
			"system_disk_category":         systemDiskCategory,
			"system_disk_name":             systemDiskName,
			"system_disk_description":      systemDiskDescription,
			"image_id":                     imageId,
			"internet_max_bandwidth_out":   internetMaxBandwidthOut,
			"ecs_size":                     ecsSize,
			"category":                     category,
			"security_ips":                 securityIps,
			"redis_instance_type":          redisInstanceType,
			"redis_engine_version":         redisEngineVersion,
			"redis_appendonly":             redisAppendonly,
			"redis_lazyfree_lazy_eviction": redisLazyfreeLazyEviction,
			"redis_resource_group_id":      redisResourceGroupId,
			"redis_instance_class":         redisInstanceClass,
			"mongodb_engine_version":       mongodbEngineVersion,
			"db_instance_class":            dbInstanceClass,
			"db_instance_storage":          dbInstanceStorage,
			"db_version":                   dbVersion,
			"pay_type":                     payType,
			"db_node_class":                dbNodeClass,
		},

		// Disable colors in Terraform commands, so it's easier to parse stdout/stderr
		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	thisEcsName := terraform.Output(t, terraformOptions, "this_ecs_name")
	thisEcsInstanceType := terraform.Output(t, terraformOptions, "this_ecs_instance_type")
	thisRedisInstanceType := terraform.Output(t, terraformOptions, "this_redis_instance_type")
	thisMongodbInstanceClass := terraform.Output(t, terraformOptions, "this_mongodb_instance_class")
	thisPolardbVersion := terraform.Output(t, terraformOptions, "this_polardb_version")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, thisEcsName, name)
	assert.Equal(t, thisEcsInstanceType, instanceType)
	assert.Equal(t, thisRedisInstanceType, redisInstanceType)
	assert.Equal(t, thisMongodbInstanceClass, dbInstanceClass)
	assert.Equal(t, thisPolardbVersion, dbVersion)
}
