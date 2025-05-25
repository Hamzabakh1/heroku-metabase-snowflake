FROM metabase/metabase:v0.54.9

ENV MB_PLUGINS_DIR=/plugins
ENV JAVA_TOOL_OPTIONS="-Xms512m -Xmx1024m"

COPY plugins/ $MB_PLUGINS_DIR/
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT ["/app/docker-entrypoint.sh"]
