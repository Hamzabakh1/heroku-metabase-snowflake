FROM metabase/metabase:v1.53.14

# Limit Java heap to 750 MB
ENV JAVA_TOOL_OPTIONS="-Xmx750m"

# Copy your custom entrypoint
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT ["/app/docker-entrypoint.sh"]
