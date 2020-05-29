# The Node version that we'll be running for our version of React.
# You may have to search the Node directory for a version that fits
# the version of React you're using.

# Based on https://www.telerik.com/blogs/dockerizing-react-applications-for-continuous-integration

FROM node:12.14.1

USER root

# Create a work directory and copy over our dependency manifest files.
RUN mkdir /app
WORKDIR /app
COPY ./src /app/src
COPY ./public /app/public
COPY ./package.json /app/package.json
COPY ./package-lock.json /app/package-lock.json

# If you're using yarn:
#  yarn build
RUN npm install

# Expose PORT 3000 on our virtual machine so we can run our server
EXPOSE 3000

USER root
CMD [ "npm", "start" ]
