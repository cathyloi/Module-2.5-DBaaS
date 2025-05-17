
resource "aws_dynamodb_table" "Cathrina-bookinventory-TF" {
  name           = "Cathrina-bookinventory-TF"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "ISBN"
  range_key      = "Genre"

  attribute {
    name = "ISBN"
    type = "S"
  }

  attribute {
    name = "Genre"
    type = "S"
  }


  global_secondary_index {
    name               = "TitleAuthorIndex"
    hash_key           = "Title"
    range_key          = "Author"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["ISBN", "Genre"]
  }
  attribute {
    name = "Title"
    type = "S"
  }

attribute {
    name = "Author"
    type = "S"
  }



  global_secondary_index {
    name            = "StockIndex"
    hash_key        = "Stock"
    projection_type = "ALL"
    write_capacity     = 10
    read_capacity      = 10
    
  }

 attribute {
    name = "Stock"
    type = "N"
  } 
  
ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

    

tags = {
    Name        = "Cathrina-bookinventory-TF"
    Environment = "production"
  }
}