;using this repo as an example: https://github.com/samfisherirl/Github.ahk-API-for-AHKv2
;credit: https://github.com/TheArkive/JXON_ahk2
;credit: https://github.com/thqby/ahk2_lib

#Include %A_ScriptDir%\lib\github.ahk

git := Github("samfisherirl", "Github.ahk-API-for-AHKv2")

latest := git.latest()
; Download(latest.downloadURLs[1], A_ScriptDir) first download (good enough for single file releases)
/*
    git.latest() returns {
        downloadURLs: [],
        version: "",
        body: "",
        date: ""
    }  
*/
for url in latest.downloadURLs {
    if InStr(url, ".zip") {
        git.download(url, A_ScriptDir) 
        break
    }
}
; object := Gitub(Username, Repository)


; just a name can be passed. extension will be handled.
; this will get saved to A_ScriptDir

git.Source(A_ScriptDir "\main.zip")
; download main branch source code

; Multiple Assets use-case
; enumerate ==ALL Historic Releases==
repo_string := ""
for repo in git.historicReleases() {
    /*  downloadURL: "",
        version: "",
        body: "",
        date: "",
        name: ""  */
    repo_string .= repo.name " version " repo.version " was released on " repo.date "`nUpdate notes: `n" 
    repo_string .= repo.change_notes "`nDownload Link: " repo.downloadURL "`n`n"
}
MsgBox(repo_string)

URL := git.searchReleases("v2")
; InStr search through each Release name first, then falls back on URL.
; First match returns the url for Download, then use that below:
git.Download("path.zip", URL)

/*
Latest version, great for storing and checking for updates.
*/
