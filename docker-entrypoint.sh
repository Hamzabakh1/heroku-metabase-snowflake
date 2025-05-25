#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Starting Metabase entrypoint..."

# Check Snowflake JDBC driver
if [ ! -f "$MB_PLUGINS_DIR/snowflake-jdbc-3.14.3.jar" ]; then
  echo "❌ Snowflake JDBC driver not found!"
  exit 1
fi

# Check Arrow dependencies
for file in arrow-vector-8.0.0.jar arrow-format-8.0.0.jar arrow-memory-core-8.0.0.jar; do
  if [ ! -f "$MB_PLUGINS_DIR/$file" ]; then
    echo "❌ Missing required Arrow dependency: $file"
    exit 1
  fi
done

echo "🚀 Launching Metabase..."
java -Xmx300m -jar /app/metabase.jar
