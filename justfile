alias b := build
alias s := serve
alias u := update
alias c := clean
alias ub := update-and-build

build:
	lake build
	lake lint
	lake shake
	lake exe axiom-audit --allow propext,Quot.sound
	lake exe lint-style
	lake build :literate
	lake build :literateHtml
	lake exe verso-html .lake/build/literate html
	npx prettier --check .
	markdownlint-cli2

update:
	lake update
	lake exe cache get
	npx prettier --write .

update-and-build: update build

serve:
	lake exe verso-serve html

clean:
	lake cache clean
	lake clean
