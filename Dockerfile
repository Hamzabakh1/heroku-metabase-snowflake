# Use a specific stable Metabase OSS version to avoid migrations mismatch
ARG METABASE_VERSION=0.54.8
FROM metabase/metabase:${METABASE_VERSION}

# Switch to root to install driver
USER root
WORKDIR /app

# Preload Snowflake JDBC driver and set memory limit
ENV JAVA_TOOL_OPTIONS="-Xmx300m"
COPY bin/build-driver-cache.sh /app/bin/build-driver-cache.sh
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/bin/build-driver-cache.sh /app/docker-entrypoint.sh \
    && /app/bin/build-driver-cache.sh

# Revert to default Metabase user
USER 1000

# Launch Metabase via entrypoint
ENTRYPOINT ["/app/docker-entrypoint.sh"]
