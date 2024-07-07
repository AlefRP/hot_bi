import os
import pandas as pd
from sqlalchemy import create_engine
import logging

# Configuração de logging para saída padrão
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
logger = logging.getLogger()

logger.info("Iniciando o carregamento dos dados")

# Caminho para o arquivo CSV
csv_file_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..', 'data', 'raw', 'courses', 'udemy_courses.csv'))

# Verificar se o arquivo CSV existe
if not os.path.exists(csv_file_path):
    raise FileNotFoundError(f"Arquivo CSV não encontrado: {csv_file_path}")

# Carregar o CSV em um DataFrame
df = pd.read_csv(csv_file_path)
logger.info('Arquivo CSV carregado com sucesso')

# Configuração da conexão com o PostgreSQL
db_username = 'postgres'
db_password = '1234'
db_host = 'postgresql'  # Nome do serviço definido no docker-compose.yml
db_port = '5432'
db_name = 'courses'

# Criar a string de conexão
connection_string = f'postgresql://{db_username}:{db_password}@{db_host}:{db_port}/{db_name}'
engine = create_engine(connection_string)
logger.info('Conexão com o banco de dados PostgreSQL estabelecida')

# Carregar os dados no PostgreSQL
table_name = 'courses'
df.to_sql(table_name, engine, if_exists='replace', index=False)
logger.info(f'Dados carregados com sucesso na tabela {table_name}')