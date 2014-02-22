
{-
1. 编译
 $ ghc todo.hs 

2. 在同级目录下建立todo.txt
3. 使用范例：
 $ todo add "wash"
 $ todo view 
You have 1 todo items:
1 - wash
 $ todo remove 1
 $ todo view 
You have 0 todo items

-}

-- Todo list manager

import Data.List
import System.Directory
import System.Environment
import System.IO

-- View
enumerate = zipWith (\i l -> show i ++ " - " ++ l) [1..]

-- lines: creates an array of string from the original one, 
-- new line characters serving as separators
viewTodos filename _ = do
    content <- readFile filename
    let todos = lines content
    putStrLn $ "You have " ++ (show $ length todos) ++ " todo items:"
    mapM_ putStrLn $ enumerate todos

-- Add
-- 如果没有换行符就加上换行符
ensureEOL text
    | "\n" `isSuffixOf` text = text
    | otherwise = text ++ "\n"

addTodo filename [text] = appendFile filename (ensureEOL text)


-- Remove
deleteIndex i lst
    | i < length lst = take i lst ++ drop (i+1) lst
    | otherwise = error "deleteIndex: index too large"

removeTodo filename [index] = do
    content <- readFile filename
    let indexNo = (read index) - 1
        todos = lines content
        todos' = deleteIndex indexNo todos
    (tmpFile, tmpHandle) <- openTempFile "." filename
    hPutStr tmpHandle (unlines todos')
    hClose tmpHandle
    renameFile tmpFile filename


dispatch = [("view", viewTodos),
            ("add", addTodo),
            ("remove", removeTodo)
           ]

filename = "todo.txt"
main = do
    args <- getArgs
    let (cmd:xs) = args
        (Just action) = lookup cmd dispatch
    action filename xs
