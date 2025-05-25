FROM metabase/metabase-enterprise:v1.53.14

COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh
# Add JDBC drivers
ADD https://repo1.maven.org/maven2/net/snowflake/snowflake-jdbc/3.14.3/snowflake-jdbc-3.14.3.jar $MB_PLUGINS_DIR/snowflake-jdbc-3.14.3.jar
ADD https://repo1.maven.org/maven2/org/apache/arrow/arrow-vector/8.0.0/arrow-vector-8.0.0.jar $MB_PLUGINS_DIR/arrow-vector-8.0.0.jar
ADD https://repo1.maven.org/maven2/org/apache/arrow/arrow-format/8.0.0/arrow-format-8.0.0.jar $MB_PLUGINS_DIR/arrow-format-8.0.0.jar
ADD https://repo1.maven.org/maven2/org/apache/arrow/arrow-memory-core/8.0.0/arrow-memory-core-8.0.0.jar $MB_PLUGINS_DIR/arrow-memory-core-8.0.0.jar
ENTRYPOINT ["/app/docker-entrypoint.sh"]
