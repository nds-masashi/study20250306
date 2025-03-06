variable "resourceName" {}
variable "defaultSubnetId" {}
variable "defaultVpcId" {}
variable "allowAccessIp" {}
variable "keyName" {}

module "main" {
  source = "../../modules"

  resourceName    = var.resourceName
  defaultSubnetId = var.defaultSubnetId
  defaultVpcId    = var.defaultVpcId
  allowAccessIp   = var.allowAccessIp
  keyName         = var.keyName
}
