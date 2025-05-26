# ── Dockerfile ───────────────────────────────────────────────
FROM metabase/metabase:latest

# Crée le dossier pour les plugins JDBC
RUN mkdir -p /app/plugins/drivers

# Positionne le répertoire de travail
WORKDIR /app

# Copie des scripts
COPY bin/build-driver-cache.sh /app/bin/build-driver-cache.sh
COPY docker-entrypoint.sh   /app/docker-entrypoint.sh
COPY run_metabase.sh        /app/run_metabase.sh

# Rends les scripts exécutables
RUN chmod +x /app/bin/build-driver-cache.sh \
             /app/docker-entrypoint.sh \
             /app/run_metabase.sh

# Expose le port Metabase
EXPOSE 3000

# Point d’entrée par défaut
ENTRYPOINT ["/app/docker-entrypoint.sh"]
