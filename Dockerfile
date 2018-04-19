FROM gcr.io/cloud-builders/gcloud

# Encrypted key can be stored in Container

RUN gcloud kms decrypt \
  --ciphertext-file=Static-Cloud-Builders-a9fee80ea6d5.enc \
  --plaintext-file=google_service_account-Static-Cloud-Builders.json \
  --location=global \
  --keyring=my-keyring \
  --key=cloud-build-service-account

# Should be decrypted at run time (LATER - creates complexities - this is a temp solution)

FROM node:alpine
# install modules, this could be done in first build step
RUN npm install --save googleapis

FROM gcr.io/distroless/nodejs

COPY from=0 google_service_account-Static-Cloud-Builders.json /
COPY from=1 node_modules .
COPY cloudbuild.js .
COPY test-argument.js .

ENV GOOGLE_APPLICATION_CREDENTIALS=/google_service_account-Static-Cloud-Builders.json

ENTRYPOINT ["/usr/local/bin/node", "cloudbuild"]
#ENTRYPOINT ["/usr/local/bin/node", "test-argument"]
CMD ["testvalue"]
