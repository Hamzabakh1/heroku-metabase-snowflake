# Use the official Metabase image as base
FROM metabase/metabase:latest

# Set working directory
WORKDIR /app

# Copy custom entrypoint and run scripts
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
COPY run_metabase.sh /app/run_metabase.sh

# Optional: preload script for release phase
COPY bin/build-driver-cache.sh /app/bin/build-driver-cache.sh

# Ensure scripts are executable
RUN chmod +x /app/docker-entrypoint.sh /app/run_metabase.sh /app/bin/build-driver-cache.sh

# Set the entrypoint
ENTRYPOINT ["/app/docker-entrypoint.sh"]
