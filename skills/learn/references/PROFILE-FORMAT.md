# PROFILE.md Format

`PROFILE.md` is the single file of persistent state in the learning home. It tracks what the user has learned, what is due for review, and what was deferred. Read it at the start of every session; update it in the same session that changes the facts.

## Structure

```md
# Learning Profile

## Topics
| Tema | Slug | Nível | Última sessão | Estado |
| --- | --- | --- | --- | --- |
| Event loop do JS | event-loop-js | 7 — usa diário, nunca leu a spec | 2026-10-09 | active |
| Kubernetes networking | k8s-networking | 2 — só conceitos soltos | 2026-10-08 | promoted |

## Review queue
| Tema | Próxima revisão | Intervalo | Erros |
| --- | --- | --- | --- |
| Event loop do JS | 2026-10-10 | 1d | 0 |

## Consolidated
- <tema> (clearou 30d em YYYY-MM-DD) — <o que grudou, uma linha>

## Pending
- <tema> (oferecido em YYYY-MM-DD)
```

## Field rules

- **Slug**: the cheatsheet filename stem, and the workspace folder name if promoted.
- **Nível**: the calibration answer, kept verbatim enough to steer depth next time.
- **Estado**: `active` (in the review cycle) | `promoted` (has a workspace) | `consolidated` (left the queue).
- **Intervalo**: `1d → 7d → 30d → consolidated`. Success in the warmup advances; a miss resets to 1d and increments `Erros`.

## Rules

- **One file, no sprawl.** Everything the skill remembers lives here until a topic is promoted. No per-topic files outside `cheatsheets/`.
- **Dates are absolute** (YYYY-MM-DD) — the queue does not work on "yesterday".
- **A topic with 3+ misses is a promotion candidate**: interest is high, retention is not. Offer the workspace.
- **Pending hygiene**: surface pending topics at the start of a session; drop one after the user declines twice.
- **Stale queue = broken warmup.** Update the file in the session that changed the facts, never after.
