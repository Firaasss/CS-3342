--
-- Assignment : 4
-- Author : FIRAS ABOUSHAMALAH : 250-920-750
-- Email : fabousha@uwo . ca
--
-- This function will take two integers and give the product of the two, recursively.
--


-- definition of the function saying that we will be using only integers
pow :: Integer -> Integer -> Integer
pow a b

-- first guard which recursively calls pow to keep repeating the guard case until it keeps decrementing b.
 | b > 0         = a * pow a (b-1)
 | otherwise     = 1