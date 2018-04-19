FROM node:alpine
# install modules
RUN npm install --save googleapis

COPY cloudbuild.js .

ENTRYPOINT ["/usr/local/bin/firebase", "cloudbuild"]
CMD ["testvalue"]
