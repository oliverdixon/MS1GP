type Functor :: (* -> *) -> Constraint
class Functor (f :: * -> *) where
        fmap :: (a -> b) -> ( f a -> f b )
        (<$) :: a -> f b -> f a

instance Functor [] -- The list constructor is an exemplary Functor!

