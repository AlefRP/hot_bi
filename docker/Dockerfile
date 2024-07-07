# MySQL Service
FROM mysql:latest as mysql
COPY init/mysql/init_dw.sql /docker-entrypoint-initdb.d/

# PostgreSQL Service
FROM postgres:latest as postgresql
COPY init/postgresql/init_postgresql.sql /docker-entrypoint-initdb.d/
RUN echo "port = 5435" >> /usr/share/postgresql/postgresql.conf.sample

# SQL Server Service
FROM mcr.microsoft.com/mssql/server:2019-latest as sqlserver
COPY init/sqlserver/init_sqlserver.sql /docker-entrypoint-initdb.d/

# Python Service
FROM python:3.9 as python-scripts

# Instale dependências
RUN pip install pandas sqlalchemy psycopg2-binary requests

# Instale wait-for-it
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Copie os scripts e dados
COPY ../scripts /scripts
COPY ../data /data
COPY ../configs /configs

# Comando de entrada
ENTRYPOINT ["/scripts/entrypoint.sh"]