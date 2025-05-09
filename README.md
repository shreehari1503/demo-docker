 Steps to Build and Run
Build the Docker image

bash
Copy
Edit
docker build -t dock1 .
Run the Docker container

bash
Copy
Edit
docker run -p 3000:3000 dock1
Access your app
Visit http://localhost:3000 (or whichever port your app uses)

📦 Dockerfile Breakdown
FROM alpine:latest – use a small Linux base image

RUN apk add nodejs npm – install Node.js and npm

WORKDIR /user/app – set working directory in the container

COPY ./package.json ./ – copy only package.json to install deps

RUN npm install – install project dependencies

COPY ./ ./ – copy rest of your project (e.g. index.js)

CMD ["node", "index.js"] – run the app

project url::https://github.com/shreehari1503/demo-docker](https://roadmap.sh/projects/basic-dockerfile)
