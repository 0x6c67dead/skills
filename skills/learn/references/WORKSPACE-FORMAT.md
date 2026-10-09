# Workspace Format (promoted topics)

A topic is promoted to `$LEARNING_HOME/topics/<slug>/` when it recurs (second session, or "quero dominar isso"). The workspace is the full teaching apparatus, adapted from the `teach` skill. Everything below is created lazily: a file exists only when it has content.

## MISSION.md

Why the user is learning this. Every future session in the workspace traces back to it.

```md
# Mission: <tema>

## Why
<1–3 frases: o resultado concreto. "Shipar X", não "entender X".>

## Success looks like
- <coisa observável que o usuário conseguirá fazer>

## Constraints
- <prazos, tempo disponível, preferências>

## Out of scope
- <tópicos adjacentes explicitamente fora por enquanto>
```

Push back on vagueness: interview before writing. One mission per workspace; revise when reality shifts — never leave a stale mission steering sessions. Keep it under a screen.

## learning-records/NNNN-slug.md

The ADR-equivalent of learning: what became known and why it changes what to teach next.

```md
# <o que foi aprendido/estabelecido>

1–3 frases: o quê e por que muda as próximas sessões.
```

Write one only when the user **demonstrated** non-obvious understanding, disclosed prior knowledge (with depth), had a misconception corrected, or shifted the mission. Coverage is not learning — wait for evidence. Number sequentially from the highest existing. A later record that corrects an earlier one marks it `Status: superseded by LR-NNNN`; never delete history.

## GLOSSARY.md

The canonical language of the workspace. Add a term only once the user can use it correctly; 1–2 sentences defining what it IS; when several words name the same concept, pick the best and list the rest as `_Avoid_` aliases. Use the glossary's own terms inside definitions. Revise in place as understanding deepens.

## lessons/NNNN-slug.html + assets/

From promotion onward, sessions can be written as self-contained HTML lessons: one tightly-scoped thing each, beautiful and printable (think Tufte), linked to each other, to the cheatsheet and to the glossary. Every lesson recommends one primary source and reminds the user the agent is the teacher for follow-ups.

Reusable components (shared stylesheet, quiz widget, diagram helpers) live in `assets/` and are shared across lessons: reuse is the default — never inline what a second lesson would duplicate. A shared stylesheet is the first component every workspace earns, so lessons look like one course, not a pile of one-offs.

## Promotion rules

- Offered by the skill, accepted explicitly by the user. Never promoted silently.
- On promotion, set `Estado: promoted` in the profile; the **review queue stays in PROFILE.md** as the single driver of warmups.
- Workspace topics still get cheatsheets: the cheatsheet is the fast lane, the workspace is the deep lane.
