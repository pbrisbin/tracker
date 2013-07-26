module Tracker.Value (getValue) where

import Control.Arrow ((>>>))
import Data.Maybe (listToMaybe)
import Text.HandsomeSoup
import Text.XML.HXT.Core

getValue :: String -- ^ Url
         -> String -- ^ Selector
         -> IO (Maybe String)
getValue url selector = do
    contents <- runX $ fromUrl url >>> css selector //> getText

    return . listToMaybe $ filter present contents

    where
        present :: String -> Bool
        present = not . all (`elem` " \r\n\t")
