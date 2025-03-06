0. 準備

brew install gibo
gibo dump terraform > .gitignore

1. step 1作成

terraform init
terraform fmt --recursive
terraform plan
terraform apply

terraform init --upgrade

tflint --init
tflint --recursive

2. step 2作成

aws_default_route_table で作成する

シークレット強制削除
aws secretsmanager list-secrets
aws secretsmanager delete-secret --secret-id シークレット名 --force-delete-without-recovery --region ap-northeast-1
aws secretsmanager describe-secret --secret-id シークレット名 --region ap-northeast-1