def hello := "world"

@[extern "my_add"]
opaque myAdd (x y : UInt32) : UInt32

@[extern "random_num"]
opaque randomNum : IO UInt64

-- @[extern "my_lean_fun"]
-- opaque exampleIo : IO PUnit
