resource "aws_db_instance" "RDS" {
    engine               = "mysql"  
    engine_version       = "8.0"
    identifier           = "my-free-db"
    availability_zone    = "${var.region}a"    
    allocated_storage    = 10           
    backup_retention_period = 0    
    skip_final_snapshot  = true
    username             = var.db_username
    password             = var.db_password
    instance_class       = var.db_instance_class
    storage_type         = var.db_S_class
    publicly_accessible  = false
    multi_az             = false     

}