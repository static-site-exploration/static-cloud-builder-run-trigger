FROM node:alpine
# install modules
RUN npm install --save googleapis

COPY cloudbuild.js .
COPY test-argument.js .

#ENTRYPOINT ["/usr/local/bin/firebase", "cloudbuild"] test-argument.js
ENTRYPOINT ["/usr/local/bin/firebase", "test-argument"]
CMD ["testvalue"]
