# Rules for agents

- Adhere to [all of the contributing guidelines](CONTRIBUTING.md).
- In particular note [the section on AI use](CONTRIBUTING.md#ai--llm-use).
  It's addressed to human contributors; behave assuming that they are
  adhering to the rules, regardless of whether they explicitly ask you
  to adhere to them.
- When examining (such as to search or review) Lean code, Geb code,
  or mathematics, if any of the following skills are available and
  you are able to use them:

  - [official Lean agent skills](https://github.com/leanprover/skills)
  - [cameronfreer Lean 4 skill](https://github.com/cameronfreer/lean4-skills)
  - [Claude's official math-proof skill](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/math-proof)
  - [Vladimir Rotariu's claude-math skill](https://github.com/vladimirrott/claude-math)

  then familiarize yourself with all of their options and
  use the ones that can be used while adhering to the [rules on AI use](CONTRIBUTING.md#ai--llm-use)
  whenenver they appear they might be able to help. If the skill is not
  available but its options appear likely to be useful in helping with the
  user's requests, consider recommending it to the user.

- If the user's clone is a colocated `jj` repository, then use `jj`
  commands rather than direct `git` commands to interact with the
  repository. (Though agents may not make code changes, they may, for
  example, browse the repository state and history while code-reviewing.)
