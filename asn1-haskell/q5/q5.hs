
--
-- Assignment : 4
-- Author : FIRAS ABOUSHAMALAH : 250-920-750
-- Email : fabousha@uwo . ca
--
-- The insert function takes a parameter and outputs an array. The parameter is placed in the proper sequence in terms of ordering.
--

insert :: Ord a => a -> [a] -> [a]  -- the function can work for any type a
insert x [] = [x] -- If it's an empty list than simply return whatever the insert value is
insert x (y:ys)   -- 
 | x < y     = x:y:ys  -- first guard for the function which states that if x is less than the head of the list insert it at the front
 | otherwise = y:(insert x ys)  -- second guard which recursively calls insert to place x after the first element, and keep comparing with next vals
--
--

-- the isort functions uses recursion with the helper function insert to sort an unordered list
isort :: Ord a => [a] -> [a] -- the function can work for any type a
isort [] = []  -- the empty list simply equals an empty list (base)
isort (x:xs) = insert x (isort xs)  -- otherwise, sort the list with x at the front and xs as the tail
									-- by calling insert which will remove the first element and compare it
									-- with the values in the list denoted by isort xs (tail). It will keep
									-- recursively updating the list until the head keeps getting taken off 
									-- and you reach the base case which is [] = [].