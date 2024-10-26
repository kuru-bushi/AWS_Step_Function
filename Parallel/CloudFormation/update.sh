


# aws cloudformation deploy --stack-name test-stack \
#   --template ./template.yml 


# aws cloudformation update-stack --stack-name test-stack --template-body file://template.yml


aws cloudformation create-stack --template-body file://template.yml \
    --stack-name stack-test \
    --parameters ParameterKey=VPCRange







