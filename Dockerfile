FROM node:alpine
# install modules, this could be done in first build step
RUN npm install --save googleapis

FROM gcr.io/distroless/nodejs

COPY --from=0 node_modules .

