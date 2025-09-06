@echo off

REM Available Options:
REM -top <N>    - Show only top N characters
REM -rank <N>   - Show only characters at rank N or higher
REM -days <N>   - Show only characters which have played within the last N days
REM -path <dir> - Override the default location of the Multiplayer Accounts
REM -active <N> - Highlight characters that have logged in within the last N hours
REM -cheats <N> - Highlight cheaters, where N is the sensitivity (e.g. 30)
REM -nice <N>   - Run with lower CPU usage, for example: -nice 50
REM -sort <key>	- Sort characters by: Rank, Kills, Money, Time or Login
REM -nofile	- suppress the <!-- File: ... --> comment from HTML file


FLstat.exe -nice 20 -active 720 > middle.txt
copy /B header.htt+middle.txt+footer.htt flstat.html


REM Here are some other examples...
REM All of them can be used at once to create multiple files


REM FLstat.exe -sort Rank > middle.txt
REM copy /B header.htt+middle.txt+footer.htt flstat-rank.html


REM FLstat.exe -sort Kills > middle.txt
REM copy /B header.htt+middle.txt+footer.htt flstat-kills.html


REM FLstat.exe -sort Time > middle.txt
REM copy /B header.htt+middle.txt+footer.htt flstat-time.html


REM FLstat.exe -sort Login > middle.txt
REM copy /B header.htt+middle.txt+footer.htt flstat-login.html
