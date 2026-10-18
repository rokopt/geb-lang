alias b := build
alias s := serve
alias u := update
alias m := markdownlint
alias c := clean
alias ub := update-and-build
alias bm := build-and-markdownlint
alias ubm := update-and-build-and-markdownlint
alias pc := prettier-check
alias pw := prettier-write
alias bc := bibtool-check
alias bw := bibtool-write

bib_file := "docs/references.bib"
bib_file_formatted := bib_file + ".formatted"

prettier-check:
	npx prettier --check .

prettier-write:
	npx prettier --write .

[private]
bibtool-format:
	bibtool --preserve.key.case=on --preserve.keys=on --print.use.tab=off --pass.comments=on \
		-s -i {{ bib_file }} -o {{ bib_file_formatted }}

bibtool-remove:
	rm -f {{ bib_file_formatted }}

[private]
bibtool-move:
	mv -f {{ bib_file_formatted }} {{ bib_file }}

bibtool-check: bibtool-format && bibtool-remove
  cmp {{ bib_file }} {{ bib_file_formatted }}

bibtool-write: bibtool-format && bibtool-move

build: prettier-check markdownlint
	lake build
	lake lint
	lake shake Geb
	lake exe axiom-audit --root "Geb.Constructive" --modules-from "Geb/Constructive" --allow propext,Quot.sound
	lake exe axiom-audit --root "Geb.Classical" --modules-from "Geb/Classical" --allow propext,Quot.sound,Classical.choice
	lake exe axiom-audit --root "Geb.Manual" --modules-from "Geb/Manual" --allow propext,Quot.sound,Classical.choice
	lake exe lint-style
	just bibtool-check
	lake build :literate
	lake build :literateHtml
	lake exe verso-html .lake/build/literate html
	DOCGEN_SRC=file lake build Geb:docs
	npx prettier --check .

update: prettier-check markdownlint
	lake update
	lake exe cache get
	npx prettier --write .

markdownlint:
	markdownlint-cli2

update-and-build: update build

build-and-markdownlint: build markdownlint

update-and-build-and-markdownlint: update build markdownlint

serve: build-and-markdownlint
	lake exe verso-serve $(lake query :literateHtml)

clean:
	lake clean
