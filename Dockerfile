FROM alpine:latest
RUN apk add  nodejs npm
WORKDIR /user/app
COPY ./package.json ./ 
RUN npm install 
COPY ./ ./ 
CMD ["node","index.js"]
#What Happens During docker build
# Docker sees package.json has changed → this invalidates the cache for this line:

#     Dockerfile
#     Copy
#     Edit
#     COPY ./package.json ./
#     Since that line changed, it invalidates the next layer:
    
#     Dockerfile
#     Copy
#     Edit
#     RUN npm install
#     → So Docker will re-run npm install with the new dependency (cors).
    
#     Then the rest of the code is copied with:
    
#     Dockerfile
#     Copy
#     Edit
#     COPY ./ ./
#     ✅ End Result
#     npm install runs again, which is correct because package.json changed.
    
#     Your new dependency cors gets installed into node_modules.
    
#     Docker rebuilds only the necessary layers — it doesn't redo steps unrelated to package.json.
    
#     ⚡ Why This Is Good
#     This selective rebuild:
    
#     Saves time during development.
    
#     Avoids reinstalling dependencies every time you change code in index.js.