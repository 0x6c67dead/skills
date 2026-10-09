---
name: learn
description: Full technical teaching session that amplifies the user's knowledge of a technology topic — spaced-recall warmup, calibration, first-principles deep dive, recall quiz, persistent cheatsheet. Fire when the user asks how something technical works or what it is ("como funciona X", "me explica X", "o que é X"), wants to learn or deepen a topic ("quero entender X", "me ensina X", "nunca entendi X direito", "quero dominar X", "/learn X"), or a technical concept surfaces mid-work and the user engages beyond the task ("peraí, isso aqui é o quê exatamente?"). Not for quick factual lookups with no learning intent.
argument-hint: "assunto que você quer aprender"
---

# Learn

A technical topic surfaced and the user wants to actually understand it, not get a lookup answer. Run one complete teaching session: warm up with due reviews, calibrate, derive the topic from first principles, quiz for retention, leave a persistent cheatsheet. One session = one topic, closed with a tangible artifact.

## When to fire (and when not to)

Fire on learning intent:

- Concept questions: "como funciona X?", "me explica X", "o que é X?" — about the mechanism, not about unblocking a task.
- Explicit intent: "quero aprender/entender/dominar X", "me ensina X", "nunca entendi X direito", "/learn X".
- A concept surfaces mid-work and the user engages beyond the task ("peraí, isso é o quê exatamente?").

Do not fire when the user needs a fact to unblock work (flag, syntax, error message) and shows no curiosity about the mechanism. Ambiguous? One line: "resposta rápida ou sessão de aprendizado?" If firing would hijack ongoing work, offer to defer — the topic goes to Pending in the profile and they call `/learn` later.

## The learning home

All persistent state lives in one portable directory: `$LEARNING_HOME`, default `~/Projetos-pessoais/learning`. Create it lazily on first write. Read `PROFILE.md` before anything else: it knows what the user has learned, what is due for review, and what was deferred. Format in [references/PROFILE-FORMAT.md](./references/PROFILE-FORMAT.md). Nothing else is written until a topic is promoted.

## Session flow

Always a complete session, however it fired:

1. **Recall warmup (1–2 min).** If the review queue has due topics, ask 2–3 open recall questions on them — retrieval from memory, not recognition. Immediate feedback. Success advances the interval (1d → 7d → 30d → consolidated); a miss resets to 1d. Then the day's topic.
2. **Calibration (first contact with the topic only).** One question: "o que você já sabe de X?" — a 0–10 plus a sentence. Topic already in the profile? Skip: use the recorded level.
3. **Explanation — first principles, deep, dense.**
   - **Derive, never declare.** Start from fundamentals the user already holds; reach the concept by consequence. Every rule is a conclusion, not a fact to memorize. Anchor example of the right depth: containers are not explained as a concept — they are derived from the Linux primitives they are made of (namespaces for isolation, cgroups for limits).
   - **Deep from the start.** Internals, trade-offs, why this design won over the alternatives, edge cases and failure modes. No shallow tour followed by an offer to go deeper — go.
   - **Dense.** Short sentences, bullets, tables for comparisons. No narrative padding.
   - Language: português do Brasil, technical terms in English.
4. **Recall quiz.** 2–3 open questions forcing retrieval of what was just derived ("por que X se comporta assim sob Y?"). One at a time, feedback after each.
5. **Cheatsheet.** Compress the session into `cheatsheets/<slug>.md`, designed for a 30-second revisit. Format in [references/CHEATSHEET-FORMAT.md](./references/CHEATSHEET-FORMAT.md).
6. **Profile update.** Record the topic, level and date; schedule the first review at +1d.

## Sources

Stable fundamentals (algorithms, theory, consolidated concepts) come from model knowledge. Moving targets (versions, tooling, ecosystem, benchmarks, anything recent) come from the web, cited — never trust parametric knowledge for what changed after training. If uncertain or challenged on a claim, verify before teaching it. Cite sources in the cheatsheet; never fabricate a citation.

## Communities

If the topic has a genuinely high-reputation community (official forum, high-signal subreddit), one line in the cheatsheet. No generic list-building, no pushing the user to join.

## Promotion to workspace

A recurring topic — second session, or the user says "quero dominar isso" — earns a full workspace at `$LEARNING_HOME/topics/<slug>/`: mission, learning records, glossary, HTML lessons. Offer it; promote only on an explicit yes. Formats in [references/WORKSPACE-FORMAT.md](./references/WORKSPACE-FORMAT.md).

## Ending

Close by stating the cheatsheet path and what is due for review next. A session that taught and forgot — no artifact written, no profile updated — is a broken session.
