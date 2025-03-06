module "main" {
  source = "../../modules"

  resourceName    = var.resourceName
  defaultSubnetId = var.defaultSubnetId
  allowAccessIp   = var.allowAccessIp
  keyName         = var.keyName
}
