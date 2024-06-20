FROM node:18-alpine AS Installer
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx:latest AS deployer
COPY --from=Installer /app/build /usr/share/nginx/html

