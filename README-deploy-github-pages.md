# Deploy para GitHub Pages

Este arquivo explica como publicar o projeto `Painel-corporativo` no GitHub Pages.

Pré-requisitos:
- Conta no GitHub
- `git` instalado
- Opcional: `gh` (GitHub CLI) para automatizar criação do repositório

Passos rápidos (modo manual):

1. Crie um repositório no GitHub (por exemplo `Painel-corporativo`).
2. No seu computador, na pasta do projeto, inicialize/prepare o git:

```powershell
git init
git add .
git commit -m "Initial commit: painel corporativo"
git branch -M main
git remote add origin https://github.com/<seu-usuario>/<seu-repo>.git
git push -u origin main
```

3. No GitHub, abra o repositório, vá em **Settings -> Pages** e configure a fonte (Source) para a branch `main` e pasta `/ (root)`. Salve.

4. Aguarde alguns minutos; a URL será `https://<seu-usuario>.github.io/<seu-repo>/`.

Usando o GitHub CLI (opcional):

Se você tem o `gh` configurado com sua conta, pode executar:

```powershell
gh repo create <seu-usuario>/<seu-repo> --public --source=. --remote=origin --push
```

Depois, configure Pages via interface do GitHub (Settings -> Pages) para usar `main`/`root`.

Testar localmente:

```powershell
# na pasta do projeto
python -m http.server 8000
# abra no navegador: http://localhost:8000
```

Abrir em modo quiosque (Chrome) — útil para TVs conectadas a um PC:

```powershell
start chrome --kiosk http://localhost:8000
```

Observações:
- Garanta que a pasta `images/` e `index.html` estejam versionadas e commitadas.
- Se preferir deploy automático (GitHub Actions), eu posso adicionar um workflow para publicar na branch `gh-pages`.