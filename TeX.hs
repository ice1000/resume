{-# LANGUAGE LambdaCase #-}
module TeX where

import Control.Monad
import Control.Monad.Reader
import Data.Functor

data Mode = Chinese | English | Elaborated
  deriving (Eq, Ord, Show)

fileName :: Mode -> String
fileName Chinese    = "resume-cn.tex"
fileName English    = "resume.tex"
fileName Elaborated = "resume-elab.tex"

-- | The Resume Monad.
type Resume = Reader Mode String

cen :: String -> String -> Resume
cen c e = ask <&> \case
  Chinese -> c
  _       -> e

en :: String -> Resume
en = cen []

simple :: String -> Resume
simple s = ask <&> \case
  English -> s
  _       -> []

noSimple :: Resume -> Resume
noSimple s = ask >>= \case
  English -> pure []
  _       -> s

elab :: String -> Resume
elab s = ask <&> \case
  Elaborated -> s
  _          -> []

cn :: String -> Resume
cn = flip cen []

paragraph :: [Resume] -> Resume
paragraph [      ] = pure []
paragraph (r : rs) = f <$> r <*> paragraph rs
  where
    f "" b = b
    f a "" = a
    f a  b = a ++ "\n" ++ b

tex :: String -> String -> String -> Resume
tex n c e = do
  ce <- cen c e
  pure $ "\\" ++ n ++ "{" ++ ce ++ "}"

sec = tex "section"
url s = "\\url{" ++ s ++ "}"
github s = pure . url $ "https://github.com/" ++ s
bold s = pure $ "\\textbf{" ++ s ++ "}"
href s = "\\href{" ++ s ++ "}"

section :: String -> String -> [Resume] -> Resume
section c e = paragraph . (sec c e :)

date :: String -> String -> Resume
date y m = cen (y ++ "." ++ m) (m ++ "/" ++ y)

present :: Resume
present = cen "现在" "Present"

itemTeX :: String -> String -> Resume
itemTeX c e = paragraph
  [ pure "\\item"
  , (++ ":") <$> tex "textbf" c e
  ]

datedSection :: Resume -> Resume -> Resume
datedSection time describe = do
  x <- describe
  t <- time
  pure $ "\\datedsubsection{" ++ x ++ "}{" ++ t ++ "}"

start ~~ end = do
  y <- start
  z <- end
  pure $ y ++ " -- " ++ z

itemize :: [Resume] -> Resume
itemize rs = paragraph $
  [pure "\\begin{itemize}[parsep=0.25ex]"] ++ rs ++
  [pure "\\end{itemize}"]
