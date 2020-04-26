--
-- Assignment : 4
-- Author : FIRAS ABOUSHAMALAH : 250-920-750
-- Email : fabousha@uwo . ca
-- This function takes a string holding a hexadecimal number and converts it to decimal base
--
import Data.Char(toUpper)
--
-- helper function which maps all 15 numbers from hexadecimal to decimal
hexChange :: Char -> Integer
hexChange ch
    | ch == '0' = 0
    | ch == '1' = 1
    | ch == '2' = 2
    | ch == '3' = 3
    | ch == '4' = 4
    | ch == '5' = 5
    | ch == '6' = 6
    | ch == '7' = 7
    | ch == '8' = 8
    | ch == '9' = 9
    | ch == 'A' = 10
    | ch == 'B' = 11
    | ch == 'C' = 12
    | ch == 'D' = 13
    | ch == 'E' = 14
    | ch == 'F' = 15
    | ch == 'X' = 0
    | ch == 'x' = 0
    | otherwise = error "Non - hexadecimal digits present"

-- this helper function translates all A-F to lowercase if they exist by recursion
upper [] = []
upper (s:ss) = toUpper(s):upper(ss)

--this is the main function which computes the decimal equivalent.
hexStrToDec :: String -> Integer
hexStrToDec hexNum 
    | not (null hexNum) = hexChange(last(upper(hexNum))) + (16 * hexStrToDec(init(upper(hexNum))))
    | otherwise          = 0  