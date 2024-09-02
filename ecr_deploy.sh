aws_account_id=$(aws sts get-caller-identity --query Account --output text)

lambda_and_ecr_name="test-lambda"
user_name="ikeda-k"
docker_img_name="test-lambda-img"
# set -e

#############
# aws lambda の作成

# https://qiita.com/hanzawak/items/0b0e3bc54653e2d3c734

aws iam create-role --role-name lambda-ex --assume-role-policy-document ./role.txt

aws iam attach-role-policy --role-name lambda-ex --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole


aws lambda create-function --function-name ${lambda_and_ecr_name} \
--zip-file fileb://test.zip --handler test.lambda_handler --runtime python3.9 \
--role arn:aws:iam::${aws_account_id}:role/lambda-ex

# その他
# https://zenn.dev/toccasystems/articles/3838faf2e8162f
#############


# イメージのビルドとプッシュ
aws ecr get-login-password --region region | docker login --username AWS --password-stdin ${aws_account_id}.dkr.ecr.region.amazonaws.com

docker build -t ${docker_img_name} .

docker tag e9ae3c220b23 ${aws_account_id}.dkr.ecr.us-west-2.amazonaws.com/my-repository:tag

docker push ${aws_account_id}.dkr.ecr.us-west-2.amazonaws.com/my-repository:tag


CMD ["lambda_function.handler"]

