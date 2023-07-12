<h1>Github.ahk</h1>
<h3>A Modular Library to Download latest releases from the github API, among other github timesavers. </h3>
<p class="has-line-data" data-line-start="1" data-line-end="2">
 
credit to JXON v2 creator https://github.com/TheArkive/JXON_ahk2

![image](https://github.com/samfisherirl/github.ahk/assets/98753696/536823be-20e6-43f2-a612-c780953e2bdf)

# AHK v2 Method list 

`array of latest release, and all files' URLs`
```autohotkey
git := Github("samfisherirl", "Github.ahk-API-for-AHKv2")
; object := Gitub(Username, Repository)

ar := git.releaseURLArray()
for downloadLink in ar
{
    MsgBox(downloadLink)
}
 ```
`Map of latest release URLs`

```autohotkey
m := git.releaseURLMap()
for fileName, downloadLink in m
{
    if InStr(fileName, "v2") {
        MsgBox(fileName "`n" downloadLink)
        Download(downloadLink, A_ScriptDir)
        break
    }
}
```

`enumerate historic releases`
```autohotkey
; enumerate ==ALL Historic Releases==
repo_string := ""
for repo in git.historicReleases() 
{
    /*  downloadURL: "",
        version: "",
        body: "",
        date: "",
        name: ""  */
    repo_string .= repo.name " version " repo.version " was released on " repo.date "`nUpdate notes: `n" 
    repo_string .= repo.change_notes "`nDownload Link: " repo.downloadURL "`n`n"
}
MsgBox(repo_string)
```

`current source zip`
```autohotkey
git.Source(A_ScriptDir "\main.zip")

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
 
  
