module "main" {
  source = "../../modules"

  resourceName  = var.resourceName
  allowAccessIp = var.allowAccessIp
  keyName       = var.keyName
}
