--
-- Assignment : 4
-- Author : FIRAS ABOUSHAMALAH : 250-920-750
-- Email : fabousha@uwo . ca
--
--This program takes a string and modifies it to create a new l33t string.

import Data.Char(ord, chr)
--
--
toUpper n --change all consonants (if not already) to uppercase
 | (ord n > 96) && (ord n < 123) = chr(ord n - 32)
 | otherwise = chr(ord n)

isVowel n
 | (ord n == 79) = chr(ord n + 32) -- convert 'O' 'O' to 'o'
 | (ord n == 85) = chr(ord n + 32) -- convert 'U' to 'u'
 | (ord n == 65) = chr(ord n + 32) -- convert 'A' to 'a'
 | otherwise = chr(ord n)

alterChar n -- change the e's and i's to 3 and 1
 | (ord n == 101 || ord n == 69) = chr(51)
 | (ord n == 73 || ord n == 105) = chr(49)
 | otherwise = chr(ord n)

l33t :: String -> String
l33t [] = []
l33t (x:xs) = alterChar(isVowel(toUpper(x))):l33t(xs)

--isPoint :: Char -> String
--isPoint n
---(n == '!') = return "xxxx333"
---otherwise = return n