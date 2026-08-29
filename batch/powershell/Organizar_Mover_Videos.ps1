# ==============================================================================
# Script: Organizar_Mover_Videos.ps1
# Descrição: Varre o diretório atual em busca de arquivos de mídia e os move
#            automaticamente para subpastas de destino com base no nome.
# ==============================================================================

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# [CONFIGURAÇÃO] Altere o caminho abaixo para o seu diretório de destino (Ex: OneDrive/SharePoint)
$dest = "C:\Users\Public\Documentos_Monitoramento\Destino_Videos"

# Garante que o diretório de destino existe antes de executar
if (-not (Test-Path -LiteralPath $dest)) {
    Write-Host "ERRO: O diretório de destino não foi encontrado: $dest" -ForegroundColor Red
    Read-Host "Pressione Enter para fechar..."
    exit
}

# Carrega os vídeos e as pastas de destino
$videos = Get-ChildItem -LiteralPath $scriptPath -File | Where-Object { 
    $_.Extension -ne '.bat' -and $_.Extension -ne '.ps1' -and $_.Name -ne 'relatorio_envio.txt' 
}
$pastas = Get-ChildItem -LiteralPath $dest -Directory

$relatorio = @()
$relatorio += '=== RELATÓRIO DE MOVIMENTAÇÃO DE VÍDEOS ==='
$relatorio += 'Data/Hora: ' + (Get-Date -Format 'dd/MM/yyyy HH:mm:ss')
$relatorio += '-------------------------------------------'

foreach ($pasta in $pastas) {
    # Sanitiza o nome da pasta removendo códigos/números do início (Ex: "398 UNIDADE NORTE" vira "UNIDADE NORTE")
    $nomeLimpo = $pasta.Name -replace '^\d+\s+', ''
    
    foreach ($video in $videos) {
        if ($video.Name -like "*$nomeLimpo*") {
            try {
                Move-Item -LiteralPath $video.FullName -Destination $pasta.FullName -Force
                $msg = "Movido: $($video.Name) -> $($pasta.Name)"
                Write-Host $msg -ForegroundColor Green
                $relatorio += $msg
            } catch {
                $msgErro = "ERRO ao mover: $($video.Name) -> $($_.Exception.Message)"
                Write-Host $msgErro -ForegroundColor Red
                $relatorio += $msgErro
            }
        }
    }
}

if ($relatorio.Count -le 3) { 
    $relatorio += 'Nenhum arquivo correspondente foi encontrado para mover.' 
    Write-Host 'Nenhum arquivo correspondente foi encontrado para mover.' -ForegroundColor Yellow
}

# Exporta o log de auditoria em UTF-8
$relatorio | Out-File -FilePath "$scriptPath\relatorio_envio.txt" -Encoding utf8
Write-Host "`n[FIM] O arquivo relatorio_envio.txt foi gerado para conferência." -ForegroundColor Cyan
Read-Host "Pressione Enter para fechar..."
