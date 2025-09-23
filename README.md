# DNSParser
**DNSParser** é uma ferramenta em Bash que recebe uma URL ou domínio, extrai subdomínios, resolve seus IPs e gera uma saída organizada em colunas. Ideal para recon, mapeamento de domínios e análises rápidas de rede. Simples, rápida e fácil de usar.

---

## Funcionalidades

- Resolve domínios e subdomínios para IPs.
- Gera saída formatada com colunas: **Line**, **IP** e **ADDRESS**.
- Permite pesquisas sequenciais de múltiplos domínios sem reiniciar o script.
- Salva os resultados em arquivos `.txt` organizados.

---

## Pré-requisitos

- Sistema operacional Linux ou macOS.
- Bash instalado (normalmente já incluso na maioria das distribuições).
- Ferramentas de rede: `wget`, `host`, `grep`, `awk`, `cut`, `sort`, `paste`.

> **Observação:** Todas essas ferramentas são padrão em distribuições Linux, como Ubuntu, Kali, Fedora, etc.

---

## Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/gabr14l-f4r14s/DNSParser
   cd DNSParser
   ```
   
## Uso:

```bash
chmod +x DNSParser.sh
./DNSParser.sh exemplo.com
```
