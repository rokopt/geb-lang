module

public import Geb.Constructive.Basic
public import Geb.Classical.Basic

set_option doc.verso true

/-!

#  Manual title page
Title page of Geb reference manual.

## Test section

We can refer to Lean code such as {name}`ClassicalTest.classicalProp`,
including by unqualified names such as
{name (full := ConstructiveTest.constructiveHello)}`constructiveHello`.

We can also write our own Lean code:
-/

/-- Here's a test declaration, for example: -/
def titlePageTest : String := "Title Page Test"

/-!
We can then follow up with further stuff.
-/
