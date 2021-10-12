module Main where

import Data.Time.LocalTime
import Data.Time.Format
import DBus.Notify

main = do
 now <- getZonedTime
 client <- connectSession
 notification <- notify client $ notifytime now
 return ()

notifytime :: ZonedTime -> Note
notifytime time = blankNote { summary=currdateshort time,
 body=(Just $ Text ("The current date is " ++ currdatelong time) ),
 appImage=(Just $ Icon "calendar") }

currdatelong :: ZonedTime -> String
currdatelong time = formatTime defaultTimeLocale "%c" time

currdateshort :: ZonedTime -> String
currdateshort time = formatTime defaultTimeLocale "%A %e %B %Y" time
