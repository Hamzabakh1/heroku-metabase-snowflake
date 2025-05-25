FROM openjdk:21-jdk-slim

# Set environment variables
ENV MB_PLUGINS_DIR=/plugins
ENV MB_DB_TYPE=postgres

# Create directories
RUN mkdir -p /app /plugins

WORKDIR /app

# Copy Metabase JAR (replace with actual Metabase version)
ADD https://downloads.metabase.com/v0.54.9/metabase.jar /app/metabase.jar

# Copy entrypoint
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

# Add JDBC drivers
ADD https://repo1.maven.org/maven2/net/snowflake/snowflake-jdbc/3.14.3/snowflake-jdbc-3.14.3.jar $MB_PLUGINS_DIR/snowflake-jdbc-3.14.3.jar
ADD https://repo1.maven.org/maven2/org/apache/arrow/arrow-vector/8.0.0/arrow-vector-8.0.0.jar $MB_PLUGINS_DIR/arrow-vector-8.0.0.jar
ADD https://repo1.maven.org/maven2/org/apache/arrow/arrow-format/8.0.0/arrow-format-8.0.0.jar $MB_PLUGINS_DIR/arrow-format-8.0.0.jar
ADD https://repo1.maven.org/maven2/org/apache/arrow/arrow-memory-core/8.0.0/arrow-memory-core-8.0.0.jar $MB_PLUGINS_DIR/arrow-memory-core-8.0.0.jar

# Expose port
EXPOSE 3000

ENTRYPOINT ["/app/docker-entrypoint.sh"]
