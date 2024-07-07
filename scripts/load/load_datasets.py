import os
import pandas as pd
from sqlalchemy import create_engine
import logging
from configparser import ConfigParser

# Caminho absoluto para o arquivo de configuração
config_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'configs', 'config.ini'))

# Carrega as configurações do arquivo .ini desativando a interpolação padrão
config = ConfigParser(interpolation=None)
config.read(config_path)

# Verificar se a seção [logging] está no arquivo de configuração
if 'logging' not in config:
    raise KeyError("A seção 'logging' não foi encontrada no arquivo de configuração.")

# Criar o diretório de logs se não existir
log_file_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', config['logging']['filename']))
log_dir = os.path.dirname(log_file_path)
if not os.path.exists(log_dir):
    os.makedirs(log_dir)

# Configuração do log
logging.basicConfig(filename=log_file_path, 
                    level=config['logging']['level'].upper(), 
                    format=config['logging']['format'])
logger = logging.getLogger()

logger.info("Iniciando o carregamento dos dados")

# Caminho para o arquivo CSV
csv_file_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'data', 'raw', 'courses', 'udemy_courses.csv'))

# Verificar se o arquivo CSV existe
if not os.path.exists(csv_file_path):
    raise FileNotFoundError(f"Arquivo CSV não encontrado: {csv_file_path}")

# Carregar o CSV em um DataFrame
df = pd.read_csv(csv_file_path)
logger.info('Arquivo CSV carregado com sucesso')

# Configuração da conexão com o PostgreSQL
db_username = config['database']['username']
db_password = config['database']['password']
db_host = config['database']['host']
db_port = config['database']['port']
db_name = config['database']['database']

# Criar a string de conexão
connection_string = f'postgresql://{db_username}:{db_password}@{db_host}:{db_port}/{db_name}'
engine = create_engine(connection_string)
logger.info('Conexão com o banco de dados PostgreSQL estabelecida')

# Carregar os dados no PostgreSQL
table_name = 'courses'
df.to_sql(table_name, engine, if_exists='replace', index=False)
logger.info(f'Dados carregados com sucesso na tabela {table_name}')