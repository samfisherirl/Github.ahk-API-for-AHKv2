# github.ahk
Github.ahk - Download latest releases from repositories 

rep := "samfisherirl/Geo3D_Manager"
;        username   /   repository

git := new Github(rep)
;object :=  class(variable)

git.DL("geo")
; downloads latest release as "geo.7z" accounting for variable extension 
; (geo can be replaced with any name)

releasename := git.name()

file_to_Save := A_AppDataCommon "\" releasename
;DL to "C:\programdata\geomanager.7z"
; this accounts for file name extension variable

msgbox % file_to_Save

git.DL(file_to_Save)
;object
 
 
; long version of above dl option
;         you need the proper extension ^     

;    Return URL of Latest Release Version
msgbox % git.release()
 
;    return version of latest release tag
msgbox % git.tag()

msgbox % git.name()
