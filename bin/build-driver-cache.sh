#!/usr/bin/env bash
set -euo pipefail

# Define Snowflake JDBC version
SNOWFLAKE_JDBC_VERSION="3.23.0"
JAR_URL="https://repo1.maven.org/maven2/net/snowflake/snowflake-jdbc/${SNOWFLAKE_JDBC_VERSION}/snowflake-jdbc-${SNOWFLAKE_JDBC_VERSION}.jar"

# Prepare plugins directory and fetch driver
mkdir -p /app/plugins
curl -fsSL "$JAR_URL" -o /app/plugins/snowflake-jdbc.jar
