0. 準備

brew install gibo
gibo dump terraform > .gitignore

1. step 1作成

terraform init
terraform fmt --recursive
terraform plan
terraform apply