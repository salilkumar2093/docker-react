# alpine doesn't have node pre installed  we will use node image 
# alpine as samll and compact as possible, default node will contain extra parameters but 
# using the alpine will make use a strict down version.
FROM node:alpine as builder

# dependencies 
WORKDIR '/app'
COPY package.json .
RUN npm install

COPY . . 
CMD ["npm","run","build"]

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html