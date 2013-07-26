module Main where

import System.Environment (getArgs)
import Tracker.Value

main :: IO ()
main = do
    args <- getArgs

    case args of
        (url:selector:_) -> do
            mvalue <- getValue url selector

            case mvalue of
                Just value -> print value
                _          -> return ()

        _ -> putStrLn "usage: tracker <url> <css selector>"
