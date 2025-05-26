#!/usr/bin/env bash

# Preload Metabase database drivers to reduce startup time on Heroku

echo "🔄 Starting Metabase driver preload..."

# Ensure metabase.jar is present
if [ ! -f metabase.jar ]; then
  echo "❌ Error: metabase.jar not found. Make sure it's in the /app directory."
  exit 1
fi

# Run Metabase's built-in preload command
java -cp metabase.jar metabase.driver.util$ preload-drivers

if [ $? -eq 0 ]; then
  echo "✅ Drivers preloaded successfully."
else
  echo "❌ Driver preload failed."
  exit 1
fi
