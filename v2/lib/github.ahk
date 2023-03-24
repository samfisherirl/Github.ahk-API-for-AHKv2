; credit to https://github.com/kurtmckee/ahk_json 
#Include Native.ahk



class Gitter {
    __new(val) {
        temp := A_ScriptDir "\temp.json"
        url := "https://api.github.com/repos/" val "/releases/latest"
        Download(url, temp)
        sleep(50)
        data := FileRead(temp)

        data := JSON.parse(data)
        ;filedelete, "1.json"
        this.DLUrl := data["assets"][1]["browser_download_url"]
        this.Asset := data["assets"][1]["name"]
        this.Vers := data["html_url"]
        this.body := data["body"]
        this.repo := StrSplit(val, "/")[2]
        this.username := StrSplit(val, "/")[1]
        ;this.Filetype := data["assets"][1]["browser_download_url"]
    }
    releaseUrl() {
        return this.DLUrl
    }
    name() {
        return this.asset
    }
    details() {
        return this.body
    }
    zipORexe() {
        Arrays := StrSplit(this.DLUrl, ".")
        filetype := Arrays[Arrays.Length]
        return filetype
    }
    version() {
        url := StrSplit(this.Vers,"/")
        version := url[8]
        return version
        ; msgbox % this.j[1].assets.name
        ; return this.j[1].assets.name
    }
    download(Name) {
        x := this.zipORexe()
        nameExt := Name "." x
        url := this.releaseUrl()
        Download(url, nameExt)
        if !InStr(nameExt, ":\")
            nameExt := A_ScriptDir . "\" . nameExt
        return nameExt
    }
    
 Github(Username, Repository_Name)
{
    ;GitDownload("samfisherirl","Geo3D_Manager", Path)
    val := Username "/" Repository_Name
    gg := Gitter(val)
    return gg
}
class JSON {
    static __New() {
        Native.LoadModule('.\' (A_PtrSize * 8) 'bit\ahk-json.dll', ['JSON'])
        this.DefineProp('true', {value: 1})
        this.DefineProp('false', {value: 0})
        this.DefineProp('null', {value: ''})
    }
    static parse(str) => Map() | Array()
    static stringify(obj, space := 0) => ''
}
