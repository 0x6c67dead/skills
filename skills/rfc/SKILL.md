---
name: rfc
description: Write, adversarially review, or advance an RFC before non-trivial design and implementation. Fire when the user asks for a proposal or design ("propõe", "desenha", "pensa como fazer X", "como atacar esse problema"), mentions an RFC or design doc, or when about to start work that crosses module boundaries, changes a public contract, schema or invariant, or needs a migration and no accepted RFC covers it. Also fire to stress-test an existing RFC ("revê esse RFC", "acha furo nessa proposta") or to record its verdict (accept, reject, supersede).
---

# RFC

Turn a design into a written proposal before it becomes code — with the alternatives that lost and the reasons why. The audience is future-you and the agents: this is the artifact that stops sessions from re-guessing what was already decided. RFC propõe, código dispõe: it is a plan and a context anchor, never a contract.

## Calibration (tiers)

- **Tier 0** — mechanical, reversible, path clear: no RFC. Just code.
- **Tier 1** — one hard-to-reverse decision, local shape: no RFC either. Invoke the Skill tool with `grill-me`, record an ADR if it passes the tests.
- **Tier 2** — design contained in one module: short RFC, half a page.
- **Tier 3** — crosses module boundaries, changes a public contract, schema or invariant, or needs migration: full RFC.

Never write an RFC for a throwaway prototype or spike: the value of a spike is not planning. In doubt, a short draft is cheap; a wrong invariant is not.

## Pipeline position

The RFC does not replace the interview — it records what the interview settled. If the design still has decisions only the user can make, invoke the Skill tool with `grill-me` first. An RFC that synthesizes your own guesses instead of settled decisions is a broken RFC.

## Writing

1. Gather the facts yourself before drafting: read the code, check what the schema really looks like. Never put a question in the user's mouth that you could have looked up.
2. Write to `docs/rfcs/NNNN-slug.md` in the project being changed — next free number, zero-padded (`0001`, `0002`…). Create the directory on first use. Write in the user's language (default: português do Brasil).
3. Draft the whole document in one pass. If it balloons past ~2 pages, the problem is granularity: split the RFC, don't stretch the writing.
4. Status block at the very top, always current:

```
Status: draft | accepted | rejected | superseded (by NNNN)
Date: YYYY-MM-DD
```

Template:

```markdown
# <título>

Status: draft
Date: YYYY-MM-DD

## Contexto
O que existe hoje e por que dói. Fatos, não opinião — cite a realidade do código.

## Problema
Um parágrafo, na perspectiva de quem sofre o problema.

## Objetivos / Non-goals
O que este design resolve — e, tão importante, o que explicitamente não resolve.

## Solução proposta
O design: fronteiras, interfaces, invariantes, estados. Prosa acima de código;
inlinie um snippet apenas quando uma forma codifica a decisão melhor que prosa
(schema, máquina de estados, tipo) — só as partes ricas em decisão.

## Alternativas consideradas
Seção não negociável: mínimo de 2 alternativas reais, cada uma com o porquê de
ter perdido. É a seção de maior valor do RFC: revela se o design foi escolhido
ou foi só o primeiro que veio, e imuniza contra re-litigar no futuro.

## Riscos
O que pode dar errado, raio de explosão, mitigações.

## Rollout / Migração
Como aterra: passos e caminho de rollback.

## Open questions
O que ficou deliberadamente indeciso, e o que destrava cada item.
```

## Adversarial review

When the user asks to review an RFC, or right after drafting one, attack the document — not the user. Hunt: assumptions that break on contact with the code, edge cases, what this design breaks elsewhere, missing alternatives, untestable claims, holes in the migration or rollback path, scope smuggled into the solution. Every finding cites the section it attacks.

You propose findings and amendments; the user disposes. A review where you silently rewrote the RFC is a broken review.

## Verdict & lifecycle

- The verdict is binary and dated: `accepted` or `rejected`. "Accepted with concerns" is rejected with homework.
- On acceptance, offer one ADR (`docs/adr/NNNN-slug.md`) per decision inside the RFC that passes all three tests: hard to reverse; surprising without context; a real trade-off. Write an ADR only on an explicit yes.
- Rejected RFCs stay in the repo: they are immunity against re-litigating. Never delete one.
- If implementation diverges from the RFC, update it or append one paragraph saying why. Supersede openly — new RFC, `Status: superseded (by NNNN)` in the old one — never edit history silently.
- Stale discipline is load-bearing: agents read `docs/rfcs/` as truth. An RFC whose status lies poisons every session that trusts it.

## Ending

An accepted RFC is the implementation brief. Close by summarizing: verdict, ADRs recorded, and where the RFC lives — so the next session reads it instead of re-deriving the design.
