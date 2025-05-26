# ── docker-entrypoint.sh ────────────────────────────────────
set -e

# Bind dyno Heroku
[ -n "$PORT" ] && export MB_JETTY_PORT="$PORT"

# Connexion Snowflake via DATABASE_URL
[ -n "$DATABASE_URL" ] && export MB_DB_CONNECTION_URI="$DATABASE_URL"

# Optimisations Java
JAVA_OPTS="${JAVA_OPTS:-}"
JAVA_OPTS+=" -XX:+UnlockExperimentalVMOptions"
JAVA_OPTS+=" -XX:+UseContainerSupport"
JAVA_OPTS+=" -XX:-UseGCOverheadLimit"
JAVA_OPTS+=" -XX:+UseCompressedOops"
JAVA_OPTS+=" -XX:+UseCompressedClassPointers"
JAVA_OPTS+=" -Xverify:none"
JAVA_OPTS+=" -XX:+UseG1GC"
JAVA_OPTS+=" -XX:+UseStringDeduplication"
JAVA_OPTS+=" -server"
JAVA_OPTS+=" -Djava.awt.headless=true"
JAVA_OPTS+=" -Dfile.encoding=UTF-8"

# Fuseau horaire optionnel
if [ -n "$JAVA_TIMEZONE" ]; then
    echo "  -> Timezone: $JAVA_TIMEZONE"
    JAVA_OPTS+=" -Duser.timezone=$JAVA_TIMEZONE"
fi

export JAVA_OPTS
echo "JAVA_OPTS: $JAVA_OPTS"

# Lance Metabase
exec /app/run_metabase.sh
