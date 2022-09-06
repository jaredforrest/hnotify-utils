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
notifytime time = blankNote { appName = "Date and Time",
 summary=currtime time,
 body=(Just $ Text ("The current time is " ++ currtime time) ),
 appImage=(Just $ Icon "clock") }

currtime :: ZonedTime -> String
currtime time = formatTime defaultTimeLocale "%R" time
