#!/bin/sh
mkdir lambda_deploy
cd lambda_deploy
pip install awscli --upgrade
pip --no-cache-dir install --no-deps --trusted-host pypi.python.org -t . -r ../requirements.txt
cp ../src/lambda_code.py /lambda_code/lambda_deploy
zip -r9 lambda-deploy-pkg.zip .
cp lambda-deploy-pkg.zip ../
cd ..
rm -rf lambda_deploy
aws s3 cp lambda-deploy-pkg.zip s3://$S3_BUCKET_LOC
