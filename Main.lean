import «RustFfiTest»
import Lake
open Lake DSL

def main : IO Unit := do
  IO.println s!"Hello, {myAdd 3 4}!"
  IO.println s!"random number is {(← randomNum)}"
  -- exampleIo
  IO.println s!"やあ、よくやったね"

-- #eval myAdd 23 321
