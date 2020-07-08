#!/bin/sh

set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

if [ "${DEST}" != ""  ]; then
  DEST="/${DEST}/"
  echo ${DEST}
fi

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

aws s3 cp ${FILE} s3://${AWS_S3_BUCKET}${DEST} \
            --region ${AWS_REGION} $*

rm -rf ~/.aws
