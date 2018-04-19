FROM node:alpine
# install modules
RUN npm install --save googleapis

COPY cloudbuild.js .

ENTRYPOINT ["node", "cloudbuild"]
CMD ["testvalue"]
