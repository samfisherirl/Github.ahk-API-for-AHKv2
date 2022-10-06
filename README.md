# Download latest releases from github with Objects or function

<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="githubahk_0"></a>github.ahk</h1>
<p class="has-line-data" data-line-start="1" data-line-end="2">
#Include Github.ahk - Download latest releases from repositories</p>


gui isnt necessary but this is all an exorsize for the most part. 

![image](https://user-images.githubusercontent.com/98753696/194333168-3e322b62-af10-4a2b-bf07-b29785f123ee.png)


#Include Json.ahk
#Include github.ahk
setworkingdir, %A_ScriptDir%
#SingleInstance, force
    #NoEnv

; credit to https://github.com/clangremlini/OTA.ahk 
; credit to https://github.com/kurtmckee/ahk_json

        rep := "samfisherirl/Geo3D_Manager"
 username   /   repository

        git := new Github(rep)
        ;object :=  new github(username"/"repository)

        git.DL("geo") ; downloads the latest release, saving to "geo.zip" relative path

"geo" is the file name of the latest release, extension is grabbed after download and push to working dir.

optional: choose local directory with next example

        releasename := git.name()   

        file_to_Save := A_AppDataCommon "\" releasename
        ;same as git.DL("geo") except choose the directory, using the git.name() object to grab the release file name, including extension and version data like "geo.v1.1.zip"  

        git.DL(file_to_Save)
        ;git.DL("geo") 

        ;Function example
        path := A_DesktopCommon
        GitDownload("samfisherirl","Geo3D_Manager", Path)
msgbox % file_to_Save
returns file name

   Return URL of Latest Release Version
        msgbox % git.release()

   return version of latest release tag
        msgbox % git.tag()

        msgbox % git.name()
