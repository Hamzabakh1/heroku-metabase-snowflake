# 📊 Metabase on Heroku with Snowflake JDBC Support

This repository contains a full setup for running Metabase on Heroku using Docker. Includes support for Snowflake JDBC driver.

## Features

- 🔁 GitHub Actions for deployment
- 🐳 Dockerfile with custom plugins
- ❄️ Snowflake JDBC support
- ☁️ Heroku deployment ready

## Getting Started

1. Clone this repository
2. Push to GitHub
3. Connect to Heroku via Dashboard or CLI
4. Set `MB_SITE_URL` via:
   ```bash
   heroku config:set MB_SITE_URL=https://<your-app>.herokuapp.com
