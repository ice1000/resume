{-# LANGUAGE LambdaCase #-}
module Main where

import System.Environment
import Control.Monad.Reader
import Resume
import TeX (Mode (..))
import GHC.IO.Encoding

main :: IO ()
main = getArgs >>= \case
  ["cn"]   -> f Chinese
  ["en"]   -> f English
  ["elab"] -> f Elaborated
  _        -> putStrLn $ unlines
    [ "Usage: <program> MODE"
    , "MODE can be cn, en or elab"
    ]
  where
  f x = do
    setLocaleEncoding utf8
    putStrLn $ runReader resume x
