;using this repo as an example: https://github.com/samfisherirl/github.ahk

#Include %A_ScriptDir%\lib\github.ahk
#Include %A_ScriptDir%\lib\JXON.ahk

git := Github("samfisherirl", "Github.ahk-for-AHKv2")
; object := Gitub(Username, Repository)

git.download(A_ScriptDir "\release.zip")
;object.download("filename for saving", OptionalURL := http://github.com....AssetUrl.zip)
;downloads the first, latest release file

git.download("release")
; just a name can be passed. Releases have designated extensions (zip/exe)
; if a mismatch is provided, the method will overwrite the users extension.

; Multiple Assets use-case
URL := git.searchReleases("v2")
; InStr search through each release URL and Asset name.
; First match returns the url for download, then use that below:
git.download("path.zip", URL)

; enumerate assets available in latest release
enumerateReleases(git.LatestReleaseMap)


; enumerate ==ALL History Releases==
enumerateReleases(git.historicReleases())
/*
Latest version, great for storing and checking for updates.
*/

enumerateReleases(MapParam) {
    msg := ""
    for releaseName, releaseURL in MapParam
    {
        msg .= ("Release name and date: " releaseName "`nCan be downloaded at: `n" releaseURL "`n`n")
    }
    MsgBox(msg)
}

version := git.Version
urlforDL := git.FirstAssetDL
releaseNotes := git.details()
repoName := git.repo

msgstring := "Version " . version . " of " . repoName . " has an update: `n" . releaseNotes

msgstring .= "`nIt can be downloaded at " urlforDL
msgbox(msgstring)
/*
Latest version, great for storing and checking for updates.
*/
