<<<<<<< HEAD
# Étape 1 : Construction
=======
# Étape 1 : Construire l'application
>>>>>>> 8ef60b7 (Initial commit)
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

<<<<<<< HEAD
# Étape 2 : Serveur Web
=======
# Étape 2 : Servir l'application
>>>>>>> 8ef60b7 (Initial commit)
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
