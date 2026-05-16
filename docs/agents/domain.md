# Domain Docs

How the engineering skills should consume this repo's domain documentation when exploring the codebase.

## Layout

This repo uses a single-context layout.

## Before exploring, read these if they exist

- **`CONTEXT.md`** at the repo root.
- **`docs/adr/`** for ADRs that touch the area you're about to work in.

If these files don't exist, proceed silently. Don't flag their absence or suggest creating them upfront. The `grill-with-docs` skill creates them lazily when terms or decisions actually get resolved.

## Use the glossary's vocabulary

When your output names a domain concept in an issue title, refactor proposal, hypothesis, or test name, use the term as defined in `CONTEXT.md`. Don't drift to synonyms the glossary explicitly avoids.

If the concept you need isn't in the glossary yet, either reconsider whether you're inventing language the project doesn't use, or note the gap for the `grill-with-docs` skill.

## Flag ADR conflicts

If your output contradicts an existing ADR, surface it explicitly rather than silently overriding it:

> _Contradicts ADR-0007 — but worth reopening because..._
