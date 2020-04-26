
--
-- Assignment : 4
-- Author : FIRAS ABOUSHAMALAH : 250-920-750
-- Email : fabousha@uwo . ca
--
-- This function will take two integers and give the product of the two, recursively.
--


-- assigning a variables "odds" to print 1-10 odd numbers
odds = [x | x <- [1, 3, 5, 7, 9]]

-- assigning a variable "positiveEvens" to display an infinite list restricted by the user to print even numbers from 2-n
positiveEvens = [x | x <- [2..], even x]

-- assigning a var "powersOfTwo" to display an infinite list restricted by user to print powers from 2^0-2^n
powersOfTwo = [2^x | x <- [0..]]
--
--
-- the first function which creates the list of prime numbers with the restriction that they are prime via "isPrime x"
firstNPrimes n = take n [x | x <- [2..], isPrime x]
-- checks if the number is prime or not
isPrime k = null [ x | x <- [2..k - 1], k `mod` x == 0]