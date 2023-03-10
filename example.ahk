#Include Json.ahk
#Include github.ahk
setworkingdir, %A_ScriptDir%
#SingleInstance, force
#NoEnv

; credit to https://github.com/clangremlini/OTA.ahk 
; credit to https://github.com/kurtmckee/ahk_json

;download the latest release from github with "git := new Github(rep)"

    path := A_Desktop

    Username := "samfisherirl"
    Repo := "github.ahk"

    Version := GitGetVersion(Username,Repo)
    Asset := GitGetAsset(Username,Repo)
    ReleaseUrl := GitGetReleaseUrl(Username,Repo)
    UpdateDetails := GitGetUpdateDetails(Username,Repo)

    message=
    (
    Below are details about the requested:
        - The current version is %version% 
            (great for apps that need to check for updates)
        - The release file is %asset%
        - The download link is %releaseurl%

        - The details of the update changes are:
            %UpdateDetails%
    )

    msgbox, %message%


    GitDownload("samfisherirl","github.ahk", Path)
    msgbox, Download Finished! 


; ###################################################

; object based examples

; ###################################################

git := new Github("samfisherirl/Geo3D_Manager")
;objectname :=  new Github(username"/"repository)

;alternately
rep := "samfisherirl/Geo3D_Manager"
;        username   /   repository
git := new Github(rep)

git.DL("geo") ; downloads the latest release, 
;saving to "geo.zip" relative path

; alternately
;

log := A_ScriptDir "\log.txt"
;designate a log location, 
;otherwise the script will 
;send log.txt to appdata   

git.upd(log)
;if log.txt is not empty, 
;and if version in log (v1.2) < (v1.3)
;downloads latest release  

;only check for update
if (git.checkupd(log)=1)
{
    msgbox you need an update! `nI will store version in %log% for when you check`n for an update, next time! 
    git.dlupdate(log)
}
