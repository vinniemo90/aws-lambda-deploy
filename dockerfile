FROM python:3.6-slim
RUN apt-get update && apt-get install -y zip
COPY . /lambda_code
WORKDIR /lambda_code
RUN chmod +x /lambda_code/entrypoint.sh
ENTRYPOINT [ "sh", "lambda_code/entrypoint.sh" ]
