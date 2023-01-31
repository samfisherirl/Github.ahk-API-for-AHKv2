# Download latest releases from github with Objects or function

<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="githubahk_0"></a>github.ahk</h1>
<p class="has-line-data" data-line-start="1" data-line-end="2">
#Include Github.ahk

#Include Json.ahk https://github.com/kurtmckee/ahk_json

A Modular Library to Download latest releases from github api and check version.

To initiate, you can download the latest release which generates code from a GUI, or see below image.
        
        
![Z80uAcG](https://user-images.githubusercontent.com/98753696/194636178-385c2dcb-1220-474c-b3ae-a09b33c94339.png)

        git := new Github("username/repository") 

        git.DL("geo") ; downloads the latest release, saving to "geo.zip" relative path
        
        function example:
        
        GitDownload("samfisherirl","github.ahk", Path)
        
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
         
saving to "geo.zip" relative path

alternately
     

        log := A_ScriptDir "\log.txt"
designate a log location, 
otherwise the script will 
send log.txt to appdata   

        git.upd(log)

 alternately
        git.upd("") 

 "geo" is the file name of the latest release, extension is `grabbed after download and push to working dir.`

 optional: choose local directory with next example

        releasename := git.name() 

         file_to_Save := A_AppDataCommon "\" releasename
 same as git.DL("geo") except choose the directory, using the git.name() object to grab the release file name, including extension and version data like "geo.v1.1.zip"  

        git.DL(file_to_Save) 
        git.DL("geo") 

 Function example
        path := A_DesktopCommon 
 
       msgbox % file_to_Save

returns file name

Return URL of Latest Release Version
         msgbox % git.release() 

 return version of latest release tag
        msgbox % git.tag() 

        msgbox % git.name() 
