rem Eventlog xpath filter
rem Events/ev:Event[ev:System/ev:Provider/@Name='MSSQLSERVER' and ev:System/ev:EventID='18210']

for %i in (System, Application) do wevtutil qe %i /r:SOMESERVERNAME /q:"*[System[(Level=1 or Level=2 or Level=3) and TimeCreated[@SystemTime>='2014-07-01T08:00:00.000Z']]]" >>

wevtutil qe Application /q:"*[System[(Level=1 or Level=2 or Level=3) and TimeCreated[@SystemTime>='2014-01-01T08:00:00.000Z']]]"

wevtutil qe Application /q:"*[System[(Level=1 or Level=2 or Level=3) and (EventID!=1111 or EventID!=56 or EventID!=7034 or EventID!=36 or EventID!=1530 or EventID!=47) and TimeCreated[@SystemTime>='2014-01-01T08:00:00.000Z']]]"

wevtutil {qe | query-events} <Path> [/lf:<Logfile>] [/sq:<Structquery>] [/q:<Query>] [/bm:<Bookmark>] [/sbm:<Savebm>] [/rd:<Direction>] [/f:<Format>] [/l:<Locale>] [/c:<Count>] [/e:<Element>]
