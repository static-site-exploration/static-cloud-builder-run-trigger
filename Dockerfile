FROM node:alpine
# install modules, this could be done in first build step
RUN npm install --save googleapis

FROM gcr.io/distroless/nodejs

COPY --from=0 node_modules .

COPY cloudbuild.js .
COPY test-argument.js .

ARG service_account_file
COPY ${service_account_file} /

ENV GOOGLE_APPLICATION_CREDENTIALS=/${service_account_file}

