type Monad :: (* -> *) -> Constraint
class Applicative m => Monad m where
        (>>=) :: m a -> (a -> m b) -> m b -- The fabled "bind" operator!
        return :: a -> m a -- Inject unstructured data into a monad
