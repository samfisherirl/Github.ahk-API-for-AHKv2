<h1>Github.ahk</h1>
<h3>A Modular Library to Download latest releases from the github API, among other github timesavers. </h3>
<p class="has-line-data" data-line-start="1" data-line-end="2">
 
credit to JXON v2 creator https://github.com/TheArkive/JXON_ahk2

![image](https://github.com/samfisherirl/github.ahk/assets/98753696/536823be-20e6-43f2-a612-c780953e2bdf)

# AHK v2 Method list 

```autohotkey
;using this repo as an example: https://github.com/samfisherirl/Github.ahk-for-AHKv2
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
; object.Download("localpath", OptionalURL := http://github.com....AssetUrl.zip)
; Downloads the first, latest release file
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

 ```

# AHK v1 Method list:
        
```autohotkey
        using this url as an example: https://github.com/samfisherirl/github.ahk
        object: 
        git := new Github("username/repository") ;instantiate the object
        git.DL("geo") ; downloads the latest release, saving to "geo.zip" relative path, you can use any name. 
        git.release() ; Url of release 
        git.details() ; return changes made for latest update
        git.tag() ; returns only version number, ie "v1.2333", ideally for checking if update is necessary
        anyname := new Github("any_username/any_repo") 
        git := new Github("samfisherirl/github.ahk") ; example using this repository
#
```
 
  
