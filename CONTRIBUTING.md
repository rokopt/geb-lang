# Rules for contributors

## Notes

- By "code" below we usually mean anything original in the repository
  and the accompanying GitHub infrastructure (such as issues, PRs, and GitHub Pages),
  or offered for submission or posting there, including for example
  documentation and pull-request comments, unless the context clearly indicates
  otherwise.
- By "we" we may mean various different things including "the original author
  of Geb", "the maintainers with merge permissions at a given time", "an
  individual contributor", and "the community of contributors to Geb"; we hope
  the contexts make it clear which.

## Conduct and ethics

- Adhere to [Geb's code of conduct](./CODE_OF_CONDUCT.md), which
  is a version of the [Contributor Covenant](https://www.contributor-covenant.org/).
  (`mathlib` and `cslib`, which Geb depends on, also use (different) versions
  of the Contributor Covenant.) Any actions taken with respect to policies
  in this document are also themselves subject to the code of conduct.

- Geb is [free and open source software](https://en.wikipedia.org/wiki/Free_and_open-source_software)
  with a permissive [license](./LICENSE) (Apache 2.0) which grants
  use of the code without regard to purpose.
  As such we acknowledge that some may put it to uses which we consider
  unethical. We do not take this lightly, but we write Geb with the intent
  that its principal contribution be to promote reliable, robust engineering and
  communication, and with the belief that creation and preservation depend far
  more heavily on those qualities than does destruction (one failure of
  technology in service of destroying a relic leaves further attempts open;
  one failure to protect it consigns it to history), and that therefore the
  impact of our work will be strongly pro-social.

- This document addresses the content and provenance of contributions;
  the [code of conduct](./CODE_OF_CONDUCT.md) addresses broader concerns.

## Fluidity and uncertainty

In this section I'm writing as the original author at the time of the project's
inception.  This repository is in such an early state that I expect to remain
the only contributor or even would-be contributor for at least some months.
Furthermore, this document attempts to address some concerns which are new to
the entire world (especially [the section on AI use](#ai--llm-use)).
There are bound to be many omissions below, and some are intentional, where I
suspect that anything I specified now would be unlikely to survive first contact
with reality.

The willingness to be an early contributor therefore includes the acceptance
that there is much that we can only work out as we go, and some faith that we
shall. We will not treat prior contributors who adhered to old policies
as retroactively having violated new or changed ones. (Of course policy changes
may induce changes to previously-accepted _code_.)

## Style

### General style

- Always seek opportunities to make new definitions higher-order. For example,
  (category-theoretic) composition itself is functorial, so definitions by
  composition are often opportunities to define functors which inherit properties
  from the functoriality of composition without requiring explicit proof.
- Definitions should almost always be compositions of exactly two previous ones.
  Compositions of three or more tend to hide intermediate concepts, of their own
  independent significance, consisting of the internal pairwise compositions.
- Project communication is generally in English, though one intended
  language-level feature of Geb is that internal source code references are
  content-addressed by the form of the AST with names and comments as external
  data, so that nodes of the tree may have multiple annotations each, including
  for purposes such as having names and comments in multiple natural languages.

### Lean style

When writing Lean:

- Use [Verso markup](https://verso.lean-lang.org/doc/latest/Verso-Markup/#verso-markup).
- When introducing or extending concepts, add to the reference manual under
  `Geb/Manual` to explain and index them.
- Whenever not explicitly overridden by Geb style guidelines, adhere to:
  - [Lean's/mathlib's style guidelines](https://leanprover-community.github.io/contribute/style.html)
  - [cslib's style guidelines](https://github.com/leanprover/cslib/blob/main/CODESTYLE.md)
    (We are stricter in some cases; see in particular [below](#ai--llm-use).)
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

## Code review

When reviewing code (others' or your own), refer to this document, and the
documents to which this document refers (such as `mathlib`'s style guide),
for standards to ensure adherence to. And especially, as we formally verify the
properties of our code against mathematical specifications, ensure that
intended formalizations of standard mathematical concepts do faithfully
represent them. The compiler should detect when an alleged proof is incorrect
or incomplete, but it cannot discern when a definition fails to correspond to
a standard concept from mathematical literature that it intends to.

## AI / LLM use

- **Inclusion of generated content is forbidden**: We intend that it be possible
  to use Geb as a protocol for the sharing of formalizable knowledge across
  humanity. We would endanger this possibility if we were to include code which
  future generations might view as having been produced exploitatively.
  Consequently, we do not include code produced by such LLMs as exist at the time
  of the origin of this repository, or future ones similarly trained.
  By avoiding it we intend to constrain uses of outside work to "non-expressive"
  ones (we use the term as in [Fairness and Fair Use in Generative AI](https://ir.lawnet.fordham.edu/flr/vol92/iss5/7/))
  which neither infringe on copyright nor deprive creators of control of their
  original expression (that paper actually goes on to argue that at least
  some LLM training is non-expressive; we are more stringent). Our
  policies also attempt to minimize the risk of substitution for human labor;
  the language definition and reference compilers for Geb constitute a symbolic
  project close to the foundations of mathematics which lacks a place for the
  likes of visual art and music, but some risks remain, translation being one
  which is explicitly discussed below.

  There is one policy which may be viewed as an exception: for the
  present, we choose to treat automated translations of human-authored
  natural-language text between natural languages as also human-authored.
  See the discussion of such translation below.

  There are initiatives in some creative domains, such as
  [Fairly Trained](https://www.fairlytrained.org/), which, if analogues develop
  in software, might lead us to make explicit allowances in the future.
  (They _have_ certified at least one LLM, [KL3M](https://www.kl3m.ai/)
  -- see [their blog](https://www.fairlytrained.org/blog/newly-certified-models-march-24)
  -- but that model's site does not cite software development among its
  applications, and we think it unlikely to be applicable for us, so it does not
  yet confront us with making such a decision.)

  Some forms of editor autocompletion use LLM-generated text; disable these.

  We do hope that there will be future LLMs and AI architectures which only
  train on data explicitly licensed to be trained on (or explicitly for
  general classes of use which clearly include training), purely synthetic data
  whose ancestry traces only to such explicitly-usable data, and the like. We
  accept the possibility (and likelihood) that some future LLMs will be trained
  on Geb code itself, and hope that this will at least contribute to our
  principal aims by seeding them with reliable code.

- **Some uses without inclusion of generated content are allowed**: After
  considering some writings of creators and legal scholars, we refer especially
  to the [Authors Guild AI best practices](https://authorsguild.org/resource/ai-best-practices-for-authors/)
  in considering some uses of AI, and LLMs in particular, in the course
  of creating, to be acceptable. (In some cases we are more stringent:
  that article accepts some AI-generated writing under the condition of its
  disclosure; we make no mention of such disclosure except of
  natural-language translation, as we disallow all other inclusions in Geb of
  AI generations. We do not require attestation of compliance -- submission is
  an implicit promise thereof. We attempt to be nowhere _less_ stringent than
  the Guild, again aside from natural-language translation.)

  The scope of this document is only the acceptability of specific
  contributions to Geb; there are, of course, other classes of arguments that
  can be applied even against these uses (for example, that the use of
  commercial LLMs provides economic support to practices which one considers
  harmful in any of many respects, or inherently unethical).

  For example:

  - _Code review_: Searching for and exposing errors is admirable. The
    Authors Guild writes that "AI-powered spelling and grammar checks, on the
    other hand, are ubiquitous and uniformly considered ethical and
    professional". We choose to treat bugs and style violations as software
    analogues. The review must be restricted to pointing out logical errors and
    style violations and refactoring opportunities and such, without offering
    replacement text. This also has an analogue from the Authors Guild's
    later-referenced comment on research use: "if you are careful not to copy
    from AI outputs". We could take that comment to allow code proposals as long
    as we do not take them literally, but the Guild cites non-literal as well as
    literal copying, and we are even more stringent and instruct the AIs not to
    produce code at all so as to avoid any question as to what would constitute
    copying it (and to avoid having to write sub-optimal code in case the AI
    proposes exactly what we would have favored ourselves!).

    In some small cases, merely pointing out an error or recommending
    a refactoring practically constitutes suggesting a replacement
    ("'evntually' is a misspelling", "this definition composes three concepts");
    this is inevitable and acceptable.

    Public comments such as on GitHub PRs are human communication; if our
    own LLM use uncovers errors in existing accepted or submitted code, we
    should seek (feeling free to solicit help if needed!) to understand
    them ourselves and then describe them in our own words.
    The allowance of natural-language auto-translation in particular might
    increase the difficulty of adhering to this requirement, as well as
    that of code reviewers' understanding submissions in general; early
    maintainers will likely simply have to choose (or not) to trust
    submitters and translations in some cases. This is an example of something
    we may have to work out as we go.

  - _Natural-language translation_: As an explicit exception, we choose to treat
    submissions authored by humans in one natural language and translated to
    another by AIs as human-authored and thus acceptable, in the name of
    accessibility to speakers of any language. We require disclosure of any
    such translation.

    Translation in particular _can_ substitute for human labor and is an
    explicit instance of [a likely-fluid policy](#fluidity-and-uncertainty);
    we expect that for a long time the project will be too small to provide
    a market and that the accessibility and inclusivity offered by automatic
    translations will far outweigh that consideration. Future growth of the
    project could well change this.

  - _Paper search_: For example, "I believe I recall a paper which
    lists the applications of the adjunction laws to program optimization,
    but I'm not recognizing it among the papers my searches are turning up;
    are you able to find any papers which might be the one I'm remembering?"
    This is also a software analogue of another part of the Authors Guild
    quote above ("as is the use of AI to research"). As with any external
    references, contributors must personally validate the faithfulness of
    any citations of papers turned up by such searches that they make in
    their submissions.
  - _Code search_: Similarly: for example, "I want to formalize the notion of
    `n`-fold category, without duplicating anyone else's work -- can you find
    any mechanical formalizations which already exist?" This includes the
    likes of [LeanExplore](https://arxiv.org/html/2506.11085v1), which
    searches for code for a user, and [LeanPremise](https://arxiv.org/html/2506.07477v2),
    which selects from among existing lemmas for a [hammer](https://cmu-l3.github.io/lean-hammer/)
    to use.
  - _Explanation of compatibly-licensed code or standard mathematical knowledge_:

    - "I'm having trouble following `cslib`'s multi-tape Turing machine code;
      could you walk me through it and explain how its structures correspond to
      standard concepts of computational complexity theory?" (Here the
      LLM might _point_ to code snippets, but may not generate them, to minimize
      copying risk, as with code review comments. Rules prescribed by the
      other code's license(s) naturally cover uses of it regardless of how the
      user comes across it.)
    - "I understand the literal meaning of `nlab`'s definition
      of 'extranatural transformation', but I can't get any intuition for why
      it's significant. Can you find me some references or exercises on their
      applications?"

    As with any other means of learning, submitters must reach the point of
    understanding the subject well enough to validate such explanations for
    themselves before using that understanding in their submissions.

- **Use by dependencies we accept**: In light of the volume of
  LLM-generated code, and of our dependencies, it is effectively certain
  that we will directly or indirectly depend on substantial and increasing
  quantities of code that we would not ourselves have accepted. In
  the long run, we hope to build as much of a self-hosting developer
  ecosystem (operating system, toolchain, and so on) as possible in Geb
  itself, but, as usual with history, absolute notions of purity are
  already out of reach.

- **We accept that we ourselves remember LLM-generated code**: We suspect
  that already, most active developers will have read LLM-generated code,
  and we will reflect (and sometimes reproduce, regardless of our intent not
  to) what we have read. We accept this.

- **We accept that automated labor is to some degree substitutive**: We
  explicitly note this in the discussion of natural-language translation above;
  wherever we do not, we are choosing to treat those allowed uses as amongst the
  kinds and magnitudes of things which are already established or imminently
  inevitable.

The [agent instructions](./AGENTS.md) in the repository direct agents
to follow the rules in this file. This does not represent an expectation that
a contributor use an agent, but an attempt to ensure compliance with the
policies in this file.

If you are considering a use which does not fall clearly into any of the
expressly-disallowed or expressly-allowed categories, submit or propose a
request for clarification rather than a questionable contribution.

If you suspect a violation, you may report it as with violations of the
[code of conduct](./CODE_OF_CONDUCT.md); if we conclude that an already-accepted
submission is likely in violation, we will remove it, and do some combination
of reimplementing its exported interfaces and removing any code that has come to
depend on that submission (in new versions, not rewriting history, which may
have many clones anyway).

Between the allowed applications and program-synthesis tools based on proof
theory rather than data sets, such as the aforementioned Canonical, we trust
that we will not be failing to use modern tools to assist human programmers in
writing -- even if, at times, more slowly than we might -- the finest code that
is currently possible.
