--
-- Assignment : 4
-- Author : FIRAS ABOUSHAMALAH : 250-920-750
-- Email : fabousha@uwo . ca
--
-- 
--
-- merge function takes sorted arrays of size n and m
merge :: Ord a => [a] -> [a] -> [a]
merge ns [] = ns -- if merging array of size n with an empty array return array n
merge [] ms = ms -- if merging an empty array with array of size m return m
merge (n:ns) (m:ms) -- recursively calling merge on two sorted arrays of size n and m
 | n < m = n:merge ns (m:ms) -- if the head of n is less than the head of m then return n at the head and recursively call merge on the tail of n with array m
 | otherwise = m:merge (n:ns) ms -- else return the head of m and recursively call merge on the array n with tail m
--
--
--
-- this function takes ONE array and separates it into to halves, sorts them, then merges them back together, sorted.
msort :: Ord a => [a] -> [a]
msort [] = [] -- return the empty list when using msort on an empty list
msort [a] = [a] -- this allows the function to return the called arrays when checking comparison
--
msort ns = merge (msort (halfOne ns)) (msort (halfTwo ns)) --recursively calling msort on each half before merging them
--
halfOne ns = let {l = length ns} in take (div l 2) ns -- breaking the first half of the array and dividing it by 2
halfTwo ns = let {l = length ns} in drop (div l 2) ns -- breaking the second half of the array and div. by 2
--
