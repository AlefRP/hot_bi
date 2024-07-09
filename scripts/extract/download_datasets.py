import os
import json
import subprocess

# Configurar o caminho para o arquivo kaggle.json no projeto
config_dir = os.path.join(os.path.dirname(__file__), '..', '..', 'configs')
kaggle_json_path = os.path.join(config_dir, 'kaggle.json')

# Verificar se o arquivo kaggle.json existe
if not os.path.exists(kaggle_json_path):
    raise FileNotFoundError(f"Arquivo kaggle.json não encontrado em {kaggle_json_path}")

# Carregar credenciais do kaggle.json
with open(kaggle_json_path, 'r') as f:
    kaggle_config = json.load(f)

# Definir variáveis de ambiente para a configuração do Kaggle
os.environ['KAGGLE_USERNAME'] = kaggle_config['username']
os.environ['KAGGLE_KEY'] = kaggle_config['key']

# Diretório onde os dados serão salvos
download_folder = os.path.join(os.path.dirname(__file__), '..', '..', 'data', 'raw')

# Função para baixar datasets do Kaggle usando o comando CLI
def download_kaggle_dataset(dataset, sub_folder):
    path = os.path.join(download_folder, sub_folder)
    if not os.path.exists(path):
        os.makedirs(path)
    command = f'kaggle datasets download -d {dataset} -p {path} --unzip'
    try:
        subprocess.run(command, shell=True, check=True)
        print(f"Dataset {dataset} baixado e descompactado em {path}")
    except subprocess.CalledProcessError as e:
        print(f"Erro ao baixar o dataset {dataset}: {e}")

# Datasets a serem baixados
datasets = {
    "courses": "andrewmvd/udemy-courses"
}

# Baixar o dataset
for name, dataset in datasets.items():
    download_kaggle_dataset(dataset, name)

print("Todos os datasets foram baixados com sucesso.")