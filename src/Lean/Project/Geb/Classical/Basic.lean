module

set_option doc.verso true
set_option doc.verso.module false

/-! # Initial test module -/

/-- Test allowance of choice under the `Geb.Classical` directory.  -/
theorem classicalProp {α : Prop} : Nonempty α → α := Classical.choice.{0}
