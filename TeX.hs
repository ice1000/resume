{-# LANGUAGE LambdaCase, PartialTypeSignatures #-}
module TeX where

import Control.Monad
import Control.Applicative
import Control.Monad.Reader
import Data.Functor

data Mode = Chinese | English | Elaborated
  deriving (Eq, Ord, Show)

fileName Chinese    = "resume-cn.tex"
fileName English    = "resume.tex"
fileName Elaborated = "resume-elab.tex"

-- | The Resume Monad.
type Resume = Reader Mode String

cen :: _ -> _ -> Resume
cen c e = ask <&> \case
  Chinese -> c
  _       -> e

en = cen []

simple :: _ -> Resume
simple s = ask <&> \case
  English -> s
  _       -> []

noSimple :: _ -> Resume
noSimple s = ask >>= \case
  English -> pure []
  _       -> s

elab :: _ -> Resume
elab s = ask <&> \case
  Elaborated -> s
  _          -> []

cn :: _ -> Resume
cn = flip cen []

paragraph :: [_] -> _
paragraph [      ] = pure []
paragraph (r : rs) = f <$> r <*> paragraph rs
  where
    f "" b = b
    f a "" = a
    f a  b = a ++ "\n" ++ b

tex n c e = do
  ce <- cen c e
  pure $ "\\" ++ n ++ "{" ++ ce ++ "}"

sec = tex "section"
url s = "\\underline{\\url{" ++ s ++ "}}"
github s = pure $ "https://github.com/" ++ s
bold s = pure $ "\\textbf{" ++ s ++ "}"
href s t = "\\underline{\\href{" ++ s ++ "}{" ++ t ++ "}}"

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

datedSection2 :: Resume -> _
datedSection2 = liftA2
  (\x t -> "\\datedsubsection{" ++ t ++ "}{" ++ x ++ "}")

datedSection :: Resume -> _
datedSection = liftA3
  (\x t z -> "\\datedsubsectionLinked{" ++ t ++ "~{\\small " ++ z ++ "}}{" ++ x ++ "}")

(~~) :: Resume -> _
(~~) = liftA2 (\y z -> y ++ " -- " ++ z)

itemize rs = paragraph $
  [pure "\\begin{itemize}"] ++ rs ++
  [pure "\\end{itemize}"]
enumerate rs = paragraph $
  [pure "\\begin{enumerate}"] ++ rs ++
  [pure "\\end{enumerate}"]
