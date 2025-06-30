
FROM node:19 as build
WORKDIR /app
COPY . .

RUN npm install
RUN npm run build 

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

# Build React app
# FROM node:18 as build
# WORKDIR /app
# COPY . .
# RUN npm install && npm run build

# # Serve with NGINX
# FROM nginx:alpine
# COPY --from=build /app/build /usr/share/nginx/html
