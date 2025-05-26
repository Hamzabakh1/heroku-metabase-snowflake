#!/usr/bin/env bash
set -euo pipefail

# Heroku dyno port
if [ "$PORT" ]; then
  export MB_JETTY_PORT="$PORT"
fi

# Use Heroku DATABASE_URL
if [ "$DATABASE_URL" ]; then
  export MB_DB_CONNECTION_URI="$DATABASE_URL"
fi

# Java memory flags for container
JAVA_OPTS="\$JAVA_OPTS -XX:+UnlockExperimentalVMOptions"
JAVA_OPTS="\$JAVA_OPTS -XX:+UseContainerSupport"
JAVA_OPTS="\$JAVA_OPTS -XX:-UseGCOverheadLimit"
JAVA_OPTS="\$JAVA_OPTS -XX:+UseG1GC"
JAVA_OPTS="\$JAVA_OPTS -XX:+UseStringDeduplication"
JAVA_OPTS="\$JAVA_OPTS -server"

# Execute Metabase jar
exec java \$JAVA_OPTS -jar /app/metabase.jar
