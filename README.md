<h1>Github.ahk</h1>

<h3>
A Modular Library to Download latest releases from github api and check version. </h3>

# 

Download latest releases from github with classes or functions, including version details to perpetually ensure the application is updated.

<p class="has-line-data" data-line-start="1" data-line-end="2">

#Include Json.ahk https://github.com/kurtmckee/ahk_json

 #
 
3/10/23 update: Additional functions for easy use, added and tested. 

To initiate, you can download the latest release which generates code from a GUI, or see below image.

Quick function list:
    ;using this url as an example
    ;https://github.com/samfisherirl/github.ahk
 
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
 
 ![image](https://user-images.githubusercontent.com/98753696/224391018-7596576e-e988-4d46-9242-33a667654ed5.png)

#

        

        
How to download latest github release:
        
        
        using this url as an example: https://github.com/samfisherirl/github.ahk
 
        object: 
        
        git := new Github("username/repository") ;instantiate the object


        git.DL("geo") ; downloads the latest release, saving to "geo.zip" relative path, you can use any name. 
        
        anyname := new Github("any_username/any_repo") 
        
        git := new Github("samfisherirl/github.ahk") ; example using this repository

#
 
 if you want to store version tag in log, use this instead. It will check for log, store version, only download if version != log...
        
        log := A_ScriptDir "\log.txt" designate a log location, otherwise the script will send log.txt to appdata

        git.upd(log)
 
 
Gui built for generating code in object form:


![Z80uAcG](https://user-images.githubusercontent.com/98753696/194636178-385c2dcb-1220-474c-b3ae-a09b33c94339.png)

alternately

        git := new Github("samfisherirl/Geo3D_Manager")
           objectname :=  new Github(username"/"repository)


         rep := "samfisherirl/Geo3D_Manager"
         
username   /   repository

         git := new Github(rep) 

         git.DL("geo")` ; downloads the latest release, 
 
