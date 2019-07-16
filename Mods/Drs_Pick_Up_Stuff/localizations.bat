@echo off
for %%I in (.) do set CurrDirName=%%~nxI
IF NOT EXIST "Localization.txt" goto errorfile
IF NOT EXIST "..\..\data\config\Localization.txt" goto errorlocation
IF EXIST "Localization.txt" goto fileconfirmed
:fileconfirmed
IF EXIST "..\..\data\config\Localization.txt" goto confirmed
:errorlocation                                                                    
color 17
echo It looks like you are trying to run the batch script from a different location. Make sure this mod in the correct location.
echo.
goto end
:errorfile                                                              
color 17
echo Well... it seems we are missing the follwoing files:
echo.
IF NOT EXIST "Localization.txt" echo Localization.txt
echo.
echo Make sure you have these files in the same place you are running this script.
echo Also make sure you haven't renamed them either.
echo.
goto end
:confirmed
pause
echo.                                                                       
echo.
for %%I in (.) do set CurrDirName=%%~nxI
echo.
echo.
echo.
echo.
echo.
echo This will load up the localization data for the mod "Drs_Pick_Up_Stuff".
echo.
echo.
echo.
echo.
echo.
echo Excellent, I see the localization file to append and I also see we are in the correct location.
echo.
echo This should be compatible with other batch scripts to append the data.
echo Please note the key word "SHOULD".
echo.
echo This script does make a backup of the current Localization file before it does anything. 
echo.
:start
echo.
echo Please type the number of your choice.
echo 1: Continue
echo 2: Quit
echo 3: Restore a backup if one exists
set /p choice=Option: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto install
if '%choice%'=='2' goto end
if '%choice%'=='3' goto restore
ECHO "%choice%" Choice is not valid, try again
ECHO.
goto start
:install
IF EXIST "Localization.txt" copy "..\..\data\config\Localization.txt" "..\..\data\config\Localization.txt.bak"
copy "..\..\data\config\Localization.txt" LocalizationTEMP.txt
del "..\..\data\config\Localization.txt"
FINDSTR /v "cinderBlocks driftwoodDesc driftwood2Desc emberPileDeco scrapMetalPileDesc --Drs_Pick_Up_Stuff" LocalizationTEMP.txt > "../../data/config/Localization.txt"
type localization.txt >> "../../data/config/Localization.txt"
del "LocalizationTEMP.txt"
echo Finished
goto end
:restore
IF NOT EXIST ..\..\data\config\Localization.txt.bak echo Localization backup does not exist
IF EXIST ..\..\data\config\Localization.txt.bak echo Restoring backuped up file.
IF EXIST ..\..\data\config\Localization.txt.bak copy "..\..\data\config\Localization.txt.bak" "..\..\data\config\Localization.txt"
IF EXIST ..\..\data\config\Localization.txt.bak del "..\..\data\config\Localization.txt.bak"
:end
pause

