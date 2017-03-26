aws_profile = "dare"

availability_zone = "eu-west-1a"

region = "eu-west-1"

terragrunt = {
  # Configure Terragrunt to use DynamoDB for locking
  lock {
    backend = "dynamodb"

    config {
      state_file_id = "infra-dev"
    }
  }

  # Configure Terragrunt to automatically store tfstate files in an S3 bucket
  remote_state {
    backend = "s3"

    config {
      encrypt = "false"
      bucket  = "cdh-infra"
      key     = "infrastructure/cdh5_state.state"
      region  = "eu-west-1"
    }
  }
}
