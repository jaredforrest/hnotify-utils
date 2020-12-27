{-# LANGUAGE DeriveGeneric #-}

import Data.Aeson
import Data.Text
import qualified Data.ByteString.Lazy as B
import GHC.Generics
import DBus.Notify

data Email =
  Email { authors :: Text
        , subject :: Text
        } deriving (Show,Generic)

instance FromJSON Email

main :: IO ()
main = do
 myJSON <- B.getContents
 let d = eitherDecode myJSON 
 case d of
  Left err -> putStrLn err
  Right ps -> printNotify ps

printNotify :: [Email] -> IO ()
printNotify [] = return ()
printNotify (email:emails) = do
 client <- connectSession
 notification <- notify client $ notifyemail email
 printNotify emails
        
notifyemail :: Email -> Note
notifyemail email = 
 blankNote { summary="New Email"
           , body=(Just $ Text ("From: " ++ unpack (authors email) ++ "\nSubject: " ++ unpack (subject email) ) )
           , appImage=(Just $ Icon "internet-mail")
           , expiry=(Milliseconds 20000) }
