#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Starting Metabase entrypoint..."

MB_PLUGINS_DIR=${MB_PLUGINS_DIR:-/plugins}

if [ ! -f "$MB_PLUGINS_DIR/snowflake-jdbc-3.14.3.jar" ]; then
  echo "❌ Missing Snowflake JDBC driver!"
  exit 1
fi

echo "🚀 Launching Metabase..."
exec /app/run_metabase.sh
