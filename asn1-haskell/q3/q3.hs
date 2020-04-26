--
-- Assignment : 4
-- Author : FIRAS ABOUSHAMALAH : 250-920-750
-- Email : fabousha@uwo . ca
--
-- This function will take two integers and give the product of the two, recursively.
--


-- definition of the function saying that we will be using only integers
pow' :: Integer -> Integer -> Integer

-- base case
pow' a 0 = 1

-- matching a b to represent a^b, calling pow' recursively to keep multiplying a by itself b-1 times
pow' a b = a * pow' a (b-1)

