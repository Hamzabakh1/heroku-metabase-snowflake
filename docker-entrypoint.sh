#!/usr/bin/env bash
set -euo pipefail

# Bind Heroku port to Metabase
if [ -n "${PORT:-}" ]; then
  export MB_JETTY_PORT="$PORT"
fi

# Use Heroku DATABASE_URL
if [ -n "${DATABASE_URL:-}" ]; then
  export MB_DB_CONNECTION_URI="$DATABASE_URL"
fi

# Build Java options
JAVA_OPTS="${JAVA_TOOL_OPTIONS:-}"
JAVA_OPTS="$JAVA_OPTS -XX:+UnlockExperimentalVMOptions"
JAVA_OPTS="$JAVA_OPTS -XX:+UseContainerSupport"
JAVA_OPTS="$JAVA_OPTS -XX:-UseGCOverheadLimit"
JAVA_OPTS="$JAVA_OPTS -XX:+UseG1GC"
JAVA_OPTS="$JAVA_OPTS -XX:+UseStringDeduplication"
JAVA_OPTS="$JAVA_OPTS -server"

# Execute Metabase jar
exec java $JAVA_OPTS -jar /app/metabase.jar
