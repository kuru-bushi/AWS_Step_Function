aws_account_id=$(aws sts get-caller-identity --query Account --output text)

region=$(aws configure get region)
lambda_and_ecr_name="test-lambda"
user_name="ikeda-k"
docker_img_name=${lambda_and_ecr_name}

# set -e

#############
# aws lambda の作成

# https://qiita.com/hanzawak/items/0b0e3bc54653e2d3c734

# aws iam create-role --role-name lambda-ex --assume-role-policy-document ./role.txt
# aws iam attach-role-policy --role-name lambda-ex --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

# aws lambda create-function --function-name ${lambda_and_ecr_name} \
# --zip-file fileb://test.zip --handler test.lambda_handler --runtime python3.9 \
# --role arn:aws:iam::${aws_account_id}:role/lambda-ex

# その他
# https://zenn.dev/toccasystems/articles/3838faf2e8162f
#############


#########################
docker build -t ${docker_img_name} .
### ビルド省略用
# docker build -t ${docker_img_name} . --no-cache
#########################

aws ecr create-repository --repository-name ${lambda_and_ecr_name} --region ${region}

aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${aws_account_id}.dkr.ecr.${region}.amazonaws.com

docker tag ${lambda_and_ecr_name} ${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${lambda_and_ecr_name}:latest
# イメージのビルドとプッシュ

docker push ${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${lambda_and_ecr_name}:latest


docker rmi ${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${lambda_and_ecr_name}:latest
docker rmi ${docker_img_name}
# # # CMD ["lambda_function.handler"]


