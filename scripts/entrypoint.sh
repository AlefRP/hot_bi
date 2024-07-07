#!/bin/bash

# Verifique a disponibilidade dos serviços
/wait-for-it.sh mysql:3306 --timeout=60 --strict -- echo "MySQL está disponível"
/wait-for-it.sh postgresql:5435 --timeout=60 --strict -- echo "PostgreSQL está disponível"
/wait-for-it.sh sqlserver:1433 --timeout=60 --strict -- echo "SQL Server está disponível"

# Execute o primeiro script para baixar os datasets
python scripts/extract/download_datasets.py

# Verifique se o download foi bem-sucedido antes de continuar
if [ $? -eq 0 ]; then
  echo "Download bem-sucedido, executando o próximo script..."
  # Execute o segundo script para carregar os datasets no PostgreSQL
  python scripts/load/load_datasets.py
else
  echo "Falha no download, abortando."
  exit 1
fi