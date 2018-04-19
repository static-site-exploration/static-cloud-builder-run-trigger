FROM node:alpine
# install modules
RUN npm install --save googleapis

COPY cloudbuild.js .
COPY test-argument.js .

#ENTRYPOINT ["/usr/local/bin/node", "cloudbuild"] test-argument.js
ENTRYPOINT ["/usr/local/bin/node", "test-argument"]
CMD ["testvalue"]
