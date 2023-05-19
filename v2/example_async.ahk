﻿;using this repo as an example: https://github.com/samfisherirl/Github.ahk-for-AHKv2
;Async can provide more stable Download success. 
;credit: https://github.com/TheArkive/JXON_ahk2
;credit: https://github.com/thqby/ahk2_lib

#Include %A_ScriptDir%\lib\github.ahk
#Include %A_ScriptDir%\lib\WinHttpRequest.ahk
#Include %A_ScriptDir%\lib\DownloadAsync.ahk
#Include %A_ScriptDir%\lib\JXON.ahk

git := Github("samfisherirl", "Github.ahk-API-for-AHKv2")
; object := Gitub(Username, Repository)

git.Download(A_ScriptDir "\release.zip")
;object.Download("localpath", OptionalURL := http://github.com....AssetUrl.zip)
;Downloads the first, latest release file
; Releases have designated extensions (zip/exe)
; if a mismatch is provided, the method will overwrite the users extension.

git.Download("release2")
; just a name can be passed. extension will be handled.
; this will get saved to A_ScriptDir

; Multiple Assets use-case

; enumerate ==ALL Historic Releases==
enumerateReleases(git.historicReleases())

URL := git.searchReleases("v2")
; InStr search through each Release name first, then falls back on URL.
; First match returns the url for Download, then use that below:
git.Download("path.zip", URL)

; enumerate assets available in latest release
enumerateReleases(git.LatestReleaseMap)


enumerateReleases(MapParam) {
    msg := ""
    for releaseName, releaseURL in MapParam
    {
        msg .= ("Release name, date and update notes: " releaseName "`nCan be Downloaded at: `n" releaseURL "`n`n")
    }
    MsgBox(msg)
}

version := git.Version
urlforDL := git.FirstAssetDL
releaseNotes := git.details()
repoName := git.repo

msgstring := "Version " . version . " of " . repoName . " has an update: `n" . releaseNotes

msgstring .= "`nIt can be Downloaded at " urlforDL
msgbox(msgstring)
/*
Latest version, great for storing and checking for updates.
*/
