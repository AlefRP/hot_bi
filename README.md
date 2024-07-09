# README

## Requisitos

Antes de executar o script `run.bat`, certifique-se de que os seguintes pré-requisitos estejam atendidos:

1. **Docker**:
   - Certifique-se de que o Docker esteja instalado e configurado corretamente em sua máquina.
   - Para instalar o Docker, siga as instruções disponíveis em [Docker Documentation](https://docs.docker.com/get-docker/).

2. **Apache Hop**:
   - O Apache Hop deve estar instalado na sua máquina.
   - Baixe e instale o Apache Hop a partir do site oficial: [Apache Hop](https://hop.apache.org/download/).
   - Certifique-se de que o caminho para `hop-run.bat` esteja corretamente configurado no script `run.bat`.

3. **Driver do MySQL**:
   - O driver do MySQL deve estar disponível no Apache Hop.
   - Para adicionar o driver do MySQL, siga as instruções na documentação do Apache Hop.

## Executando o Script

1. Clone este repositório ou baixe os arquivos necessários.

2. Navegue até o diretório onde o script `run.bat` está localizado.

3. Execute o script `run.bat`:

   ```sh
   run.bat
   ```

4. O script realizará as seguintes ações:

   - Iniciará os containers Docker usando docker-compose.
   - Esperará 15 segundos para garantir que os containers estejam totalmente operacionais.
   - Executará o Apache Hop com a configuração especificada.