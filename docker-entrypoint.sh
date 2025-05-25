#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Starting Metabase entrypoint..."

# --- ENSURE SNOWFLAKE DRIVER AND DEPENDENCIES ARE PRESENT ---
MB_PLUGINS_DIR=${MB_PLUGINS_DIR:-/plugins}

if [ ! -f "$MB_PLUGINS_DIR/snowflake-jdbc-3.14.3.jar" ]; then
  echo "⬇️  Downloading Snowflake JDBC driver..."
  curl -L -o "$MB_PLUGINS_DIR/snowflake-jdbc-3.14.3.jar" "https://repo1.maven.org/maven2/net/snowflake/snowflake-jdbc/3.14.3/snowflake-jdbc-3.14.3.jar"
fi

if [ ! -f "$MB_PLUGINS_DIR/arrow-memory-8.0.0.jar" ]; then
  echo "⬇️  Downloading Apache Arrow memory dependency..."
  curl -L -o "$MB_PLUGINS_DIR/arrow-memory-8.0.0.jar" "https://repo1.maven.org/maven2/org/apache/arrow/arrow-memory/8.0.0/arrow-memory-8.0.0.jar"
fi

echo "🚀 Launching Metabase..."
exec /app/run_metabase.sh
