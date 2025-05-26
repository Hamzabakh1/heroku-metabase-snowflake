#!/usr/bin/env bash
set -euo pipefail

# Define Snowflake JDBC version
SNOWFLAKE_JDBC_VERSION="3.13.23"

# Download from Maven Central
JAR_URL="https://repo1.maven.org/maven2/net/snowflake/snowflake-jdbc/${SNOWFLAKE_JDBC_VERSION}/snowflake-jdbc-${SNOWFLAKE_JDBC_VERSION}.jar"

# Prepare plugins directory and fetch driver
mkdir -p /app/plugins
curl -L "${JAR_URL}" -o /app/plugins/snowflake-jdbc.jar