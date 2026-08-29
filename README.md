# 🛠️ System Automation & File Management Tools (Batch + PowerShell)

Conjunto de scripts de automação em linha de comando (CMD Batch e PowerShell) desenvolvidos para otimização de fluxos operacionais, filtragem desduplicada de mídias de CFTV/monitoramento e movimentação dinâmica de arquivos.

---

## 📁 Estrutura do Repositório

```text
system-automation-scripts/
│
├── batch/
│   └── Contador_OCs_Videos.bat        <-- Contagem e desduplicação de vídeos + pendências
└── powershell/
    ├── Organizar_Mover_Videos.ps1    <-- Script PowerShell com Regex e Try-Catch
    └── Executar_Organizador.bat       <-- Wrapper em Batch para execução com Bypass
