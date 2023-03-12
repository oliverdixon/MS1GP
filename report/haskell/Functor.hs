type Functor :: (* -> *) -> Constraint
class Functor (f :: * -> *) where
        fmap :: (a -> b) -> ( f a -> f b ) -- The curried form of fmap.
        (<$) :: a -> f b -> f a
        {-# MINIMAL fmap #-}

instance Functor [] -- The list constructor is an exemplary Functor!
instance Functor Maybe -- Maybe is used for controlling uncertainty.

