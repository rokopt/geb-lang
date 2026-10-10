alias b := build
alias s := serve
alias u := update
alias c := clean

build:
	lake build
	lake lint
	lake shake
	lake exe axiom-audit
	lake exe lint-style
	lake build :literate
	lake build :literateHtml
	lake exe verso-html .lake/build/literate html
	npx prettier --check .

update:
	lake update
	lake exe cache get

serve:
	lake exe verso-serve html

clean:
	lake cache clean
	lake clean
