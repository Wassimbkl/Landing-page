# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

### Docker Configuration

This application has been configured to run within a Docker container for simplified deployment. Below are the steps to build and run the Docker container:

1. **Dockerfile**: The following Dockerfile is used to create the Docker image:
   ```dockerfile
   # Step 1: Build the application
   FROM node:18-alpine AS build
   WORKDIR /app
   COPY package*.json ./
   RUN npm install
   COPY . .
   RUN npm run build

   # Step 2: Serve with Nginx
   FROM nginx:alpine
   COPY --from=build /app/build /usr/share/nginx/html
   EXPOSE 80
   CMD ["nginx", "-g", "daemon off;"]
   ```

2. **Building the Docker Image**:
   Run the following command in the project directory to build the image:
   ```bash
   docker build -t my-react-app .
   ```

3. **Running the Docker Container**:
   To run the container and expose it on ports **80** and **81**, use the following commands:
   ```bash
   docker run -d -p 80:80 my-react-app
   docker run -d -p 81:80 my-react-app
   ```

   The application is now accessible at [http://localhost:80](http://localhost:80) or [http://localhost:81](http://localhost:81).

4. **Using docker-compose.yml**:
   This project includes a `docker-compose.yml` file to simplify the management of multiple services. Below is an example configuration:
   ```yaml
   version: '3.9'
   services:
     react-app:
       build:
         context: ./react-app
         dockerfile: Dockerfile
       ports:
         - "8080:80"
       volumes:
         - ./react-app:/app
       stdin_open: true
       tty: true
   ```

   To build and run the application using `docker-compose.yml`, run:
   ```bash
   docker-compose up --build
   ```

   This will automatically build the image and run the container. The application will be accessible on the specified port in the configuration.

5. **Common Docker Commands**:
   - Stop a running container:
     ```bash
     docker stop <container_id>
     ```
   - Remove a container:
     ```bash
     docker rm <container_id>
     ```
   - Remove unused images:
     ```bash
     docker image prune -f
     ```

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However, we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)

