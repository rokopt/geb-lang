module

set_option doc.verso true

/-! # Initial classical test module -/

namespace ClassicalTest

/-- Test allowance of choice under the `Geb.Classical` directory.  -/
public theorem classicalProp {α : Prop} : Nonempty α → α := Classical.choice.{0}

end ClassicalTest
