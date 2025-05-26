# ── bin/build-driver-cache.sh ────────────────────────────────
set -e
echo "⬇️  Téléchargement du driver Snowflake JDBC…"
mkdir -p /app/plugins/drivers
curl -L "https://repo1.maven.org/maven2/net/snowflake/snowflake-jdbc/3.13.22/snowflake-jdbc-3.13.22.jar" \
  -o /app/plugins/drivers/snowflake-jdbc.jar
echo "✅ Driver Snowflake installé."
