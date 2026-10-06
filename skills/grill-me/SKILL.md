---
name: grill-me
description: Relentless round-based interview that sharpens a plan, design, or decision before code is written. Fire before any decisive architecture moment, choosing or restructuring folders and layers. Fire before writing or modifying any function that defines or changes business rules, domain invariants, policies, limits, quotas. Also when the user asks to be grilled or stress-tested ("me grille", "questiona esse plano", "stress-test"). Fires mid-task: pause and interview instead of assuming.
---

# Grill Me

Interrupt the flow and interview the user relentlessly until the decision in front of you is sharp. This skill exists because agents guess: they pick a pricing formula, a permission model, a module boundary, and keep moving. A guess baked into the domain or the architecture is the failure this skill prevents.

## When to fire

Fire when the next thing you are about to do is one of:

- **An architecture decision**: drawing a module or service boundary, designing a data model or schema, choosing a library, framework, or database, designing an API contract, deciding state management, placing a seam or abstraction, restructuring folders or layers.
- **A business rule**: writing or modifying logic for pricing, discounts, taxes, billing, permissions, roles, authorization, feature gating, validation, workflow or state transitions, domain invariants, policies, refunds, limits, quotas, or any calculation that changes what the system does for the business.
- **Explicitly requested**: the user asks to be grilled, stress-tested, or challenged on a plan or idea.

Calibration, so the skill never becomes noise: do **not** fire when the change is mechanical, obviously reversible, and the path is already clear (renaming, formatting, wiring, a bug fix with an agreed cause, plumbing with no rule content). When genuinely in doubt, fire: one short round is cheap; a wrong invariant is not.

## Entering mid-task

You will usually fire in the middle of ongoing work. Pause there. State in one line what decision you are about to make and why it warrants grilling (in the user's language: "isso define regra de cobrança, vou te grillar antes de escrever"), then start round 1. Never implement while a session is open.

## The session

Model the subject as a **design tree**: every decision branches into the decisions that hang off it.

Work the tree in **rounds**. The **frontier** is every decision whose prerequisites are already settled: the questions you can ask _now_ without guessing at answers you have not heard. Ask the whole frontier in one round; never put two dependent questions in the same round.

Format a round like so:

```
❓ **Q1** - **<título>**: <corpo da pergunta, com opções quando fizer sentido>

➡️ <sua resposta recomendada, com o porquê>

---

❓ **Q2** - **<título>**: <corpo>

➡️ <recomendação>
```

Conduct the interview in the user's language (default: português do Brasil). The user answers a round by number ("1 sim, 2 a opção B, 3 não, porque...").

Each round's answers reshape the tree: settled decisions push the frontier outward and unblock the questions that depended on them. Recompute the frontier from scratch before each round. A later round that could have been asked in round 1 means the frontier was computed lazily: that is a bug in the run.

**Facts are yours, decisions are the user's.** When a frontier question needs a fact from the environment (what the code currently does, what a library supports, what the schema looks like), go find it yourself: read the code, dispatch a sub-agent. Never ask the user something you could have looked up. Do not block the round on research: only the questions downstream of a running lookup wait; ask the rest of the frontier now. The decisions are the user's, every one of them. A session where you answered your own decision question is a broken session.

Every question carries your recommended answer (➡️). Make it a real opinion with a reason, not a hedge. If your honest recommendation is "this question is wrong" or "do not decide this now", say exactly that in the recommendation.

## ADR signal

The session itself is stateless: it writes nothing. At the end, for each settled decision that passes all three tests:

1. **Hard to reverse**: the cost of changing your mind later is meaningful.
2. **Surprising without context**: a future reader will ask "why did they do it this way?"
3. **A real trade-off**: there were genuine alternatives and one was picked for specific reasons.

...offer to record it as an ADR (`docs/adr/NNNN-slug.md`). Write it only if the user says yes. A decision failing any test stays in the conversation.

## Ending

The session ends when the frontier is empty: every branch visited, nothing left silently assumed. Then:

1. Summarize the shared understanding as a compact decision list.
2. Wait for the user to confirm it.
3. On confirmation, resume the interrupted task with the decisions applied. Resuming on your own initiative, without the confirmation, is a broken session.
