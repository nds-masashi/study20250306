provider "aws" {
  region = "ap-northeast-3"

  default_tags {
    tags = {
      Createdby = var.resourceName
    }
  }
}
