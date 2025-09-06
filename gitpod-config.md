# Gitpod Configuration

This repository contains the following Gitpod-related configuration files and directories:

- **.gitpod.Dockerfile** – Custom Gitpod workspace image based on `gitpod/workspace-postgres`; installs Java 21 with SDKMAN, Angular CLI, Odoo, and wkhtmltopdf. The base image provides a PostgreSQL server used by Odoo on port 5432.
- **.gitpod.yml** – Defines Gitpod tasks for building and running the backend, edge, UI and Odoo services, and exposes required ports including the PostgreSQL database. The Odoo task creates an `odoo` user and `prod` database so credentials match the Docker Compose setup.
- **tools/gitpod/** – Additional resources for Gitpod:
  - `openems-backend/` – Dockerfile, configuration (`config.d`) and script to start the backend JAR.
  - `openems-edge/` – Configuration (`config.d`) and data directory for the edge runtime.
  - `openems-ui/` – Dockerfile and `nginx.conf` for serving the built UI.
  - `README.md` – Directory overview.

A Docker Compose definition mirroring this setup, including a separate PostgreSQL service for Odoo, is provided in `docker-compose/docker-compose.yml`.
