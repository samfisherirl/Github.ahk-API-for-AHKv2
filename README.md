<h1>Github.ahk</h1>

<h3>
A Modular Library to Download latest releases from the github API, among other github timesavers. </h3>

<p class="has-line-data" data-line-start="1" data-line-end="2">

 ![image](https://user-images.githubusercontent.com/98753696/224391018-7596576e-e988-4d46-9242-33a667654ed5.png)

 #
credit to JXON v2 creator https://github.com/TheArkive/JXON_ahk2

# AHK v2 Method list 

```autohotkey
;credit to Jxon .ahk creator https://github.com/TheArkive/JXON_ahk2
;using this as an example: https://github.com/samfisherirl/github.ahk

#Include %A_ScriptDir%\lib\github.ahk
#Include %A_ScriptDir%\lib\JXON.ahk 

git := Github("samfisherirl", "Github.ahk")
; object := Gitub(Username, Repository)

git.download(A_ScriptDir "\release.zip") 
;object.download("filename for saving", OptionalURL := http://github.com....AssetUrl.zip)
;downloads the first, latest release file  

git.download("release")
; just a name can be passed. Releases have designated extensions (zip/exe), if a mismatch is provided, the method will overwrite the users extension. 
URL := git.searchReleases("v2")
; InStr search through each release URL and Asset name. First match returns the url for download, then use that below:
git.download("path.zip", URL)

For releaseName, releaseURL in git.AssetMap {
    Msgbox("Release name: " releaseName "`nCan be downloaded at: `n" releaseURL)
}

msgbox(git.Version)
/*
Latest version, great for storing and checking for updates.
*/

version := git.Version
urlforDL :=  git.FirstAssetDL
releaseNotes := git.details()
repoName := git.repo

msgstring := "Version "  . version . " of " . repoName . " has an update: `n" . releaseNotes

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

 
