; https://www.autohotkey.com/boards/viewtopic.php?f=83&t=100197



#Include %A_ScriptDir%\lib\github.ahk
#Include %A_ScriptDir%\lib\JXON.ahk 


git := Github("samfisherirl", "Github.ahk")
; object := Gitub(Username, Repository)

git.download(A_ScriptDir "\release.zip")
/*
object.download("filename for saving", OptionalURL := http://github.com....AssetUrl.zip)
downloads the first, latest release file 
extension is taken care of due to variables
*/
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




;