<h1>Github.ahk</h1>
<h3>A Modular Library to Download latest releases from the github API, among other github timesavers. </h3>
<p class="has-line-data" data-line-start="1" data-line-end="2">
 
credit to JXON v2 creator https://github.com/TheArkive/JXON_ahk2

![image](https://github.com/samfisherirl/github.ahk/assets/98753696/536823be-20e6-43f2-a612-c780953e2bdf)

# AHK v2 Method list 

```autohotkey
;using this repo as an example: https://github.com/samfisherirl/Github.ahk-for-AHKv2
#Include %A_ScriptDir%\lib\github.ahk
#Include %A_ScriptDir%\lib\JXON.ahk

git := Github("samfisherirl", "Github.ahk-for-AHKv2")
; object := Gitub(Username, Repository)

git.download(A_ScriptDir "\release.zip")
;object.download("localpath", OptionalURL := http://github.com....AssetUrl.zip)
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

; enumerate ==ALL Historic Releases==
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
 
 
Gui built for generating code in object form:


![Z80uAcG](https://user-images.githubusercontent.com/98753696/194636178-385c2dcb-1220-474c-b3ae-a09b33c94339.png)

 
