@echo off
setlocal enabledelayedexpansion

echo Aguarde, realizando a contagem dos videos...

rem PowerShell simplificado: filtra por canal primario (Ex: CH1/C1) ou arquivos sem identificador de canal
for /f %%A in ('powershell -NoProfile -Command "$arquivos = Get-ChildItem -Recurse -File | Where-Object { $_.Name -notlike '*.bat' }; $filtrados = $arquivos | Where-Object { $_.Name -match 'CH1' -or ($_.Name -notmatch 'CH1|CH2|CH3|CH4') }; $filtrados.Count"') do (
    set totalVideos=%%A
)

cls
echo =======================================
echo     CONTAGEM DE VIDEOS CONCLUIDA
echo =======================================
echo Ocorrencias nos videos: %totalVideos%
echo.
echo =======================================
echo       ENTRADA DE OCs PENDENTES
echo =======================================

rem Solicitacao de pendencias por operador/estacao
set /p Op1="Quantas OCs pendentes na pasta do Operador 1? "
set /p Op2="Quantas OCs pendentes na pasta do Operador 2? "
set /p Op3="Quantas OCs pendentes na pasta do Operador 3? "
set /p Op4="Quantas OCs pendentes na pasta do Operador 4? "

rem Tratamento de nulos: atribui 0 caso o usuario aperte ENTER sem digitar
if "%Op1%"=="" set Op1=0
if "%Op2%"=="" set Op2=0
if "%Op3%"=="" set Op3=0
if "%Op4%"=="" set Op4=0

rem Operacao matematica de consolidacao
set /a totalPendentes=%Op1% + %Op2% + %Op3% + %Op4%
set /a resultadoFinal=%totalVideos% + %totalPendentes%

rem Exibicao do relatorio consolidado
echo.
echo =======================================
echo  Total de OCs nos Videos: %totalVideos%
echo  Total de OCs Pendentes:  %totalPendentes%
echo  TOTAL GERAL DE OCs:      %resultadoFinal%
echo =======================================
echo.

pause
