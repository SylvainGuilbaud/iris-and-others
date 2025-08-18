# IRIS and Others
This repository contains various configurations and scripts for setting up IRIS and others databases + other related services using Docker,as needed for development and testing purposes.

# Services

## IRIS
This service is built using the IRIS Community Edition Docker image. It is configured to run with a specific set of environment variables and volumes for data persistence.

-[IRIS Community Edition Documentation](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=GIRIS)
-[IRIS Management Portal](http://localhost:1081/csp/sys/UtilHome.csp))

## Oracle
This service is built using the Oracle Database Docker image. It is configured to run with a specific set of environment variables and volumes for data persistence.

## MySQL
This service is built using the MySQL Docker image. It is configured to run with a specific set of environment variables and volumes for data persistence.  

## PostgreSQL
This service is built using the PostgreSQL Docker image. It is configured to run with a specific set of environment variables and volumes for data persistence.

## Web Gateway to IRIS
This service is built using the Apache and NGINX Docker image of InterSystems IRIS web gateways.
The web gateway is configured to provide a unified entry point for accessing multiple IRIS instances and related services.

## Other Services
This section describes other related services that may be used in conjunction with the main database services.
### Prometheus
This service is built using the Prometheus Docker image. It is configured to scrape metrics from the various database services and provide a unified monitoring solution.
### Grafana
This service is built using the Grafana Docker image. It is configured to visualize the metrics collected by Prometheus and provide a web-based dashboard for monitoring the database services.
### LOKI
This service is built using the Grafana LOKI Docker image. It is configured to collect and store logs from the various database services and provide a unified logging solution.
### Promtail
This service is built using the Grafana Promtail Docker image. It is configured to collect logs from the various database services and send them to the LOKI instance for storage and analysis.
