import Data.Char
import System.Environment

tab :: Char
tab = (chr 9)

indent :: String -> Int -> String
indent s 0 = s
indent s x = '\9':(indent s (x-1))


countIndent :: String -> Int
countIndent [] = -100
countIndent ('\9':l) = 1 + countIndent l
countIndent (' ':' ':' ':' ':l) = 1 + countIndent l
countIndent l = 0

transform :: Int -> [String] -> [String]
transform 0 [] = []
transform curr [] = map (indent "}") [curr-1..0]
transform curr (line:lines) 
    | (indentation < 0) || (indentation == curr) = (line:(transform curr lines))
    | indentation - curr > 0 = map (indent "{") [curr..(indentation-1)] ++ (line:(transform indentation lines)) 
    | indentation - curr < 0 = map (indent "}") [(curr-1),(curr-2)..indentation] ++ (line:(transform indentation lines))
    where indentation = countIndent line

main :: IO ()
main = do
    [fin, fout] <- getArgs
    contentIn <- readFile fin
    print $ countIndent ((lines contentIn)!!10)
    let contentOut = unlines $ transform 0 $ lines contentIn
    writeFile fout contentOut


    

