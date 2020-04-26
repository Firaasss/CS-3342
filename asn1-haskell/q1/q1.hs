--
-- Assignment : 4
-- Author : FIRAS ABOUSHAMALAH : 250-920-750
-- Email : fabousha@uwo . ca
--
-- This function will take two integers and give the product of the two, recursively.
--


-- definition of the function saying that we will be using only integers
mult :: Integer -> Integer -> Integer
mult a b

-- first guard which recursively calls mult to keep multiplying the numbers until it reaches the base case b equals 0.
 | b > 0         = a + mult a (b-1)
 | otherwise     = 0