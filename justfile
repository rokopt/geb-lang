alias b := build
alias s := serve
alias u := update
alias c := clean
alias ub := update-and-build
alias bm := build-and-markdownlint
alias ubm := update-and-build-and-markdownlint

build:
	lake build
	lake lint
	lake shake
	lake exe axiom-audit --allow propext,Quot.sound
	lake exe lint-style
	lake build :literate
	lake build :literateHtml
	lake exe verso-html .lake/build/literate html
	DOCGEN_SRC=file lake build Geb:docs
	npx prettier --check .

update:
	lake update
	lake exe cache get
	npx prettier --write .

markdownlint:
	markdownlint-cli2

update-and-build: update build

build-and-markdownlint: build markdownlint

update-and-build-and-markdownlint: update build markdownlint

serve: build-and-markdownlint
	lake exe verso-serve html

clean:
	lake cache clean
	lake clean
