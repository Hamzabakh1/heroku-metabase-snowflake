# Use the official Metabase OSS image
ARG METABASE_VERSION=latest
FROM metabase/metabase:${METABASE_VERSION}

# Switch to root to install driver
USER root
WORKDIR /app

# Copy entrypoint and driver cache script
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
COPY bin/build-driver-cache.sh /app/bin/build-driver-cache.sh

# Make scripts executable and preload Snowflake JDBC driver
RUN chmod +x /app/docker-entrypoint.sh /app/bin/build-driver-cache.sh \
    && /app/bin/build-driver-cache.sh

# Revert to default Metabase user
USER 1000

# Launch Metabase
ENTRYPOINT ["/app/docker-entrypoint.sh"]
