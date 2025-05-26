#!/usr/bin/env bash

# Run Metabase using any JAVA_OPTS passed from docker-entrypoint.sh
exec java $JAVA_OPTS -jar metabase.jar
