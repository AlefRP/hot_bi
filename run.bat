@echo off
REM Caminho para o hop-run.bat
set hop_run_path="C:\apache-hop\hop-run.bat"
set hop_file_path="%~dp0scripts\dw_hop\dw_courses\dw_work.hwf"

REM Nome do projeto e configuração de execução do Apache Hop
set project_name="dw_hop"
set run_config="local"

echo Starting Docker Compose...
docker-compose up -d

REM Verifica se o Docker Compose subiu corretamente
if %errorlevel% neq 0 (
    echo Docker Compose failed to start.
    exit /b %errorlevel%
)

echo Docker Compose started successfully.

REM Espera por 15 segundos antes de executar o Apache Hop
echo Waiting for Docker containers to be fully up and running...
timeout /t 15 /nobreak >nul

echo Running Apache Hop...
%hop_run_path% --file=%hop_file_path% --project=%project_name% --runconfig=%run_config%

REM Verifica se o Apache Hop executou corretamente
if %errorlevel% neq 0 (
    echo Apache Hop failed to run.
    exit /b %errorlevel%
)

echo Apache Hop ran successfully.

pause