<h1>Github.ahk</h1>
<h3>A modular library to download latest releases from the github API, among other github timesavers. </h3>
<p class="has-line-data" data-line-start="1" data-line-end="2">
 
credit to JXON v2 creator https://github.com/TheArkive/JXON_ahk2

![image](https://github.com/samfisherirl/Github.ahk-API-for-AHKv2/assets/98753696/5f655888-1b12-40fa-8844-33eaec1c6d41)


# AHK v2 Method list 

## Grab release object 
 
```autohotkey

usr := "samfisherirl"
repo := "Github.ahk-API-for-AHKv2"

#Include %A_ScriptDir%\lib\github.ahk

latestObj := Github.latest(usr, repo)

```

## Check version data
 
```autohotkey

currentVersion := "v1"
if currentVersion != latestObj.version 
{
    MsgBox "Time for an update, latest version is " 
    . latestObj.version " updated on " latestObj.date "`nNotes:`n" 
    . latestObj.change_notes "`n`nLink: " latestObj.DownloadURLs[1]
}

```

## Download release
 
```autohotkey

userResponse := MsgBox(
    	 "Github.ahk-API-for-AHKv2's latest update is dated:`n"
    	latestObj.date "`nVersion: " latestObj.version 
    	"`nWould you like to download?",, '36')

if (userResponse = "Yes"){
	Github.Download(latestObj.downloadURLs[1], A_ScriptDir "\download")
	;latestObj.downloadURLs[] = array of release files - IE
	;latestObj.downloadURLs[1] = url to => "releasev1.1.zip" 
	;latestObj.downloadURLs[2] = url to => "releasev1.1.rar"
}

for url in latestObj.downloadURLs {
    if InStr(url, ".zip") {
        Github.download(url, A_ScriptDir) 
        break
    }
}

```

## Check version data
 
```autohotkey

currentVersion := "v1"
if currentVersion != latestObj.version 
{
    MsgBox "Time for an update, latest version is " 
    . latestObj.version " updated on " latestObj.date "`nNotes:`n" 
    . latestObj.change_notes "`n`nLink: " latestObj.DownloadURLs[1]
}

```

## Check version data
 
```autohotkey

currentVersion := "v1"
if currentVersion != latestObj.version 
{
    MsgBox "Time for an update, latest version is " 
    . latestObj.version " updated on " latestObj.date "`nNotes:`n" 
    . latestObj.change_notes "`n`nLink: " latestObj.DownloadURLs[1]
}

```

## Download source data and historic releases
 
```autohotkey

Github.Source(usr, repo, A_ScriptDir "\main.zip")
; download main branch source code

; Multiple Assets use-case
; enumerate ==ALL Historic Releases==
repo_string := ""
for repo in Github.historicReleases(usr, repo) {
    /* 
        downloadURLs: [],
        version: "",
        change_notes: "",
        date: ""  
    */
    repo_string .= repo.name " version " repo.version " was released on " repo.date "`nUpdate notes: `n" 
    repo_string .= repo.change_notes "`nDownload Link: " repo.downloadURL "`n`n"
}
MsgBox(repo_string)


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
```
 
  
