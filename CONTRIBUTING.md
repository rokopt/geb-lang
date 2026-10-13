# Rules for contributors

## Style

### Conduct

- In addition to [Geb's code of conduct](./CODE_OF_CONDUCT.md), adhere to:
  - [mathlib's code of conduct](https://github.com/leanprover-community/mathlib4/blob/master/CODE_OF_CONDUCT.md)
  - [cslib's code of conduct](https://github.com/leanprover/cslib/blob/main/CODE_OF_CONDUCT.md)

### General style

- Always seek opportunities to make new definitions higher-order. For example,
  (category-theoretic) composition itself is functorial, so definitions by
  composition are often opportunities to define functors which inherit properties
  from the functoriality of composition without requiring explicit proof.
- Definitions should almost always be compositions of exactly two previous ones.
  Compositions of three or more tend to hide intermediate concepts, of their own
  independent significance, comprised of the internal pairwise compositions.

### Tools

When allowed tools generate code, curate it for adherence to the style
guidelines, such as refactoring opportunities.

- [Canonical](https://github.com/chasenorman/CanonicalLean) is configured in
  the committed `lakefile.toml`; consider using it for program and proof
  synthesis.
- Consider using the [Lean 4 VSCode extension](https://github.com/leanprover/vscode-lean4)
  if it is compatible with your development environment.
- You might also find ways of using SAT/SMT solvers, in particular via Lean
  integration, to synthesize Geb proofs and programs (since the reference Lean
  interpreter knows Geb terms and their Lean interpretations).

### Lean style

When writing Lean:

- Use [Verso markup](https://verso.lean-lang.org/doc/latest/Verso-Markup/#verso-markup).
- When introducing or extending concepts, add to the reference manual under
  `Geb/Manual` to explain and index them.
- Whenever not explicitly overridden by Geb style guidelines, adhere to:
  - [Lean's/mathlib's style guidelines](https://leanprover-community.github.io/contribute/style.html)
  - [cslib's style guidelines](https://github.com/leanprover/cslib/blob/main/CODESTYLE.md)

## AI / LLM use
