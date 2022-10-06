# Download latest releases from github with Objects

<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="githubahk_0"></a>github.ahk</h1>
<p class="has-line-data" data-line-start="1" data-line-end="2">
#Include Github.ahk - Download latest releases from repositories</p>
       ; credit to https://github.com/clangremlini/OTA.ahk 
        ; credit to https://github.com/kurtmckee/ahk_json

        rep := "samfisherirl/Geo3D_Manager"
        ;        username   /   repository

        git := new Github(rep)
        ;object :=  new class(username"/"repository)

        git.DL("geo")
        ; "geo" is the file name of the latest release, extension is  
        ; grabbed after download and push to working dir.

        ; optional: choose local directory with next example

        releasename := git.name()   

        file_to_Save := A_AppDataCommon "\" releasename
        ;same as git.DL("geo") except choose the directory, using the git.name() 
        ;object to grab the release file name, 
        ;including extension and version data like "geo.v1.1.zip"  

        git.DL(file_to_Save)
        ;git.DL("geo") 

        ; msgbox % file_to_Save
        ; returns file name



        ;    Return URL of Latest Release Version
        msgbox % git.release()
        
        ;    return version of latest release tag
        msgbox % git.tag()

        msgbox % git.name()
