# Download latest releases from github with classes or functions, including self-application update. 

<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="githubahk_0"></a>github.ahk</h1>
<p class="has-line-data" data-line-start="1" data-line-end="2">
#Include Github.ahk

#Include Json.ahk https://github.com/kurtmckee/ahk_json

A Modular Library to Download latest releases from github api and check version.

To initiate, you can download the latest release which generates code from a GUI, or see below image.

Quick function list:
 
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



        
![Z80uAcG](https://user-images.githubusercontent.com/98753696/194636178-385c2dcb-1220-474c-b3ae-a09b33c94339.png)

        
How to download latest github release:
        
        
        using this url as an example: https://github.com/samfisherirl/github.ahk

        function example:
        
        GitDownload("samfisherirl","github.ahk", Path)

        object: 
        
        git := new Github("username/repository") ;instantiate the object


        git.DL("geo") ; downloads the latest release, saving to "geo.zip" relative path, you can use any name. 
        
        anyname := new Github("any_username/any_repo") 
        
        git := new Github("samfisherirl/github.ahk") ; example using this repository

        
 if you want to store version tag in log, use this instead. It will check for log, store version, only download if version != log...
        
        log := A_ScriptDir "\log.txt" designate a log location, otherwise the script will send log.txt to appdata

        git.upd(log)


        

 

credit to https://github.com/clangremlini/OTA.ahk 
credit to https://github.com/kurtmckee/ahk_json
 

        git := new Github("samfisherirl/Geo3D_Manager")
           objectname :=  new Github(username"/"repository)

alternately

         rep := "samfisherirl/Geo3D_Manager"
         
username   /   repository

         git := new Github(rep) 

         git.DL("geo")` ; downloads the latest release, 
 
