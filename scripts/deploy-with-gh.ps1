<#
  Script opcional para criar repositório e enviar o projeto usando GitHub CLI (`gh`).
  Uso: execute na raiz do projeto.
#>

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "GitHub CLI (gh) não encontrado. Instale em https://cli.github.com/ ou siga as instruções no README-deploy-github-pages.md" -ForegroundColor Yellow
    exit 1
}

param(
    [Parameter(Mandatory=$true)]
    [string]$RepoName,
    [string]$Visibility = "public"
)

Write-Host "Criando repositório $RepoName (visibilidade: $Visibility) e fazendo push..." -ForegroundColor Cyan

# Inicializa git se necessário
if (-not (Test-Path .git)) {
    git init
}

git add .
git commit -m "Initial commit: painel corporativo" -ErrorAction SilentlyContinue

# Forçar branch main
git branch -M main

# criar repo no GH e push
gh repo create $RepoName --$Visibility --source=. --remote=origin --push

if ($LASTEXITCODE -eq 0) {
    Write-Host "Repositório criado e push realizado com sucesso." -ForegroundColor Green
    Write-Host "Abra: https://github.com/$(gh api user --jq .login)/$RepoName/settings/pages" -ForegroundColor Cyan
} else {
    Write-Host "Ocorreu um erro ao criar/pushar o repositório. Verifique mensagens acima." -ForegroundColor Red
}
