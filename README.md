# 🛠️ System Automation & File Management Tools (Batch + PowerShell)

Conjunto de scripts de automação em linha de comando (CMD Batch e PowerShell) desenvolvidos para otimização de fluxos operacionais, filtragem desduplicada de mídias e movimentação dinâmica de arquivos.

---

## 📁 Estrutura do Repositório

```text
system-automation-scripts/
│
├── batch/
│   ├── README.md                      <-- Documentação técnica dos scripts Batch
│   └── Contador_OCs_Videos.bat        <-- Contagem e desduplicação de vídeos + pendências
│
└── powershell/
    ├── README.md                      <-- Documentação técnica do módulo PowerShell
    ├── Organizar_Mover_Videos.ps1    <-- Script PowerShell com Regex e Try-Catch
    └── Executar_Organizador.bat       <-- Wrapper em Batch para execução com Bypass

    🛠️ Projetos Incluídos
1. Smart Video Occurrence & Task Counter (batch/Contador_OCs_Videos.bat)
Problema Resolvido: Contagem duplicada ou quadruplicada de uma mesma ocorrência gerada por gravações multi-canal de câmeras (CH1, CH2, CH3, CH4).

Solução: Filtragem inline via PowerShell para contabilizar apenas as tomadas do canal principal (CH1), desduplicando o volume de mídias e somando com as pendências de cada operador.

2. Automated Video File Organizer (powershell/)
Problema Resolvido: Erro humano e lentidão na triagem e movimentação manual de vídeos de monitoramento para diretórios de destino (OneDrive/SharePoint/Servidor).

Solução: Leitura dinâmica do diretório raiz, limpeza de códigos numéricos de pastas via Expressão Regular (-replace '^\d+\s+', ''), movimentação segura com tratamento de erros (Try-Catch) e exportação de relatório de auditoria (relatorio_envio.txt).
