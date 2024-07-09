# README

## Requisitos

Antes de executar o projeto, certifique-se de que os seguintes pré-requisitos estejam atendidos:

1. **Docker e Docker Compose**:
   - Certifique-se de que o Docker e o Docker Compose estejam instalados e configurados corretamente em sua máquina.
   - Para instalar o Docker, siga as instruções disponíveis em [Docker Documentation](https://docs.docker.com/get-docker/).

## Executando o Projeto

1. Clone este repositório ou baixe os arquivos necessários.

2. Navegue até o diretório onde o arquivo `docker-compose.yml` está localizado.

3. Execute o comando a seguir para iniciar os containers Docker:

   ```sh
   docker-compose up -d
   ```

4. O comando docker-compose up -d realizará as seguintes ações:

   - Iniciará os containers Docker definidos no arquivo docker-compose.yml.
   - Esperará até que todos os containers estejam totalmente operacionais.

## Verificando o funcionamento

Cheque os dados na porta 3307 do MySQL e 5435 do PostgreSQL.
