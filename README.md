# my-skills

Skills pessoais para uso nos meus projetos. Este repo é o source of truth; a instalação é por symlink, então `git pull` atualiza tudo.

Padrões e inspiração adaptados de [mattpocock/skills](https://github.com/mattpocock/skills) (repo de referência clonado em `~/Projetos-pessoais/skills`).

## Skills

| Skill | O que faz | Invocação |
| --- | --- | --- |
| [grill-me](skills/grill-me/SKILL.md) | Entrevista implacável em rodadas que afia decisões de arquitetura e regras de negócio antes do código ser escrito. Dispara sozinha nos momentos decisivos; stateless, sinaliza ADR no fim. | Automática (model-invoked) |
| [rfc](skills/rfc/SKILL.md) | Escreve, revisa adversarialmente e evolui RFCs antes de designs não triviais — proposta com alternativas descartadas, veredito binário, extração de ADRs e disciplina de status (`draft/accepted/rejected/superseded`). | Automática (model-invoked) |
| [learn](skills/learn/SKILL.md) | Sessão completa de ensino técnico que amplia conhecimento sobre qualquer assunto de tecnologia: recall espaçado na entrada, calibração, deep dive por primeiros princípios (deriva o conceito das primitivas, ex. containers via cgroups/namespaces), quiz de recall e cheatsheet persistente. Perfil leve portátil em `$LEARNING_HOME` (default `~/Projetos-pessoais/learning`); tema recorrente promove a workspace completo. | Automática (model-invoked) |

## Instalação

```bash
./scripts/link-skills.sh
```

Cria symlinks de cada skill em `~/.zcode/skills` e `~/.agents/skills`. Reexecute depois de adicionar, remover ou renomear skills.

## Convenções

- **Model-invoked vs user-invoked**: skills automáticas (model-invoked) carregam descrições agressivas com gatilhos ricos, porque a `description` é o sinal primário de disparo. Skills que só fazem sentido manualmente usam `disable-model-invocation: true`.
- **Progressive disclosure**: `SKILL.md` enxuto (abaixo de ~100 linhas); profundidade vai em `references/` e o corpo aponta quando ler.
- **Autocontidas**: cada skill é completa em si; dependências entre skills viram instrução explícita de invocar via Skill tool, nunca referência cruzada de arquivos.
- **Criação preguiçosa**: nada de arquivo ou diretório antes de ter conteúdo real pra pôr nele.

## Roadmap

Próxima leva, vinda do repo de referência: `domain-modeling`, `codebase-design`, `code-review`, `tdd`. Depois: `diagnosing-bugs`, `wait-what`, `handoff`, `research`.

Pipeline de decisão acordado (2026-10-06): `grill-me` elicita → `rfc` materializa a proposta → revisão adversarial → ADRs destilam o que é durável → código consome o RFC aceito como brief.
