; credit to https://github.com/kurtmckee/ahk_json

Github(Username, Repository_Name)
{
    ;GitDownload("samfisherirl","Geo3D_Manager", Path)
    usernamePlusRepo := Username "/" Repository_Name
    obj := GithubHandler(usernamePlusRepo)
    return obj
}
class GithubHandler
{
    __new(usernamePlusRepo) {
        temp := A_ScriptDir "\temp.json"
        url := "https://api.github.com/repos/" usernamePlusRepo "/releases/latest"
        data := this.jsonDownload(url)
        sleep(50)
        data := JXON_Load(&data)
        this.fileType := ""
        ;filedelete, "1.json"
        this.FirstAssetDL := data["assets"][1]["browser_download_url"]
        this.AssetJ := data["assets"]
        this.FirstAsset := data["assets"][1]["name"]
        this.ReleaseVersion := data["html_url"]
        this.Version := this.getVersion()
        this.body := data["body"]
        this.repo := StrSplit(usernamePlusRepo, "/")[2]
        this.AssetMap := Map()
        this.AssetList := []
        this.DownloadExtension := ""
        this.assetProps()
        ;this.Filetype := data["assets"][1]["browser_download_url"]
    }
    jsonDownload(URL) {
        hObject := ComObject("WinHttp.WinHttpRequest.5.1") ;Create the Object
        hObject.Open("GET", URL) ;Open communication
        hObject.Send() ;Send the "get" request
        return hObject.ResponseText ;Set the "text" variable to the response

    }
    release() {
        return this.FirstAssetDL
    }
    name() {
        return this.FirstAssetName
    }
    details() {
        return this.body
    }
    assetProps() {
        for k, v in this.AssetJ {
            this.AssetMap.Set(v["name"], v["browser_download_url"])
        }
        return this.AssetMap
    }
    downloadExtensionSplit(DL) {
        Arrays := StrSplit(DL, ".")
        this.filetype := Trim(Arrays[Arrays.Length])
        return this.filetype
    }
    getVersion() {
        url := StrSplit(this.ReleaseVersion, "/")
        version := url[8]
        return version
        ; msgbox % this.j[1].assets.name
        ; return this.j[1].assets.name
    }
    searchReleases(providedSearch) {
        for assetName, DLURL in this.AssetMap {
            if InStr(assetName, providedSearch) {
                return DLURL
            }
            else if InStr(DLURL, providedSearch) {
                return DLURL
            }
        }
    }

    handleUserPath(PathLocal, releaseExtension) {
        if InStr(PathLocal, "\") {
            pathParts := StrSplit(PathLocal, "\")
            FileName := pathParts[pathParts.Length]
        }
        else {
            FileName := PathLocal
            PathLocal := A_ScriptDir "\" FileName
            pathParts := StrSplit(PathLocal, "\")
        }
        if InStr(FileName, ".") {
            FileNameParts := StrSplit(FileName, ".")
            UserExtension := FileNameParts[FileNameParts.Length]
            if (releaseExtension != userExtension) {
                newName := ""
                for key, val in FileNameParts {
                    if (A_Index == FileNameParts.Length) {
                        break
                    }
                    newName .= val
                }
                newPath := ""
                for key, val in pathParts {
                    if (A_Index == pathParts.Length) {
                        break
                    }
                    newPath .= val
                }
                pathWithExtension := newPath newName "." releaseExtension
            }
            else {
                pathWithExtension := PathLocal
            }
        }
        else {
            pathWithExtension := PathLocal "." releaseExtension
        }
        return pathWithExtension
    }


    download(PathLocal, URL := this.FirstAssetDL) {
        releaseExtension := this.downloadExtensionSplit(URL)
        pathWithExtension := this.handleUserPath(PathLocal, releaseExtension)
        Download(URL, pathWithExtension)
    }
}