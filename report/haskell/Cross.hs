type (,) :: * -> * -> * -- The type signature of the tuple-builder
cross :: a -> b -> (a, b) -- Uncurried function signature
cross = (,) -- A trivial application of the binary packing function

