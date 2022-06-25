FROM node:4

# Prepare non-root user and folders
RUN useradd --system --user-group --create-home app && \
    mkdir /app && chown app:app /app
RUN npm install -g nodemon

# Install dependency outside of the app volume
COPY package.json /opt/
RUN cd /opt && npm install
ENV NODE_PATH=/opt/node_modules

VOLUME ["/app"]
USER app
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["/app/entrypoint.sh"]