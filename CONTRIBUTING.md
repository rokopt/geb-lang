# Rules for contributors

## Conduct and ethics

- In addition to [Geb's code of conduct](./CODE_OF_CONDUCT.md), adhere to:

  - [mathlib's code of conduct](https://github.com/leanprover-community/mathlib4/blob/master/CODE_OF_CONDUCT.md)
  - [cslib's code of conduct](https://github.com/leanprover/cslib/blob/main/CODE_OF_CONDUCT.md)

  All of these are versions of the [Contributor Covenant](https://www.contributor-covenant.org/).

- Geb is [free and open source software](https://en.wikipedia.org/wiki/Free_and_open-source_software).
  As such we acknowledge that some may put it to unethical uses (whatever one's
  ethics). We do not take this lightly, but rather write Geb with the intent
  that its principal contribution be to promote reliable, robust engineering and
  communication, and with the belief that creation and preservation depend far
  more heavily on those qualities than does destruction, and that therefore the
  impact of our work will be strongly pro-social.

  Accordingly, we write all our code with that intent in mind.

## Style

### General style

- Always seek opportunities to make new definitions higher-order. For example,
  (category-theoretic) composition itself is functorial, so definitions by
  composition are often opportunities to define functors which inherit properties
  from the functoriality of composition without requiring explicit proof.
- Definitions should almost always be compositions of exactly two previous ones.
  Compositions of three or more tend to hide intermediate concepts, of their own
  independent significance, comprised of the internal pairwise compositions.

### Lean style

When writing Lean:

- Use [Verso markup](https://verso.lean-lang.org/doc/latest/Verso-Markup/#verso-markup).
- When introducing or extending concepts, add to the reference manual under
  `Geb/Manual` to explain and index them.
- Whenever not explicitly overridden by Geb style guidelines, adhere to:
  - [Lean's/mathlib's style guidelines](https://leanprover-community.github.io/contribute/style.html)
  - [cslib's style guidelines](https://github.com/leanprover/cslib/blob/main/CODESTYLE.md)
- We interpret Geb's logics into Lean; when we define known concepts in Geb,
  we use Lean, `mathlib`, and `cslib` to prove that the Geb concepts correspond
  to the known concepts that we intend. For example, if we define a notion
  of a category internal to Geb's metalogic, then we prove that the Lean
  interpretation of that Geb notion is an instance of `mathlib`'s `Category`.
- We avoid use of `Classical` (usually meaning `Classical.choice`) insofar as
  possible. It may be unavoidable when attempting to prove that one of our
  concepts defined in Geb corresponds to Lean's standard libraries' definition,
  as the latter definition itself may depend on `Classical.choice`. In such
  cases, we define and prove as much as possible without using
  `Classical.choice`, and place that development under `Geb/Constructive`,
  then place what inevitably depends on `Classical.choice` under
  `Geb/Classical`, keeping that code as close to being mere wrappers around
  `Geb/Constructive` code to instantiate the Lean-library concepts.

## Tools

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

## AI / LLM use
